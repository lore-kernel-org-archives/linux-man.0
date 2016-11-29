From: Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: RFC: documentation of the autogroup feature
Date: Tue, 29 Nov 2016 14:46:15 +0100
Message-ID: <1480427175.10353.77.camel@gmx.de>
References: <41d802dc-873a-ff02-17ff-93ce50f3e925@gmail.com>
         <1479901185.4306.38.camel@gmx.de>
         <327586fa-4672-d070-0ded-850654586273@gmail.com>
         <1479915229.4306.106.camel@gmx.de>
         <8614679c-b1d3-3b35-193d-2ab6eac45aff@gmail.com>
         <1480297574.9163.76.camel@gmx.de>
         <1127218a-dd9b-71a8-845d-3a83969632fc@gmail.com>
         <CAKgNAkiLafr7KJNAo+_kwKQB7ueO-oontNL_FQrGtqitmJpEDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkiLafr7KJNAo+_kwKQB7ueO-oontNL_FQrGtqitmJpEDg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, 2016-11-29 at 10:10 +0100, Michael Kerrisk (man-pages) wrote:
> Let's try and go further. How's this:
> 
>        When scheduling non-real-time  processes  (i.e.,  those  scheduled
>        under  the SCHED_OTHER, SCHED_BATCH, and SCHED_IDLE policies), the
>        CFS scheduler employs a technique known as "group scheduling",  if
>        the  kernel was configured with the CONFIG_FAIR_GROUP_SCHED option
>        (which is typical).
> 
>        Under group scheduling, threads are scheduled  in  "task  groups".
>        Task  groups  have  a  hierarchical relationship, rooted under the
>        initial task group on the system, known as the "root task  group".
>        Task groups are formed in the following circumstances:
> 
>        *  All of the threads in a CPU cgroup form a task group.  The par‐
>           ent of this task group is the task group of  the  corresponding
>           parent cgroup.
> 
>        *  If  autogrouping  is  enabled, then all of the threads that are
>           (implicitly) placed in an autogroup (i.e., the same session, as
>           created by setsid(2)) form a task group.  Each new autogroup is
>           thus a separate task group.  The root task group is the  parent
>           of all such autogroups.
> 
>        *  If  autogrouping  is enabled, then the root task group consists
>           of all processes in the root CPU cgroup that were not otherwise
>           implicitly placed into a new autogroup.
> 
>        *  If  autogrouping is disabled, then the root task group consists
>           of all processes in the root CPU cgroup.
> 
>        *  If group scheduling was disabled (i.e., the kernel was  config‐
>           ured  without  CONFIG_FAIR_GROUP_SCHED),  then  all of the pro‐
>           cesses on the system are notionally placed  in  a  single  task
>           group.

Notionally works for me.

	-Mike
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
