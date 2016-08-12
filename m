From: Vegard Nossum <vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: ptrace.2: BUGS (missing WIFEXITED notification)
Date: Fri, 12 Aug 2016 16:50:35 +0200
Message-ID: <57ADE23B.8050905@oracle.com>
References: <55520EAC.2010003@oracle.com> <5554A6B0.2090409@gmail.com>
 <5554A8A4.7060404@redhat.com> <20150514162807.GA13385@chrystal.uk.oracle.com>
 <5554CFDF.6070602@redhat.com> <5555C69A.3070509@oracle.com>
 <CAKgNAkixHtPEdmwuVhic8k2gz8ooLmW1rJ3760oWGUC07K-5hg@mail.gmail.com>
 <55826A17.8000804@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050901050503030602070103"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55826A17.8000804-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Quentin Casasnovas <quentin.casasnovas-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------050901050503030602070103
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

(including context for old thread)

On 06/18/2015 08:49 AM, Michael Kerrisk (man-pages) wrote:
> Vegard (and Quentin): Ping!
>
> On 05/15/2015 02:05 PM, Michael Kerrisk (man-pages) wrote:
>> On 15 May 2015 at 12:12, Vegard Nossum <vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org> wrote:
>>> On 05/14/2015 06:39 PM, Denys Vlasenko wrote:
>>>> On 05/14/2015 06:28 PM, Quentin Casasnovas wrote:
>>>>> On Thu, May 14, 2015 at 03:52:36PM +0200, Denys Vlasenko wrote:
>>>>>> On 05/14/2015 03:44 PM, Michael Kerrisk (man-pages) wrote:
>>>>>>>
>>>>>>> Hi Denys,
>>>>>>>
>>>>>>> Do you have any thoughts on the below?
>>>>>>
>>>>>> Yes, the poster is right: this part needs fixing, the behavior is
>>>>>> the same on any kind of process termination.
>>>>>>
>>>>>>> On 05/12/2015 04:31 PM, Vegard Nossum wrote:
>>>>>>>>
>>>>>>>> We hit another edge case in the ptrace() interface and after several
>>>>>>>> hours of chasing it down, we found that it was already described in
>>>>>>>> the
>>>>>>>> "BUGS" section:
>>>>>>>>
>>>>>>>> "If a thread group leader is traced and exits by calling _exit(2), a
>>>>>>
>>>>>> I think a possible fix is just to replace "exits by calling _exit(2)"
>>>>>> part
>>>>>> of the above text with "terminates".
>>>>>
>>>>> Should we also add a little paragraph detailing that waitpid() would hang
>>>>> indefinitely if one thread terminates while the others are in
>>>>> ptrace-stop?
>>>>
>>>> It implies this by saying "but the subsequent WIFEXITED notification
>>>> will not be delivered until all other threads exit".
>>>>
>>>> If another thread is in ptrace-stop, it did not exit yet. Therefore,
>>>> WIFEXITED notification to the thread group leader will not be delivered.
>>>> Therefore, waitpid() on it would hang.
>>>
>>> While I agree that the information in the current man page is strictly
>>> speaking sufficient, I personally still think it would be an improvement
>>> to mention it explicitly (i.e. my proposed change #2 in the original
>>> e-mail). Just because I think it's a sort of non-obvious pitfall; out of
>>> hand, you don't expect a call to waitpid() on a process that has exited
>>> to hang. That's just my opinion, though.
>>
>> That sounds okay to me. Would you and/or Quentin be willing to put
>> together a patch to the man page?
>>

Hi,

Apologies for the delay. Here's a new patch, feel free to munge the
wording if you think it can be improved.


Vegard

--------------050901050503030602070103
Content-Type: text/x-patch;
 name="0001-ptrace.2-clarify-what-happens-when-group-leader-exit.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-ptrace.2-clarify-what-happens-when-group-leader-exit.pa";
 filename*1="tch"

>From 91798cbc674787cf31b66e8cf52557495e659665 Mon Sep 17 00:00:00 2001
From: Vegard Nossum <vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Date: Fri, 12 Aug 2016 16:31:11 +0200
Subject: [PATCH] ptrace.2: clarify what happens when group leader exits

If both the group leader and other threads in the thread group are
being traced and the group leader exits, there will be no notification
of the group leader's exit to the tracer because it still has
unwaited-for children.

In other words, doing waitpid() on the group leader in this situation
will hang indefinitely.

The old wording makes it seem like this only happens when the group
leader calls _exit(), but in fact it happens for any sort of exit:
_exit, exit_group(), and signal death (as explained in the comment by
Denys Vlasenko).

Cc: Quentin Casasnovas <quentin.casasnovas-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Vegard Nossum <vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
---
 man2/ptrace.2 | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git man2/ptrace.2 man2/ptrace.2
index 36d81b9..13bac29 100644
--- man2/ptrace.2
+++ man2/ptrace.2
@@ -2432,8 +2432,7 @@ if that is defined.
 Group-stop notifications are sent to the tracer, but not to real parent.
 Last confirmed on 2.6.38.6.
 .LP
-If a thread group leader is traced and exits by calling
-.BR _exit (2),
+If a thread group leader is traced and exits for any reason,
 .\" Note from Denys Vlasenko:
 .\"     Here "exits" means any kind of death - _exit, exit_group,
 .\"     signal death. Signal death and exit_group cases are trivial,
@@ -2448,7 +2447,14 @@ a
 stop will happen for it (if requested), but the subsequent
 .B WIFEXITED
 notification will not be delivered until all other threads exit.
-As explained above, if one of other threads calls
+(As a corollary, if the other threads in the thread group are being
+traced, they will not exit until they have been either waited for
+and restarted or detached, thereby blocking the exit notification
+of the group leader to
+.BR wait (2)
+and
+.BR waitpid (2).)
+As explained above, if one of the other threads calls
 .BR execve (2),
 the death of the thread group leader will
 .I never
-- 
1.9.1


--------------050901050503030602070103--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
