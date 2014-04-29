From: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: sched_{set,get}attr() manpage
Date: Tue, 29 Apr 2014 16:22:21 +0200
Message-ID: <20140429142221.GT11096@twins.programming.kicks-ass.net>
References: <20131217122720.950475833@infradead.org>
 <20131217123352.692059839@infradead.org>
 <CAHO5Pa3=+Zhg72tVfddSUvgirUyObir6atJVo4_16bVWB2Osgw@mail.gmail.com>
 <20140121153851.GZ31570@twins.programming.kicks-ass.net>
 <CAKgNAkgw+U44SH0wd_06ZMXaCC9nCX4NZxZHkMKUdC7E7YxBhQ@mail.gmail.com>
 <20140214161929.GL27965@twins.programming.kicks-ass.net>
 <53020C9D.1050208@gmail.com>
 <20140428081858.GX13658@twins.programming.kicks-ass.net>
 <535FA467.2070403@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <535FA467.2070403-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dario Faggioli <raistlin-k2GhghHVRtY@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, fweisbec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, darren-P76s1CtE8BHQT0dZR+AlfA@public.gmane.org, johan.eker-IzeFyvvaP7pWk0Htik3J/w@public.gmane.org, p.faure-et3tyl94nDNyDzI6CaY1VQ@public.gmane.org, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, claudio-YOzL5CV4y4YG1A2ADO40+w@public.gmane.org, michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, fchecconi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tommaso.cucinotta-gAmJrWFzCps@public.gmane.org, juri.lelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, nicola.manica-+cHZLFJ93xAO91npARCAeA@public.gmane.org, luca.abeni-3IIOeSMMxS4@public.gmane.org, dhaval.giani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hgu1972-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Paul McKenney <paulmck-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, insop.song-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, liming.wang-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org, jkacur-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, Apr 29, 2014 at 03:08:55PM +0200, Michael Kerrisk (man-pages) wrote:
> Hi Peter,
> 
> On 04/28/2014 10:18 AM, Peter Zijlstra wrote:
> > Hi Michael,
> > 
> > find below an updated manpage, I did not apply the comments on parts
> > that are identical to SCHED_SETSCHEDULER(2) in order to keep these texts
> > in alignment. I feel that if we change one we should also change the
> > other, and such a 'patch' is best done separate from the new manpage
> > itself.
> > 
> > I did add the missing EBUSY error, and amended the text where it said
> > we'd return EINVAL in that case.
> > 
> > I added a paragraph stating that SCHED_DEADLINE preempted anything else
> > userspace can do (with the explicit mention of userspace to leave me
> > wriggle room for the kernel's stop task :-).
> > 
> > I also did a short paragraph on the deadline sched_yield(). For further
> > deadline yield details we should maybe add to the SCHED_YIELD(2)
> > manpage.
> > 
> > Re juri/claudio; no I think sched_yield() as implemented for deadline
> > makes sense, no other yield semantics other than NOP makes sense for it,
> > and since we have the syscall already might as well make it do something
> > useful.
> 
> Thanks for the updated page. Would you be willing
> to revise as per the comments below.

Ok.

> 
> > NAME
> > 	sched_setattr, sched_getattr - set and get scheduling policy/attributes
> > 
> > SYNOPSIS
> > 	#include <sched.h>
> > 
> > 	struct sched_attr {
> > 		u32 size;
> > 		u32 sched_policy;
> > 		u64 sched_flags;
> > 
> > 		/* SCHED_NORMAL, SCHED_BATCH */
> > 		s32 sched_nice;
> > 		/* SCHED_FIFO, SCHED_RR */
> > 		u32 sched_priority;
> > 		/* SCHED_DEADLINE */
> > 		u64 sched_runtime;
> > 		u64 sched_deadline;
> > 		u64 sched_period;
> > 	};
> > 	int sched_setattr(pid_t pid, const struct sched_attr *attr, unsigned int flags);
> > 
> > 	int sched_getattr(pid_t pid, const struct sched_attr *attr, unsigned int size, unsigned int flags);
> > 
> > DESCRIPTION
> > 	sched_setattr() sets both the scheduling policy and the
> > 	associated attributes for the process whose ID is specified in
> > 	pid.  
> 
> Around about here, I think there needs to be a sentence explaining
> that sched_setattr() provides a superset of the functionality of 
> sched_setscheduler(2) and setpritority(2). I mean, it can do all that 
> those two calls can do, right?

Almost; setpriority() has the .which argument which we don't have. So
while that syscall can change the nice value for an entire process group
or user, sched_setattr() can only change the nice value for 1 task.

But yes, I can mention something along those lines.

> > If pid equals zero, the scheduling policy and attributes
> > 	of the calling process will be set.  The interpretation of the
> > 	argument attr depends on the selected policy.  Currently, Linux
> > 	supports the following "normal" (i.e., non-real-time) scheduling
> > 	policies:
> > 
> > 	SCHED_OTHER	the standard "fair" time-sharing policy;
> > 
> > 	SCHED_BATCH	for "batch" style execution of processes; and
> > 
> > 	SCHED_IDLE	for running very low priority background jobs.
> > 
> > 	The following "real-time" policies are also supported, for
> > 	special time-critical applications that need precise control
> > 	over the way in which runnable processes are selected for
> > 	execution:
> > 
> > 	SCHED_FIFO	a first-in, first-out policy;
> > 
> > 	SCHED_RR	a round-robin policy; and
> > 
> > 	SCHED_DEADLINE	a deadline policy.
> > 
> > 	The semantics of each of these policies are detailed below.
> 
> The semantics of each of these policies are detailed in sched(7).

I don't appear to have SCHED(7), how new is that?

> [See my comments below]
> 
> > 
> > 	sched_attr::size must be set to the size of the structure, as in
> > 	sizeof(struct sched_attr), if the provided structure is smaller
> > 	than the kernel structure, any additional fields are assumed
> > 	'0'. If the provided structure is larger than the kernel
> > 	structure, the kernel verifies all additional fields are '0' if
> > 	not the syscall will fail with -E2BIG.
> > 
> > 	sched_attr::sched_policy the desired scheduling policy.
> > 
> > 	sched_attr::sched_flags additional flags that can influence
> > 	scheduling behaviour. Currently as per Linux kernel 3.14:
> > 
> > 		SCHED_FLAG_RESET_ON_FORK - resets the scheduling policy
> > 		to: (struct sched_attr){ .sched_policy = SCHED_OTHER, }
> > 		on fork().
> > 
> > 	is the only supported flag.
> > 
> > 	sched_attr::sched_nice should only be set for SCHED_OTHER,
> > 	SCHED_BATCH, the desired nice value [-20,19], see NICE(2).
> > 
> > 	sched_attr::sched_priority should only be set for SCHED_FIFO,
> > 	SCHED_RR, the desired static priority [1,99].
> > 
> > 	sched_attr::sched_runtime
> > 	sched_attr::sched_deadline
> > 	sched_attr::sched_period should only be set for SCHED_DEADLINE
> > 	and are the traditional sporadic task model parameters.
> 
> Could you add (a lot ;-)) more detail on these three fields? Assume the
> reader does not know about this traditional sporadic task model, and 
> then give some explanation of what these three fields do. Probably, at
> this point you can work in some statement  about the admission control
> test.
> 
> [but, see my comment below. It may be that sched(7) is a better
> place for this detail.

Yes, I think SCHED(7) would be a better place; also I think I forgot to
put a reference in to Documentation/scheduler/sched-deadline.txt

I'll try and write something concise. This is the stuff of books, not
paragraphs :/

> > 	The flags argument should be 0.
> > 
> > 	sched_getattr() queries the scheduling policy currently applied
> > 	to the process identified by pid.  If pid equals zero, the
> > 	policy of the calling process will be retrieved.
> > 
> > 	The size argument should reflect the size of struct sched_attr
> > 	as known to userspace. The kernel fills out sched_attr::size to
> > 	the size of its sched_attr structure. If the user provided
> > 	structure is larger, additional fields are not touched. If the
> > 	user provided structure is smaller, but the kernel needs to
> > 	return values outside the provided space, the syscall will fail
> > 	with -E2BIG.
> > 
> > 	The flags argument should be 0.
> > 
> > 	The other sched_attr fields are filled out as described in
> > 	sched_setattr().
> 
> I assume that everything between my [[[ and ]]] blocks below is taken straight 
> from sched_setscheduler(2). (If that is not true, please let me know.)

That did indeed look about right.

> This reminds me that there is a structural fault in this part of man-pages ;-).
> The problem is sched_setscheduler(2) currently tries to do two things:
> 
> [a] Document the sched_setscheduler() and sched_scheduler system calls
> [b] Provide and overview od scheduling policies and parameters.
> 
> It should really only do the former. I have now gone through the task of
> separating [b] out into a separate page, sched(7), which other pages,
> such as sched_setscheduler(2) and sched_setattr(2) can refer to. You
> can see the current versions of sched_setscheduelr.2 and sched.7 in Git
> (https://www.kernel.org/doc/man-pages/download.html )
> 
> So, what I would ideally like to see
> 
> [1] A page describing the sched_setattr() and sched_getattr() APIs
> [2] A piece of text describing the SCHED_DEADLINE policy, which I can
> drop into sched(7).
> 
> Could you revise like that?

ACK.

> [[[[

> ]]]]
> 
> >     SCHED_DEADLINE: Sporadic task model deadline scheduling
> >        SCHED_DEADLINE is an implementation of GEDF (Global Earliest
> >        Deadline First) with additional CBS (Constant Bandwidth Server).
> >        The CBS guarantees that tasks that over-run their specified
> >        budget are throttled and do not affect the correct performance
> >        of other SCHED_DEADLINE tasks.
> > 
> >        SCHED_DEADLINE tasks will fail FORK(2) with -EAGAIN
> > 
> >        Setting SCHED_DEADLINE can fail with -EBUSY when admission
> >        control tests fail.
> > 
> >        Because of the nature of (G)EDF, SCHED_DEADLINE tasks are the
> >        highest priority (user controllable) tasks in the system, if any
> >        SCHED_DEADLINE task is runnable it will preempt anything
> >        FIFO/RR/OTHER/BATCH/IDLE task out there.
> > 
> >        A SCHED_DEADLINE task calling sched_yield() will 'yield' the
> >        current job and wait for a new period to begin.
> 
> This is the piece that could go into sched(7), but I'd like it to include
> a discussion of deadline, period, and runtime.
> 
> [[[[

> ]]]]
> 
> > RETURN VALUE
> > 	On success, sched_setattr() and sched_getattr() return 0. On
> > 	error, -1 is returned, and errno is set appropriately.
> > 
> > ERRORS
> >        EINVAL The scheduling policy is not one  of  the  recognized  policies,
> >               param is NULL, or param does not make sense for the policy.
> > 
> >        EPERM  The calling process does not have appropriate privileges.
> > 
> >        ESRCH  The process whose ID is pid could not be found.
> > 
> >        E2BIG  The provided storage for struct sched_attr is either too
> >               big, see sched_setattr(), or too small, see sched_getattr().
> > 
> >        EBUSY  SCHED_DEADLINE admission control failure
> 
> The above is the only place on the page that mentions admission control.
> As well as the suggestions above, it would be nice to have somewhere a
> summary of how admission control is calculated.

I think I'll write down what admission control is without specifics.
Giving specifics pins you down on the implementation. In general
admission control enforces a bound on the schedulability of the task
set. New and interesting ways of computing schedulability are the
subject of papers each year.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
