From: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: ptrace.2: BUGS (missing WIFEXITED notification)
Date: Fri, 12 Aug 2016 21:11:08 +0200
Message-ID: <e377efaa-50cb-68e5-d149-0b9b8547efc2@redhat.com>
References: <55520EAC.2010003@oracle.com> <5554A6B0.2090409@gmail.com>
 <5554A8A4.7060404@redhat.com> <20150514162807.GA13385@chrystal.uk.oracle.com>
 <5554CFDF.6070602@redhat.com> <5555C69A.3070509@oracle.com>
 <CAKgNAkixHtPEdmwuVhic8k2gz8ooLmW1rJ3760oWGUC07K-5hg@mail.gmail.com>
 <55826A17.8000804@gmail.com> <57ADE23B.8050905@oracle.com>
 <864524d3-6a7f-9555-b4a4-eb4816c4da18@redhat.com> <57AE1750.50303@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57AE1750.50303-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vegard Nossum <vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Quentin Casasnovas <quentin.casasnovas-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org



On 08/12/2016 08:37 PM, Vegard Nossum wrote:
> On 08/12/2016 06:15 PM, Denys Vlasenko wrote:
>> On 08/12/2016 04:50 PM, Vegard Nossum wrote:
>>   stop will happen for it (if requested), but the subsequent WIFEXITED
>>   notification will not be delivered until all other threads exit.
>> +(As a corollary, if the other threads in the thread group are being
>> +traced, they will not exit until they have been either waited for
>> +and restarted or detached, thereby blocking the exit notification
>> +of the group leader to wait(2) and waitpid(2).)
>>
>>
>> Are you trying to prevent others falling into the same trap you fell into:
>> thinking that if you see PTRACE_EVENT_EXIT on a thread, it has exited?
>
> Yes, or not exactly; more precisely, the trap we fell into was thinking
> that if we see PTRACE_EVENT_EXIT, that means waitpid() will return
> immediately. I know, the distinction is kind of subtle...
>
>> I think your wording is not good at that. How about this?
>>
>>
>>   stop will happen for it (if requested), but the subsequent WIFEXITED
>>   notification will not be delivered until all other threads exit.
>> +(Note that other threads, if they are traced and are in
>> +PTRACE_EVENT_EXIT ptrace-stop, they did not exit yet.
>> +If you assume otherwise and wait on a thread leader to exit now,
>> +this may hang.
>> +You need to restart or detach them for them to exit. Generally,
>> +only seeing WIFEXITED or WIFSIGNALED status from the thread is
>> +a definite sign that it exited).
>
> Alright, another iteration on your version gives the following:
>
> """
> Keep in mind that other threads in the thread group which are in a
> PTRACE_EVENT_EXIT ptrace-stop have not actually exited yet. This means
> that attempting to wait for the group leader with waitpid() will hang
> indefinitely. In order prevent this, you must make sure that the other
> threads exit properly by either restarting them or detaching from them.
> In general, only WIFEXITED and WIFSIGNALED indicate that the child
> has definitely exited.
> """

Looks good. Let's shorten it a bit:

Keep in mind that other threads in the thread group which are in a
PTRACE_EVENT_EXIT ptrace-stop have not exited yet.
Attempting to wait for the group leader with waitpid() will hang
indefinitely. You should make sure that all other threads
exit properly by restarting them or detaching from them.
In general, only WIFEXITED and WIFSIGNALED status indicate that
a thread has definitely exited.

This looks ok to me.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
