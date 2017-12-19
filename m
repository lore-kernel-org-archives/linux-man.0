From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RFC] stat.2: Document that stat can fail with EINTR
Date: Tue, 19 Dec 2017 14:57:28 +0100
Message-ID: <02dadf3a-d027-1734-e76c-1db7bac8ce1c@gmail.com>
References: <20171203002359.GA17037@juliacomputing.com>
 <20171203022504.GA14505@bombadil.infradead.org>
 <CABV8kRwbsjW1XbybDx12HmC9Gd1_5_C-KDhdtEz12KSZf-84_Q@mail.gmail.com>
 <24ffa267-4d45-e6e8-2441-f82ce47ad725@gmail.com>
 <CABV8kRyFqU8K_7=rEpbLKE73n6sdsP2ATbNmtLMrRMvSG_fTYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABV8kRyFqU8K_7=rEpbLKE73n6sdsP2ATbNmtLMrRMvSG_fTYA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Matthew Wilcox <willy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org, tuomas-yrGDUoBaLx3QT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Hi Keno,

On 12/04/2017 10:03 PM, Keno Fischer wrote:
> Hi Michael,
> 
> I was hoping to get a clear statement one way or another from the kernel
> maintainers as to whether an EINTR from stat() is supposed to be allowed
> kernel behavior (hence the RFC in the subject). If it's not, then I don't think
> it should be documented, even if there is buggy filesystems that do at
> the moment.
> So I'd say let's hold off on applying this until more people have had a chance
> to comment. If it would be more convenient for you, feel free to drop
> this from your
> patch queue and if appropriate, I'll resend a non-RFC version of this
> patch for you
> to apply, once a conclusion has been reached.

So, was there any further conclusion on this?

Cheers,

Michael

> On Mon, Dec 4, 2017 at 3:58 PM, Michael Kerrisk (man-pages)
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hello Keno
>>
>> On 12/03/2017 04:15 AM, Keno Fischer wrote:
>>> Resending as plain text (apologies for those receiving it twice, and
>>> those that got
>>> an HTML copy, I'm used to my mail client switching that over
>>> automatically, which
>>> for some reason didn't happen here).
>>>
>>>
>>> This is exactly the discussion I want to generate, so thank you.
>>> I should point out that I'm not advocating for anything other
>>> than clarity of what kernel behavior user space may assume.
>>
>> So, should the documentation patch be applied at this point, or dropped?
>>
>> Thanks,
>>
>> Michael
>>
>>
>>> On Sat, Dec 2, 2017 at 9:25 PM, Matthew Wilcox <willy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wrote:
>>>> On Sat, Dec 02, 2017 at 07:23:59PM -0500, Keno Fischer wrote:
>>>>> The catalyst for this patch was me experiencing EINTR errors when
>>>>> using the 9p file system. In linux commit 9523feac, the 9p file
>>>>> system was changed to use wait_event_killable instead of
>>>>> wait_event_interruptible, which does indeed address my problem,
>>>>> but also makes me a bit unhappy, because uninterruptable waits
>>>>> prevents things like ^C'ing the execution and some debugging
>>>>> tools which depend on being able to cancel long-running operations
>>>>> by sending signals.
>>>>
>>>> Wait, wait, wait.  killable is not uninterruptible.  It's "can accept
>>>> a signal if the signal is fatal".  ie userspace will never see it.
>>>> So, no, it doesn't prevent ^C.  It does prevent the debugging tool you're
>>>> talking about from working, because it's handling the signal, so it's not
>>>> fatal.
>>>
>>> This probably shows that I've been in REPL based environments too long,
>>> that catch SIGINT ;). You are of course correct that a fatal SIGINT would
>>> still be delivered.
>>>
>>>>> I realize I'm probably 20 years too late here, but it feels like
>>>>> clarificaion on what to expect from the kernel would still go a long
>>>>> way here.
>>>>
>>>> A change to user-visible behaviour has to be opt-in.
>>>
>>> I agree. However, it was my impression that stat() can return EINTR
>>> depending on the file system. Prior to the referenced commit,
>>> this was certainly true on 9p and I suspect it's not the only network file
>>> system for which this is true (though prior to my experiencing this
>>> with 9p, the only
>>> time I've ever experienced it was on HPC clusters with who knows what
>>> code providing the network filesystem). If it is indeed the case that
>>> an EINTR return from stat() and similar is illegal and should be considered
>>> a kernel bug, a statement to that extent all I'm looking for here.
>>>
>>
>>
>> --
>> Michael Kerrisk
>> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
>> Linux/UNIX System Programming Training: http://man7.org/training/
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
