From: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: sched_{set,get}attr() manpage
Date: Wed, 9 Apr 2014 11:25:10 +0200
Message-ID: <20140409092510.GQ11096@twins.programming.kicks-ass.net>
References: <20131217122720.950475833@infradead.org>
 <20131217123352.692059839@infradead.org>
 <CAHO5Pa3=+Zhg72tVfddSUvgirUyObir6atJVo4_16bVWB2Osgw@mail.gmail.com>
 <20140121153851.GZ31570@twins.programming.kicks-ass.net>
 <CAKgNAkgw+U44SH0wd_06ZMXaCC9nCX4NZxZHkMKUdC7E7YxBhQ@mail.gmail.com>
 <20140214161929.GL27965@twins.programming.kicks-ass.net>
 <53020C9D.1050208@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53020C9D.1050208-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dario Faggioli <raistlin-k2GhghHVRtY@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, fweisbec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, darren-P76s1CtE8BHQT0dZR+AlfA@public.gmane.org, johan.eker-IzeFyvvaP7pWk0Htik3J/w@public.gmane.org, p.faure-et3tyl94nDNyDzI6CaY1VQ@public.gmane.org, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, claudio-YOzL5CV4y4YG1A2ADO40+w@public.gmane.org, michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, fchecconi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tommaso.cucinotta-gAmJrWFzCps@public.gmane.org, juri.lelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, nicola.manica-+cHZLFJ93xAO91npARCAeA@public.gmane.org, luca.abeni-3IIOeSMMxS4@public.gmane.org, dhaval.giani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hgu1972-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Paul McKenney <paulmck-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, insop.song-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, liming.wang-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org, jkacur-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Feb 17, 2014 at 02:20:29PM +0100, Michael Kerrisk (man-pages) w=
rote:
> If your could take another pass though your existing text, to incorpo=
rate the
> new flags stuff, and then send a page to me + linux-man@
> that would be great.


Sorry, this slipped my mind. An updated version below. Heavy borrowing
from SCHED_SETSCHEDULER(2) as before.

---

NAME
	sched_setattr, sched_getattr - set and get scheduling policy/attribute=
s

SYNOPSIS
	#include <sched.h>

	struct sched_attr {
		u32 size;
		u32 sched_policy;
		u64 sched_flags;

		/* SCHED_NORMAL, SCHED_BATCH */
		s32 sched_nice;
		/* SCHED_FIFO, SCHED_RR */
		u32 sched_priority;
		/* SCHED_DEADLINE */
		u64 sched_runtime;
		u64 sched_deadline;
		u64 sched_period;
	};
	int sched_setattr(pid_t pid, const struct sched_attr *attr, unsigned i=
nt flags);

	int sched_getattr(pid_t pid, const struct sched_attr *attr, unsigned i=
nt size, unsigned int flags);

DESCRIPTION
	sched_setattr() sets both the scheduling policy and the
	associated attributes for the process whose ID is specified in
	pid.  If pid equals zero, the scheduling policy and attributes
	of the calling process will be set.  The interpretation of the
	argument attr depends on the selected policy.  Currently, Linux
	supports the following "normal" (i.e., non-real-time) scheduling
	policies:

	SCHED_OTHER	the standard "fair" time-sharing policy;

	SCHED_BATCH	for "batch" style execution of processes; and

	SCHED_IDLE	for running very low priority background jobs.

	The following "real-time" policies are also supported, for
	special time-critical applications that need precise control
	over the way in which runnable processes are selected for
	execution:

	SCHED_FIFO	a first-in, first-out policy;

	SCHED_RR	a round-robin policy; and

	SCHED_DEADLINE	a deadline policy.

	The semantics of each of these policies are detailed below.

	sched_attr::size must be set to the size of the structure, as in
	sizeof(struct sched_attr), if the provided structure is smaller
	than the kernel structure, any additional fields are assumed
	'0'. If the provided structure is larger than the kernel
	structure, the kernel verifies all additional fields are '0' if
	not the syscall will fail with -E2BIG.

	sched_attr::sched_policy the desired scheduling policy.

	sched_attr::sched_flags additional flags that can influence
	scheduling behaviour. Currently as per Linux kernel 3.14:

		SCHED_FLAG_RESET_ON_FORK - resets the scheduling policy
		to: (struct sched_attr){ .sched_policy =3D SCHED_OTHER, }
		on fork().

	is the only supported flag.

	sched_attr::sched_nice should only be set for SCHED_OTHER,
	SCHED_BATCH, the desired nice value [-20,19], see NICE(2).

	sched_attr::sched_priority should only be set for SCHED_FIFO,
	SCHED_RR, the desired static priority [1,99].

	sched_attr::sched_runtime
	sched_attr::sched_deadline
	sched_attr::sched_period should only be set for SCHED_DEADLINE
	and are the traditional sporadic task model parameters.

	The flags argument should be 0.

	sched_getattr() queries the scheduling policy currently applied
	to the process identified by pid.  If pid equals zero, the
	policy of the calling process will be retrieved.

	The size argument should reflect the size of struct sched_attr
	as known to userspace. The kernel fills out sched_attr::size to
	the size of its sched_attr structure. If the user provided
	structure is larger, additional fields are not touched. If the
	user provided structure is smaller, but the kernel needs to
	return values outside the provided space, the syscall will fail
	with -E2BIG.

	The flags argument should be 0.

	The other sched_attr fields are filled out as described in
	sched_setattr().

   Scheduling Policies
       The  scheduler  is  the  kernel  component  that decides which r=
unnable
       process will be executed by the CPU next.  Each process has an  =
associ=E2=80=90
       ated  scheduling  policy and a static scheduling priority, sched=
_prior=E2=80=90
       ity; these are the settings that are modified by  sched_setsched=
uler().
       The  scheduler  makes it decisions based on knowledge of the sch=
eduling
       policy and static priority of all processes on the system.

       For processes scheduled under one of  the  normal  scheduling  p=
olicies
       (SCHED_OTHER,  SCHED_IDLE,  SCHED_BATCH), sched_priority is not =
used in
       scheduling decisions (it must be specified as 0).

       Processes scheduled under one of the  real-time  policies  (SCHE=
D_FIFO,
       SCHED_RR)  have  a  sched_priority  value  in  the  range 1 (low=
) to 99
       (high).  (As the numbers imply, real-time processes always have =
 higher
       priority than normal processes.)  Note well: POSIX.1-2001 only r=
equires
       an implementation to support a minimum 32 distinct priority leve=
ls  for
       the  real-time  policies,  and  some  systems supply just this m=
inimum.
       Portable   programs   should    use    sched_get_priority_min(2)=
    and
       sched_get_priority_max(2) to find the range of priorities suppor=
ted for
       a particular policy.

       Conceptually, the scheduler maintains a list of runnable process=
es  for
       each  possible  sched_priority  value.   In  order  to  determin=
e which
       process runs next, the scheduler looks for the nonempty list  wi=
th  the
       highest  static  priority  and  selects the process at the head =
of this
       list.

       A process's scheduling policy determines where it will be insert=
ed into
       the  list  of processes with equal static priority and how it wi=
ll move
       inside this list.

       All scheduling is preemptive: if a process with a higher static =
 prior=E2=80=90
       ity  becomes  ready  to run, the currently running process will =
be pre=E2=80=90
       empted and returned to the wait list for  its  static  priority =
 level.
       The  scheduling  policy only determines the ordering within the =
list of
       runnable processes with equal static priority.

    SCHED_DEADLINE: Sporadic task model deadline scheduling
	SCHED_DEADLINE is an implementation of GEDF (Global Earliest
	Deadline First) with additional CBS (Constant Bandwidth Server).
	The CBS guarantees that tasks that over-run their specified
	budget are throttled and do not affect the correct performance
	of other SCHED_DEADLINE tasks.

	SCHED_DEADLINE tasks will fail FORK(2) with -EAGAIN

	Setting SCHED_DEADLINE can fail with -EINVAL when admission
	control tests fail.

   SCHED_FIFO: First In-First Out scheduling
       SCHED_FIFO can only be used with static priorities higher than 0=
, which
       means that when a SCHED_FIFO processes becomes runnable, it will=
 always
       immediately preempt any currently running SCHED_OTHER, SCHED_BAT=
CH,  or
       SCHED_IDLE  process.  SCHED_FIFO is a simple scheduling algorith=
m with=E2=80=90
       out time slicing.  For processes scheduled under the SCHED_FIFO =
policy,
       the following rules apply:

       *  A  SCHED_FIFO  process that has been preempted by another pro=
cess of
          higher priority will stay at the head of the list for  its  p=
riority
          and  will resume execution as soon as all processes of higher=
 prior=E2=80=90
          ity are blocked again.

       *  When a SCHED_FIFO process becomes runnable, it will be  inser=
ted  at
          the end of the list for its priority.

       *  A  call  to  sched_setscheduler()  or sched_setparam(2) will =
put the
          SCHED_FIFO (or SCHED_RR) process identified by pid at the  st=
art  of
          the  list  if it was runnable.  As a consequence, it may pree=
mpt the
          currently  running  process   if   it   has   the   same   pr=
iority.
          (POSIX.1-2001 specifies that the process should go to the end=
 of the
          list.)

       *  A process calling sched_yield(2) will be put at the end of th=
e list.

       No other events will move a process scheduled under the SCHED_FI=
=46O pol=E2=80=90
       icy in the wait list of runnable processes with equal static pri=
ority.

       A SCHED_FIFO process runs until either it is blocked by an I/O r=
equest,
       it  is  preempted  by  a  higher  priority   process,   or   it =
  calls
       sched_yield(2).

   SCHED_RR: Round Robin scheduling
       SCHED_RR  is  a simple enhancement of SCHED_FIFO.  Everything de=
scribed
       above for SCHED_FIFO also applies to SCHED_RR, except that each =
process
       is  only  allowed  to  run  for  a maximum time quantum.  If a S=
CHED_RR
       process has been running for a time period equal to or longer th=
an  the
       time  quantum,  it will be put at the end of the list for its pr=
iority.
       A SCHED_RR process that has been preempted by a higher priority =
process
       and  subsequently  resumes execution as a running process will c=
omplete
       the unexpired portion of its round robin time quantum.  The  len=
gth  of
       the time quantum can be retrieved using sched_rr_get_interval(2)=
=2E

   SCHED_OTHER: Default Linux time-sharing scheduling
       SCHED_OTHER  can only be used at static priority 0.  SCHED_OTHER=
 is the
       standard Linux time-sharing scheduler that is  intended  for  al=
l  pro=E2=80=90
       cesses  that  do  not  require  the  special real-time mechanism=
s.  The
       process to run is chosen from the static priority 0  list  based=
  on  a
       dynamic priority that is determined only inside this list.  The =
dynamic
       priority is based on the nice value (set by nice(2) or  setprior=
ity(2))
       and  increased  for  each time quantum the process is ready to r=
un, but
       denied to run by the scheduler.  This ensures fair progress  amo=
ng  all
       SCHED_OTHER processes.

   SCHED_BATCH: Scheduling batch processes
       (Since  Linux 2.6.16.)  SCHED_BATCH can only be used at static p=
riority
       0.  This policy is similar to SCHED_OTHER  in  that  it  schedul=
es  the
       process  according  to  its dynamic priority (based on the nice =
value).
       The difference is that this policy will cause the scheduler  to =
 always
       assume  that the process is CPU-intensive.  Consequently, the sc=
heduler
       will apply a small scheduling penalty with respect to wakeup beh=
aviour,
       so that this process is mildly disfavored in scheduling decision=
s.

       This policy is useful for workloads that are noninteractive, but=
 do not
       want to lower their nice value, and for workloads that want a de=
termin=E2=80=90
       istic scheduling policy without interactivity causing extra pree=
mptions
       (between the workload's tasks).

   SCHED_IDLE: Scheduling very low priority jobs
       (Since Linux 2.6.23.)  SCHED_IDLE can only be used at  static  p=
riority
       0; the process nice value has no influence for this policy.

       This  policy  is  intended  for  running jobs at extremely low p=
riority
       (lower even than a +19 nice value with the SCHED_OTHER  or  SCHE=
D_BATCH
       policies).

RETURN VALUE
	On success, sched_setattr() and sched_getattr() return 0. On
	error, -1 is returned, and errno is set appropriately.

ERRORS
       EINVAL The scheduling policy is not one  of  the  recognized  po=
licies,
              param is NULL, or param does not make sense for the polic=
y.

       EPERM  The calling process does not have appropriate privileges.

       ESRCH  The process whose ID is pid could not be found.

       E2BIG  The provided storage for struct sched_attr is either too
              big, see sched_setattr(), or too small, see sched_getattr=
().

NOTES
	While the text above (and in SCHED_SETSCHEDULER(2)) talks about
	processes, in actual fact these system calls are thread specific.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
