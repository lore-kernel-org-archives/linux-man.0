From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: sched_{set,get}attr() manpage
Date: Tue, 29 Apr 2014 15:08:55 +0200
Message-ID: <535FA467.2070403@gmail.com>
References: <20131217122720.950475833@infradead.org> <20131217123352.692059839@infradead.org> <CAHO5Pa3=+Zhg72tVfddSUvgirUyObir6atJVo4_16bVWB2Osgw@mail.gmail.com> <20140121153851.GZ31570@twins.programming.kicks-ass.net> <CAKgNAkgw+U44SH0wd_06ZMXaCC9nCX4NZxZHkMKUdC7E7YxBhQ@mail.gmail.com> <20140214161929.GL27965@twins.programming.kicks-ass.net> <53020C9D.1050208@gmail.com> <20140428081858.GX13658@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140428081858.GX13658-ndre7Fmf5hadTX5a5knrm8zTDFooKrT+cvkQGrU6aU0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Dario Faggioli <raistlin-k2GhghHVRtY@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, fweisbec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, darren-P76s1CtE8BHQT0dZR+AlfA@public.gmane.org, johan.eker-IzeFyvvaP7pWk0Htik3J/w@public.gmane.org, p.faure-et3tyl94nDNyDzI6CaY1VQ@public.gmane.org, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, claudio-YOzL5CV4y4YG1A2ADO40+w@public.gmane.org, michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, fchecconi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tommaso.cucinotta-gAmJrWFzCps@public.gmane.org, juri.lelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, nicola.manica-+cHZLFJ93xAO91npARCAeA@public.gmane.org, luca.abeni-3IIOeSMMxS4@public.gmane.org, dhaval.giani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hgu1972-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Paul McKenney <paulmck-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, insop.song-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, liming.wang-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org, jkacur-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Peter,

On 04/28/2014 10:18 AM, Peter Zijlstra wrote:
> Hi Michael,
>=20
> find below an updated manpage, I did not apply the comments on parts
> that are identical to SCHED_SETSCHEDULER(2) in order to keep these te=
xts
> in alignment. I feel that if we change one we should also change the
> other, and such a 'patch' is best done separate from the new manpage
> itself.
>=20
> I did add the missing EBUSY error, and amended the text where it said
> we'd return EINVAL in that case.
>=20
> I added a paragraph stating that SCHED_DEADLINE preempted anything el=
se
> userspace can do (with the explicit mention of userspace to leave me
> wriggle room for the kernel's stop task :-).
>=20
> I also did a short paragraph on the deadline sched_yield(). For furth=
er
> deadline yield details we should maybe add to the SCHED_YIELD(2)
> manpage.
>=20
> Re juri/claudio; no I think sched_yield() as implemented for deadline
> makes sense, no other yield semantics other than NOP makes sense for =
it,
> and since we have the syscall already might as well make it do someth=
ing
> useful.

Thanks for the updated page. Would you be willing
to revise as per the comments below.


> NAME
> 	sched_setattr, sched_getattr - set and get scheduling policy/attribu=
tes
>=20
> SYNOPSIS
> 	#include <sched.h>
>=20
> 	struct sched_attr {
> 		u32 size;
> 		u32 sched_policy;
> 		u64 sched_flags;
>=20
> 		/* SCHED_NORMAL, SCHED_BATCH */
> 		s32 sched_nice;
> 		/* SCHED_FIFO, SCHED_RR */
> 		u32 sched_priority;
> 		/* SCHED_DEADLINE */
> 		u64 sched_runtime;
> 		u64 sched_deadline;
> 		u64 sched_period;
> 	};
> 	int sched_setattr(pid_t pid, const struct sched_attr *attr, unsigned=
 int flags);
>=20
> 	int sched_getattr(pid_t pid, const struct sched_attr *attr, unsigned=
 int size, unsigned int flags);
>=20
> DESCRIPTION
> 	sched_setattr() sets both the scheduling policy and the
> 	associated attributes for the process whose ID is specified in
> 	pid. =20

Around about here, I think there needs to be a sentence explaining
that sched_setattr() provides a superset of the functionality of=20
sched_setscheduler(2) and setpritority(2). I mean, it can do all that=20
those two calls can do, right?

> If pid equals zero, the scheduling policy and attributes
> 	of the calling process will be set.  The interpretation of the
> 	argument attr depends on the selected policy.  Currently, Linux
> 	supports the following "normal" (i.e., non-real-time) scheduling
> 	policies:
>=20
> 	SCHED_OTHER	the standard "fair" time-sharing policy;
>=20
> 	SCHED_BATCH	for "batch" style execution of processes; and
>=20
> 	SCHED_IDLE	for running very low priority background jobs.
>=20
> 	The following "real-time" policies are also supported, for
> 	special time-critical applications that need precise control
> 	over the way in which runnable processes are selected for
> 	execution:
>=20
> 	SCHED_FIFO	a first-in, first-out policy;
>=20
> 	SCHED_RR	a round-robin policy; and
>=20
> 	SCHED_DEADLINE	a deadline policy.
>=20
> 	The semantics of each of these policies are detailed below.

The semantics of each of these policies are detailed in sched(7).

[See my comments below]

>=20
> 	sched_attr::size must be set to the size of the structure, as in
> 	sizeof(struct sched_attr), if the provided structure is smaller
> 	than the kernel structure, any additional fields are assumed
> 	'0'. If the provided structure is larger than the kernel
> 	structure, the kernel verifies all additional fields are '0' if
> 	not the syscall will fail with -E2BIG.
>=20
> 	sched_attr::sched_policy the desired scheduling policy.
>=20
> 	sched_attr::sched_flags additional flags that can influence
> 	scheduling behaviour. Currently as per Linux kernel 3.14:
>=20
> 		SCHED_FLAG_RESET_ON_FORK - resets the scheduling policy
> 		to: (struct sched_attr){ .sched_policy =3D SCHED_OTHER, }
> 		on fork().
>=20
> 	is the only supported flag.
>=20
> 	sched_attr::sched_nice should only be set for SCHED_OTHER,
> 	SCHED_BATCH, the desired nice value [-20,19], see NICE(2).
>=20
> 	sched_attr::sched_priority should only be set for SCHED_FIFO,
> 	SCHED_RR, the desired static priority [1,99].
>=20
> 	sched_attr::sched_runtime
> 	sched_attr::sched_deadline
> 	sched_attr::sched_period should only be set for SCHED_DEADLINE
> 	and are the traditional sporadic task model parameters.

Could you add (a lot ;-)) more detail on these three fields? Assume the
reader does not know about this traditional sporadic task model, and=20
then give some explanation of what these three fields do. Probably, at
this point you can work in some statement  about the admission control
test.

[but, see my comment below. It may be that sched(7) is a better
place for this detail.

> 	The flags argument should be 0.
>=20
> 	sched_getattr() queries the scheduling policy currently applied
> 	to the process identified by pid.  If pid equals zero, the
> 	policy of the calling process will be retrieved.
>=20
> 	The size argument should reflect the size of struct sched_attr
> 	as known to userspace. The kernel fills out sched_attr::size to
> 	the size of its sched_attr structure. If the user provided
> 	structure is larger, additional fields are not touched. If the
> 	user provided structure is smaller, but the kernel needs to
> 	return values outside the provided space, the syscall will fail
> 	with -E2BIG.
>=20
> 	The flags argument should be 0.
>=20
> 	The other sched_attr fields are filled out as described in
> 	sched_setattr().

I assume that everything between my [[[ and ]]] blocks below is taken s=
traight=20
from sched_setscheduler(2). (If that is not true, please let me know.)
This reminds me that there is a structural fault in this part of man-pa=
ges ;-).
The problem is sched_setscheduler(2) currently tries to do two things:

[a] Document the sched_setscheduler() and sched_scheduler system calls
[b] Provide and overview od scheduling policies and parameters.

It should really only do the former. I have now gone through the task o=
f
separating [b] out into a separate page, sched(7), which other pages,
such as sched_setscheduler(2) and sched_setattr(2) can refer to. You
can see the current versions of sched_setscheduelr.2 and sched.7 in Git
(https://www.kernel.org/doc/man-pages/download.html )

So, what I would ideally like to see

[1] A page describing the sched_setattr() and sched_getattr() APIs
[2] A piece of text describing the SCHED_DEADLINE policy, which I can
drop into sched(7).

Could you revise like that?

[[[[
>    Scheduling Policies
>        The  scheduler  is  the  kernel  component  that decides which=
 runnable
>        process will be executed by the CPU next.  Each process has an=
  associ=E2=80=90
>        ated  scheduling  policy and a static scheduling priority, sch=
ed_prior=E2=80=90
>        ity; these are the settings that are modified by  sched_setsch=
eduler().
>        The  scheduler  makes it decisions based on knowledge of the s=
cheduling
>        policy and static priority of all processes on the system.
>=20
>        For processes scheduled under one of  the  normal  scheduling =
 policies
>        (SCHED_OTHER,  SCHED_IDLE,  SCHED_BATCH), sched_priority is no=
t used in
>        scheduling decisions (it must be specified as 0).
>=20
>        Processes scheduled under one of the  real-time  policies  (SC=
HED_FIFO,
>        SCHED_RR)  have  a  sched_priority  value  in  the  range 1 (l=
ow) to 99
>        (high).  (As the numbers imply, real-time processes always hav=
e  higher
>        priority than normal processes.)  Note well: POSIX.1-2001 only=
 requires
>        an implementation to support a minimum 32 distinct priority le=
vels  for
>        the  real-time  policies,  and  some  systems supply just this=
 minimum.
>        Portable   programs   should    use    sched_get_priority_min(=
2)    and
>        sched_get_priority_max(2) to find the range of priorities supp=
orted for
>        a particular policy.
>=20
>        Conceptually, the scheduler maintains a list of runnable proce=
sses  for
>        each  possible  sched_priority  value.   In  order  to  determ=
ine which
>        process runs next, the scheduler looks for the nonempty list  =
with  the
>        highest  static  priority  and  selects the process at the hea=
d of this
>        list.
>=20
>        A process's scheduling policy determines where it will be inse=
rted into
>        the  list  of processes with equal static priority and how it =
will move
>        inside this list.
>=20
>        All scheduling is preemptive: if a process with a higher stati=
c  prior=E2=80=90
>        ity  becomes  ready  to run, the currently running process wil=
l be pre=E2=80=90
>        empted and returned to the wait list for  its  static  priorit=
y  level.
>        The  scheduling  policy only determines the ordering within th=
e list of
>        runnable processes with equal static priority.
]]]]

>     SCHED_DEADLINE: Sporadic task model deadline scheduling
>        SCHED_DEADLINE is an implementation of GEDF (Global Earliest
>        Deadline First) with additional CBS (Constant Bandwidth Server=
).
>        The CBS guarantees that tasks that over-run their specified
>        budget are throttled and do not affect the correct performance
>        of other SCHED_DEADLINE tasks.
>=20
>        SCHED_DEADLINE tasks will fail FORK(2) with -EAGAIN
>=20
>        Setting SCHED_DEADLINE can fail with -EBUSY when admission
>        control tests fail.
>=20
>        Because of the nature of (G)EDF, SCHED_DEADLINE tasks are the
>        highest priority (user controllable) tasks in the system, if a=
ny
>        SCHED_DEADLINE task is runnable it will preempt anything
>        FIFO/RR/OTHER/BATCH/IDLE task out there.
>=20
>        A SCHED_DEADLINE task calling sched_yield() will 'yield' the
>        current job and wait for a new period to begin.

This is the piece that could go into sched(7), but I'd like it to inclu=
de
a discussion of deadline, period, and runtime.

[[[[
=20
>    SCHED_FIFO: First In-First Out scheduling
>        SCHED_FIFO can only be used with static priorities higher than=
 0, which
>        means that when a SCHED_FIFO processes becomes runnable, it wi=
ll always
>        immediately preempt any currently running SCHED_OTHER, SCHED_B=
ATCH,  or
>        SCHED_IDLE  process.  SCHED_FIFO is a simple scheduling algori=
thm with=E2=80=90
>        out time slicing.  For processes scheduled under the SCHED_FIF=
O policy,
>        the following rules apply:
>=20
>        *  A  SCHED_FIFO  process that has been preempted by another p=
rocess of
>           higher priority will stay at the head of the list for  its =
 priority
>           and  will resume execution as soon as all processes of high=
er prior=E2=80=90
>           ity are blocked again.
>=20
>        *  When a SCHED_FIFO process becomes runnable, it will be  ins=
erted  at
>           the end of the list for its priority.
>=20
>        *  A  call  to  sched_setscheduler()  or sched_setparam(2) wil=
l put the
>           SCHED_FIFO (or SCHED_RR) process identified by pid at the  =
start  of
>           the  list  if it was runnable.  As a consequence, it may pr=
eempt the
>           currently  running  process   if   it   has   the   same   =
priority.
>           (POSIX.1-2001 specifies that the process should go to the e=
nd of the
>           list.)
>=20
>        *  A process calling sched_yield(2) will be put at the end of =
the list.
>=20
>        No other events will move a process scheduled under the SCHED_=
=46IFO pol=E2=80=90
>        icy in the wait list of runnable processes with equal static p=
riority.
>=20
>        A SCHED_FIFO process runs until either it is blocked by an I/O=
 request,
>        it  is  preempted  by  a  higher  priority   process,   or   i=
t   calls
>        sched_yield(2).
>=20
>    SCHED_RR: Round Robin scheduling
>        SCHED_RR  is  a simple enhancement of SCHED_FIFO.  Everything =
described
>        above for SCHED_FIFO also applies to SCHED_RR, except that eac=
h process
>        is  only  allowed  to  run  for  a maximum time quantum.  If a=
 SCHED_RR
>        process has been running for a time period equal to or longer =
than  the
>        time  quantum,  it will be put at the end of the list for its =
priority.
>        A SCHED_RR process that has been preempted by a higher priorit=
y process
>        and  subsequently  resumes execution as a running process will=
 complete
>        the unexpired portion of its round robin time quantum.  The  l=
ength  of
>        the time quantum can be retrieved using sched_rr_get_interval(=
2).
>=20
>    SCHED_OTHER: Default Linux time-sharing scheduling
>        SCHED_OTHER  can only be used at static priority 0.  SCHED_OTH=
ER is the
>        standard Linux time-sharing scheduler that is  intended  for  =
all  pro=E2=80=90
>        cesses  that  do  not  require  the  special real-time mechani=
sms.  The
>        process to run is chosen from the static priority 0  list  bas=
ed  on  a
>        dynamic priority that is determined only inside this list.  Th=
e dynamic
>        priority is based on the nice value (set by nice(2) or  setpri=
ority(2))
>        and  increased  for  each time quantum the process is ready to=
 run, but
>        denied to run by the scheduler.  This ensures fair progress  a=
mong  all
>        SCHED_OTHER processes.
>=20
>    SCHED_BATCH: Scheduling batch processes
>        (Since  Linux 2.6.16.)  SCHED_BATCH can only be used at static=
 priority
>        0.  This policy is similar to SCHED_OTHER  in  that  it  sched=
ules  the
>        process  according  to  its dynamic priority (based on the nic=
e value).
>        The difference is that this policy will cause the scheduler  t=
o  always
>        assume  that the process is CPU-intensive.  Consequently, the =
scheduler
>        will apply a small scheduling penalty with respect to wakeup b=
ehaviour,
>        so that this process is mildly disfavored in scheduling decisi=
ons.
>=20
>        This policy is useful for workloads that are noninteractive, b=
ut do not
>        want to lower their nice value, and for workloads that want a =
determin=E2=80=90
>        istic scheduling policy without interactivity causing extra pr=
eemptions
>        (between the workload's tasks).
>=20
>    SCHED_IDLE: Scheduling very low priority jobs
>        (Since Linux 2.6.23.)  SCHED_IDLE can only be used at  static =
 priority
>        0; the process nice value has no influence for this policy.
>=20
>        This  policy  is  intended  for  running jobs at extremely low=
 priority
>        (lower even than a +19 nice value with the SCHED_OTHER  or  SC=
HED_BATCH
>        policies).
]]]]

> RETURN VALUE
> 	On success, sched_setattr() and sched_getattr() return 0. On
> 	error, -1 is returned, and errno is set appropriately.
>=20
> ERRORS
>        EINVAL The scheduling policy is not one  of  the  recognized  =
policies,
>               param is NULL, or param does not make sense for the pol=
icy.
>=20
>        EPERM  The calling process does not have appropriate privilege=
s.
>=20
>        ESRCH  The process whose ID is pid could not be found.
>=20
>        E2BIG  The provided storage for struct sched_attr is either to=
o
>               big, see sched_setattr(), or too small, see sched_getat=
tr().
>=20
>        EBUSY  SCHED_DEADLINE admission control failure

The above is the only place on the page that mentions admission control=
=2E
As well as the suggestions above, it would be nice to have somewhere a
summary of how admission control is calculated.

> NOTES
> 	While the text above (and in SCHED_SETSCHEDULER(2)) talks about
> 	processes, in actual fact these system calls are thread specific.
>=20

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
