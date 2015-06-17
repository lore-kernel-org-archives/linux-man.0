From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: sysctl_writes_strict documentation + an oddity?
Date: Wed, 17 Jun 2015 11:09:35 +0200
Message-ID: <5581394F.2030900@gmail.com>
References: <554DCB33.8080101@gmail.com>	<CAGXu5jL-9ZMDXPCNkhEB+jzVxHcK6Sa4gwg16kn60epwT+gJAQ@mail.gmail.com>	<557FF484.9000207@gmail.com> <CAGXu5jKoJWRCFak9s_=OLk5CsMZVTaBmOAPz2ti-oLDJBK_98g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGXu5jKoJWRCFak9s_=OLk5CsMZVTaBmOAPz2ti-oLDJBK_98g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Kees,

On 06/16/2015 06:32 PM, Kees Cook wrote:
> On Tue, Jun 16, 2015 at 3:03 AM, Michael Kerrisk (man-pages)
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 06/04/2015 09:36 PM, Kees Cook wrote:
>>> On Sat, May 9, 2015 at 1:54 AM, Michael Kerrisk (man-pages)
>>> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>> ===== 2) Behavior puzzle (a) =====
>>>>
>>>> The last sentence quoted from the man page was based on your sentence
>>>>
>>>>     Writes to numeric sysctl entries must always be at file position 0
>>>>     and the value must be fully contained in the buffer sent in the write
>>>>     syscall.
>>>>
>>>> So, I had interpreted /proc/sys/kernel/sysctl_writes_strict==1 to
>>>> mean that if one writes into a numeric /proc/sys file at an offset
>>>> other than zero, the write() will fail with some kind of error.
>>>
>>> Reporting back an error wasn't something I'd tested before. Looking at
>>> the code again now, it should be possible make this change.
>>> Regardless, in the case of the numeric value error condition, it's the
>>> same as the "past the end" string error condition: "Anything written
>>> beyond the maximum length of the value buffer will be ignored." i.e.
>>> anything other than file offset 0 is considered "past the end of the
>>> buffer" for a numeric value and is ignored.
>>>
>>>> But this seems not to be the case. Instead, the write() succeeds,
>>>> but the file is left unmodified. That's surprising, I find. So, I'm
>>>> wondering whether the implementation deviates from your intention.
>>>>
>>>> There's a test program below, which takes arguments as follows
>>>>
>>>>     ./a.out pathname offset string
>>>
>>> I have tests in tools/testing/selftests/sysctl for checking the
>>> various behaviors too. They don't actually examine any error
>>> conditions from the sysctl writing itself. It should be simple to make
>>> sysctl_writes_strict failures return an error, though.
>>
>> So, what do you think: is it *desirable* to make sysctl_writes_strict
>> failures return an error?
> 
> I think it would be desirable, yes. I want to improve the tests to add
> error checking first, so I can make sure the change doesn't introduce
> anything unexpected. The fix is simple, but since the code is a little
> twisty, I want to be careful.

Okay.

>>>> ===== 2) Behavior puzzle (b) =====
>>>>
>>>> In commit f88083005ab319abba5d0b2e4e997558245493c8, there is this note:
>>>>
>>>>     This adds the sysctl kernel.sysctl_writes_strict to control the write
>>>>     behavior.  The default (0) reports when VFS position is non-0 on a
>>>>     write, but retains legacy behavior, -1 disables the warning, and 1
>>>>     enables the position-respecting behavior.
>>>>
>>>>     The long-term plan here is to wait for userspace to be fixed in response
>>>>     to the new warning and to then switch the default kernel behavior to the
>>>>     new position-respecting behavior.
>>>>
>>>> (That last para was added to the commit message by AKPM, I see.)
>>>>
>>>> But, I wonder here whether /proc/sys/kernel/sysctl_writes_strict==0
>>>> is going to help with the long-term plan. The problem is that in
>>>> warn_sysctl_write(), pr_warn_once() is used. This means that only
>>>> the first offending user-space application that writes to *any*
>>>> /proc/sys file will generate the printk warning. If that application
>>>> isn't fixed, then none of the other "broken" applications will be
>>>> discovered. It therefore seems possible that it could be a very long
>>>> time before we could "switch the default kernel behavior to the
>>>> new position-respecting behavior".
>>>>
>>>> Looking over old mails
>>>> (http://thread.gmane.org/gmane.linux.kernel/1695177/focus=23240),
>>>> I see that you're aware of the problem, but it seems to me that
>>>> the switch to pr_warn_once() (for fear of spamming the log) likely
>>>> dooms the long-term plan to failure. Your thoughts?
>>>
>>> In actual regular use, the situation that triggers the warning should
>>> be vanishingly rare, but the condition can be trivially met by someone
>>> intending to hit it for the purposes of filling log files. As such, it
>>> makes sense to me to use _once to avoid spamming, but still catch a
>>> rare usage under normal conditions.
>>
>> So, I'm not clear whether you think I'm wrong or not ;-).
>> Do you disagree with my point that this approach may doom
>> the long-term project to failure? (That was my main point.)
> 
> Sorry! No, I don't think using pr_warn_once() will doom the
> transition. I think that if we see the warning, we need to investigate
> what's using sysctl that way. If we never see it, then we can switch
> the default. (Using _once protects against log spamming.) I would
> basically expect to never see this warning, but akpm wanted to be very
> cautious, which I can't argue with. :)

Okay.

The man-pages text above will go out with the next release. Thanks
for your help!

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
