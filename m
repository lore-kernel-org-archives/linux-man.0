From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: RFC: documentation of the autogroup feature
Date: Tue, 29 Nov 2016 10:10:22 +0100
Message-ID: <CAKgNAkiLafr7KJNAo+_kwKQB7ueO-oontNL_FQrGtqitmJpEDg@mail.gmail.com>
References: <41d802dc-873a-ff02-17ff-93ce50f3e925@gmail.com>
 <1479901185.4306.38.camel@gmx.de> <327586fa-4672-d070-0ded-850654586273@gmail.com>
 <1479915229.4306.106.camel@gmx.de> <8614679c-b1d3-3b35-193d-2ab6eac45aff@gmail.com>
 <1480297574.9163.76.camel@gmx.de> <1127218a-dd9b-71a8-845d-3a83969632fc@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1127218a-dd9b-71a8-845d-3a83969632fc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[Resending because of bounces from the lists. (Somehow my mailer
messed up the MIME labeling)]

Hi Mike,

On 11/28/2016 02:46 AM, Mike Galbraith wrote:
> On Sun, 2016-11-27 at 22:13 +0100, Michael Kerrisk (man-pages) wrote:
>
>> Here's my attempt to define the root task group:
>>
>>        *  If autogrouping is disabled, then all processes in the root CP=
U
>>           cgroup form a scheduling group (sometimes called the "root tas=
k
>>           group").
>>
>> Can you improve on this?

The below is helpful, but...

> A task group is a set of percpu runqueues.

The explanation needs really to be in terms of what user-space
understands and sees. "Runqueues" are a kernel scheduler implementation
detail.

> The root task group is the
> top level set in a hierarchy of such sets when group scheduling is
> enabled, or the only set when group scheduling is not enabled.  The
> autogroup hierarchy has a depth of one, ie all autogroups are peers
> who's common parent is the root task group.

Let's try and go further. How's this:

       When scheduling non-real-time  processes  (i.e.,  those  scheduled
       under  the SCHED_OTHER, SCHED_BATCH, and SCHED_IDLE policies), the
       CFS scheduler employs a technique known as "group scheduling",  if
       the  kernel was configured with the CONFIG_FAIR_GROUP_SCHED option
       (which is typical).

       Under group scheduling, threads are scheduled  in  "task  groups".
       Task  groups  have  a  hierarchical relationship, rooted under the
       initial task group on the system, known as the "root task  group".
       Task groups are formed in the following circumstances:

       *  All of the threads in a CPU cgroup form a task group.  The par=E2=
=80=90
          ent of this task group is the task group of  the  corresponding
          parent cgroup.

       *  If  autogrouping  is  enabled, then all of the threads that are
          (implicitly) placed in an autogroup (i.e., the same session, as
          created by setsid(2)) form a task group.  Each new autogroup is
          thus a separate task group.  The root task group is the  parent
          of all such autogroups.

       *  If  autogrouping  is enabled, then the root task group consists
          of all processes in the root CPU cgroup that were not otherwise
          implicitly placed into a new autogroup.

       *  If  autogrouping is disabled, then the root task group consists
          of all processes in the root CPU cgroup.

       *  If group scheduling was disabled (i.e., the kernel was  config=E2=
=80=90
          ured  without  CONFIG_FAIR_GROUP_SCHED),  then  all of the pro=E2=
=80=90
          cesses on the system are notionally placed  in  a  single  task
          group.

       [To be followed by a discussion of the nice value and task groups]

?

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
