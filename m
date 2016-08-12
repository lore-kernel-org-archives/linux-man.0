From: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: ptrace.2: BUGS (missing WIFEXITED notification)
Date: Fri, 12 Aug 2016 18:15:17 +0200
Message-ID: <864524d3-6a7f-9555-b4a4-eb4816c4da18@redhat.com>
References: <55520EAC.2010003@oracle.com> <5554A6B0.2090409@gmail.com>
 <5554A8A4.7060404@redhat.com> <20150514162807.GA13385@chrystal.uk.oracle.com>
 <5554CFDF.6070602@redhat.com> <5555C69A.3070509@oracle.com>
 <CAKgNAkixHtPEdmwuVhic8k2gz8ooLmW1rJ3760oWGUC07K-5hg@mail.gmail.com>
 <55826A17.8000804@gmail.com> <57ADE23B.8050905@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57ADE23B.8050905-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vegard Nossum <vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Quentin Casasnovas <quentin.casasnovas-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 08/12/2016 04:50 PM, Vegard Nossum wrote:
> (including context for old thread)
>
> On 06/18/2015 08:49 AM, Michael Kerrisk (man-pages) wrote:
>> Vegard (and Quentin): Ping!
>>
>> On 05/15/2015 02:05 PM, Michael Kerrisk (man-pages) wrote:
>>> On 15 May 2015 at 12:12, Vegard Nossum <vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org> wrote:
>>>> On 05/14/2015 06:39 PM, Denys Vlasenko wrote:
>>>>> On 05/14/2015 06:28 PM, Quentin Casasnovas wrote:
>>>>>> On Thu, May 14, 2015 at 03:52:36PM +0200, Denys Vlasenko wrote:
>>>>>>> On 05/14/2015 03:44 PM, Michael Kerrisk (man-pages) wrote:
>>>>>>>>
>>>>>>>> Hi Denys,
>>>>>>>>
>>>>>>>> Do you have any thoughts on the below?
>>>>>>>
>>>>>>> Yes, the poster is right: this part needs fixing, the behavior is
>>>>>>> the same on any kind of process termination.
>>>>>>>
>>>>>>>> On 05/12/2015 04:31 PM, Vegard Nossum wrote:
>>>>>>>>>
>>>>>>>>> We hit another edge case in the ptrace() interface and after several
>>>>>>>>> hours of chasing it down, we found that it was already described in
>>>>>>>>> the
>>>>>>>>> "BUGS" section:
>>>>>>>>>
>>>>>>>>> "If a thread group leader is traced and exits by calling _exit(2), a
>>>>>>>
>>>>>>> I think a possible fix is just to replace "exits by calling _exit(2)"
>>>>>>> part
>>>>>>> of the above text with "terminates".
>>>>>>
>>>>>> Should we also add a little paragraph detailing that waitpid() would hang
>>>>>> indefinitely if one thread terminates while the others are in
>>>>>> ptrace-stop?
>>>>>
>>>>> It implies this by saying "but the subsequent WIFEXITED notification
>>>>> will not be delivered until all other threads exit".
>>>>>
>>>>> If another thread is in ptrace-stop, it did not exit yet. Therefore,
>>>>> WIFEXITED notification to the thread group leader will not be delivered.
>>>>> Therefore, waitpid() on it would hang.
>>>>
>>>> While I agree that the information in the current man page is strictly
>>>> speaking sufficient, I personally still think it would be an improvement
>>>> to mention it explicitly (i.e. my proposed change #2 in the original
>>>> e-mail). Just because I think it's a sort of non-obvious pitfall; out of
>>>> hand, you don't expect a call to waitpid() on a process that has exited
>>>> to hang. That's just my opinion, though.
>>>
>>> That sounds okay to me. Would you and/or Quentin be willing to put
>>> together a patch to the man page?
>>>
>
> Hi,
>
> Apologies for the delay. Here's a new patch, feel free to munge the
> wording if you think it can be improved.

-If a thread group leader is traced and exits by calling
-.BR _exit (2),
+If a thread group leader is traced and exits for any reason,
  .\" Note from Denys Vlasenko:


This looks good to me.


  stop will happen for it (if requested), but the subsequent WIFEXITED
  notification will not be delivered until all other threads exit.
+(As a corollary, if the other threads in the thread group are being
+traced, they will not exit until they have been either waited for
+and restarted or detached, thereby blocking the exit notification
+of the group leader to wait(2) and waitpid(2).)


Are you trying to prevent others falling into the same trap you fell into:
thinking that if you see PTRACE_EVENT_EXIT on a thread, it has exited?
I think your wording is not good at that. How about this?


  stop will happen for it (if requested), but the subsequent WIFEXITED
  notification will not be delivered until all other threads exit.
+(Note that other threads, if they are traced and are in
+PTRACE_EVENT_EXIT ptrace-stop, they did not exit yet.
+If you assume otherwise and wait on a thread leader to exit now,
+this may hang.
+You need to restart or detach them for them to exit. Generally,
+only seeing WIFEXITED or WIFSIGNALED status from the thread is
+a definite sign that it exited).
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
