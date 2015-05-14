From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ptrace.2: BUGS (missing WIFEXITED notification)
Date: Thu, 14 May 2015 15:44:16 +0200
Message-ID: <5554A6B0.2090409@gmail.com>
References: <55520EAC.2010003@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55520EAC.2010003-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Vegard Nossum <vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Quentin Casasnovas <quentin.casasnovas-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Denys,

Do you have any thoughts on the below?

Cheers,

Michael

On 05/12/2015 04:31 PM, Vegard Nossum wrote:
> [resend with Cc: linux-man]
> 
> Hi again :-)
> 
> We hit another edge case in the ptrace() interface and after several
> hours of chasing it down, we found that it was already described in the
> "BUGS" section:
> 
> "If a thread group leader is traced and exits by calling _exit(2), a
> PTRACE_EVENT_EXIT stop will happen for it (if requested), but the
> subsequent WIFEXITED notification will not be delivered until all other
> threads exit. As explained above, if one of other threads calls
> execve(2), the death of the thread group leader will never be reported.
> If the execed thread is not traced by this tracer, the tracer will never
> know that execve(2) happened. One possible workaround is to
> PTRACE_DETACH the thread group leader instead of restarting it in this
> case. Last confirmed on 2.6.38.6."
> 
> I wanted to write that we've also noticed the same thing not only for
> _exit() but also for terminating signals, however we also came across
> this bit in the manual source:
> 
> .\" Note from Denys Vlasenko:
> .\" Here "exits" means any kind of death - _exit, exit_group,
> .\" signal death. Signal death and exit_group cases are trivial,
> .\" though: since signal death and exit_group kill all other threads
> .\" too, "until all other threads exit" thing happens rather soon
> .\" in these cases. Therefore, only _exit presents observably
> .\" puzzling behavior to ptrace users: thread leader _exit's,
> .\" but WIFEXITED isn't reported! We are trying to explain here
> .\" why it is so.
> 
> There is a difference, however -- this behaviour can also be observed
> for the other types of death if you are currently tracing the other
> threads too!
> 
> In other words, when multiple threads are being traced and the group
> leader exits, waitpid() on this group leader will hang indefinitely
> (because the other threads won't exit until we wait for and CONT/DETACH
> them, and we don't receive the exit notification for the group leader
> until the other threads have really exited).
> 
> To me, this means that not only _exit() but also other types of death
> present "observably puzzling behavior to ptrace users".
> 
> I'd propose the following changes:
> 
> 1) include some (if not all) of Denys's explanation in the actual text:
> 
> -If a thread group leader is traced and exits by calling _exit(2)...
> +If a thread group leader is traced and exits for any reason (_exit,
> exit_group, signal death, etc.), ...
> 
> 2) include the bits about tracing other threads:
> 
> +If the other threads in the thread group are being traced, they will
> not exit until they have been either waited for and restarted or
> detached, thereby blocking the exit notification (WIFEXITED) of the
> group leader to wait()/waitpid().
> 
> 3) there's a typo in the original text:
> 
> -one of other threads
> +one of the other threads
> 
> Feel free to rephrase any of the above.
> 
> Thoughts? We can also provide more details, including a reproducer, or
> clarification if needed.
> 
> (PS: Please also credit Quentin Casasnovas with the report as we've both
> spent more than a few hours tracking this down!)
> 
> 
> Vegard
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
