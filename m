From: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: ptrace.2: BUGS (missing WIFEXITED notification)
Date: Thu, 14 May 2015 15:52:36 +0200
Message-ID: <5554A8A4.7060404@redhat.com>
References: <55520EAC.2010003@oracle.com> <5554A6B0.2090409@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5554A6B0.2090409-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Vegard Nossum <vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Quentin Casasnovas <quentin.casasnovas-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/14/2015 03:44 PM, Michael Kerrisk (man-pages) wrote:
> Hi Denys,
> 
> Do you have any thoughts on the below?

Yes, the poster is right: this part needs fixing, the behavior is
the same on any kind of process termination.


> On 05/12/2015 04:31 PM, Vegard Nossum wrote:
>> We hit another edge case in the ptrace() interface and after several
>> hours of chasing it down, we found that it was already described in the
>> "BUGS" section:
>>
>> "If a thread group leader is traced and exits by calling _exit(2), a

I think a possible fix is just to replace "exits by calling _exit(2)" part
of the above text with "terminates".

>> PTRACE_EVENT_EXIT stop will happen for it (if requested), but the
>> subsequent WIFEXITED notification will not be delivered until all other
>> threads exit. As explained above, if one of other threads calls
>> execve(2), the death of the thread group leader will never be reported.
>> If the execed thread is not traced by this tracer, the tracer will never
>> know that execve(2) happened. One possible workaround is to
>> PTRACE_DETACH the thread group leader instead of restarting it in this
>> case. Last confirmed on 2.6.38.6."
>>
>> I wanted to write that we've also noticed the same thing not only for
>> _exit() but also for terminating signals, however we also came across
>> this bit in the manual source:
>>
>> .\" Note from Denys Vlasenko:
>> .\" Here "exits" means any kind of death - _exit, exit_group,
>> .\" signal death. Signal death and exit_group cases are trivial,
>> .\" though: since signal death and exit_group kill all other threads
>> .\" too, "until all other threads exit" thing happens rather soon
>> .\" in these cases. Therefore, only _exit presents observably
>> .\" puzzling behavior to ptrace users: thread leader _exit's,
>> .\" but WIFEXITED isn't reported! We are trying to explain here
>> .\" why it is so.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
