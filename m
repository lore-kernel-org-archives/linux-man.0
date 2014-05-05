From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: sched_{set,get}attr() manpage
Date: Mon, 05 May 2014 08:55:28 +0200
Message-ID: <536735E0.7020204@gmail.com>
References: <20131217123352.692059839@infradead.org>	<CAHO5Pa3=+Zhg72tVfddSUvgirUyObir6atJVo4_16bVWB2Osgw@mail.gmail.com>	<20140121153851.GZ31570@twins.programming.kicks-ass.net>	<CAKgNAkgw+U44SH0wd_06ZMXaCC9nCX4NZxZHkMKUdC7E7YxBhQ@mail.gmail.com>	<20140214161929.GL27965@twins.programming.kicks-ass.net>	<53020C9D.1050208@gmail.com>	<20140428081858.GX13658@twins.programming.kicks-ass.net>	<535FA467.2070403@gmail.com>	<20140429160441.GU11096@twins.programming.kicks-ass.net>	<5360D9E5.9080206@gmail.com>	<20140430130937.GH30445@twins.programming.kicks-ass.net> <20140503124355.5d927080518051ca507bc381@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140503124355.5d927080518051ca507bc381-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Juri Lelli <juri.lelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Dario Faggioli <raistlin-k2GhghHVRtY@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, fweisbec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, darren-P76s1CtE8BHQT0dZR+AlfA@public.gmane.org, johan.eker-IzeFyvvaP7pWk0Htik3J/w@public.gmane.org, p.faure-et3tyl94nDNyDzI6CaY1VQ@public.gmane.org, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, claudio-YOzL5CV4y4YG1A2ADO40+w@public.gmane.org, michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, fchecconi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tommaso.cucinotta-gAmJrWFzCps@public.gmane.org, nicola.manica-+cHZLFJ93xAO91npARCAeA@public.gmane.org, luca.abeni-3IIOeSMMxS4@public.gmane.org, dhaval.giani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hgu1972-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Paul McKenney <paulmck-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, insop.song-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, liming.wang-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org, jkacur-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Peter,

Looks like a good set of comments from Juri. Could you revise and 
resubmit?

By the way, I assume you are just writing this page as raw text.
While I'd prefer to get proper man markup source, I'll add that
if you if you don't :-/. But, in that case, I need to know the
copyright and license you want to use. Please see
https://www.kernel.org/doc/man-pages/licenses.html

Cheers,

Michael


On 05/03/2014 12:43 PM, Juri Lelli wrote:
> Hi,
> 
> sorry for the late reply, but I was travelling for work.
> 
> On Wed, 30 Apr 2014 15:09:37 +0200
> Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wrote:
> 
>> On Wed, Apr 30, 2014 at 01:09:25PM +0200, Michael Kerrisk (man-pages) wrote:
>>> Hi Peter,
>>>
>>> Thanks for the revision. More comments below. Could you revise in 
>>> the light of those comments, and hopefully also after feedback from 
>>> Juri and Dario?
>>
>> New text below; hopefully a little clearer. If not, do holler.
>>
>> ---
>>> [1] A page describing the sched_setattr() and sched_getattr() APIs
>>
>> NAME
>> 	sched_setattr, sched_getattr - set and get scheduling policy/attributes
>>
>> SYNOPSIS
>> 	#include <sched.h>
>>
>> 	struct sched_attr {
>> 		u32 size;
>> 		u32 sched_policy;
>> 		u64 sched_flags;
>>
>> 		/* SCHED_NORMAL, SCHED_BATCH */
>> 		s32 sched_nice;
>>
>> 		/* SCHED_FIFO, SCHED_RR */
>> 		u32 sched_priority;
>>
>> 		/* SCHED_DEADLINE */
>> 		u64 sched_runtime;
>> 		u64 sched_deadline;
>> 		u64 sched_period;
>> 	};
>>
>> 	int sched_setattr(pid_t pid, const struct sched_attr *attr, unsigned int flags);
>>
>> 	int sched_getattr(pid_t pid, const struct sched_attr *attr, unsigned int size, unsigned int flags);
>>
>> DESCRIPTION
>> 	sched_setattr() sets both the scheduling policy and the
>> 	associated attributes for the process whose ID is specified in
>> 	pid.
>>
>> 	sched_setattr() replaces sched_setscheduler(), sched_setparam(),
>> 	nice() and some of setpriority().
>>
>> 	If pid equals zero, the scheduling policy and attributes
>> 	of the calling process will be set.  The interpretation of the
>> 	argument attr depends on the selected policy.  Currently, Linux
>> 	supports the following "normal" (i.e., non-real-time) scheduling
>> 	policies:
>>
>> 	SCHED_OTHER	the standard "fair" time-sharing policy;
>>
>> 	SCHED_BATCH	for "batch" style execution of processes; and
>>
>> 	SCHED_IDLE	for running very low priority background jobs.
>>
>> 	The following "real-time" policies are also supported, for
>> 	special time-critical applications that need precise control
>> 	over the way in which runnable processes are selected for
>> 	execution:
>>
>> 	SCHED_FIFO	a static priority first-in, first-out policy;
>>
>> 	SCHED_RR	a static priority round-robin policy; and
>>
>> 	SCHED_DEADLINE	a dynamic priority deadline policy.
>>
>> 	The semantics of each of these policies are detailed in
>> 	sched(7).
>>
>> 	sched_attr::size must be set to the size of the structure, as in
>> 	sizeof(struct sched_attr), if the provided structure is smaller
>> 	than the kernel structure, any additional fields are assumed
>> 	'0'. If the provided structure is larger than the kernel
>> 	structure, the kernel verifies all additional fields are '0' if
>> 	not the syscall will fail with -E2BIG.
>>
>> 	sched_attr::sched_policy the desired scheduling policy.
>>
>> 	sched_attr::sched_flags additional flags that can influence
>> 	scheduling behaviour. Currently as per Linux kernel 3.14:
>>
>> 		SCHED_FLAG_RESET_ON_FORK - resets the scheduling policy
>> 		to: (struct sched_attr){ .sched_policy = SCHED_OTHER, }
>> 		on fork().
>>
>> 	is the only supported flag.
>>
>> 	sched_attr::sched_nice should only be set for SCHED_OTHER,
>> 	SCHED_BATCH, the desired nice value [-20,19], see sched(7).
>>
>> 	sched_attr::sched_priority should only be set for SCHED_FIFO,
>> 	SCHED_RR, the desired static priority [1,99], see sched(7).
>>
>> 	sched_attr::sched_runtime in nanoseconds,
>> 	sched_attr::sched_deadline in nanoseconds,
>> 	sched_attr::sched_period in nanoseconds, should only be set for
>> 	SCHED_DEADLINE and are the traditional sporadic task model
>> 	parameters, see sched(7).
>>
>> 	The flags argument should be 0.
>>
>> 	sched_getattr() queries the scheduling policy currently applied
>> 	to the process identified by pid.
>>
>> 	Similar to sched_setattr(), sched_getattr() replaces
>> 	sched_getscheduler(), sched_getparam() and some of
>> 	getpriority().
>>
>> 	If pid equals zero, the policy of the calling process will be
>> 	retrieved.
>>
>> 	The size argument should reflect the size of struct sched_attr
>> 	as known to userspace. The kernel fills out sched_attr::size to
>> 	the size of its sched_attr structure. If the user provided
>> 	structure is larger, additional fields are not touched. If the
>> 	user provided structure is smaller, but the kernel needs to
>> 	return values outside the provided space, the syscall will fail
>> 	with -E2BIG.
>>
>> 	The flags argument should be 0.
>>
>> 	The other sched_attr fields are filled out as described in
>> 	sched_setattr().
>>
>> RETURN VALUE
>> 	On success, sched_setattr() and sched_getattr() return 0. On
>> 	error, -1 is returned, and errno is set appropriately.
>>
>> ERRORS
>>        EINVAL The scheduling policy is not one  of  the  recognized  policies,
>>               param is NULL, or param does not make sense for the selected
>> 	      policy.
>>
>>        EPERM  The calling process does not have appropriate privileges.
>>
>>        ESRCH  The process whose ID is pid could not be found.
>>
>>        E2BIG  The provided storage for struct sched_attr is either too
>>               big, see sched_setattr(), or too small, see sched_getattr().
>>
>>        EBUSY  SCHED_DEADLINE admission control failure, see sched(7).
>>
>> NOTES
>>        While the text above (and in sched_setscheduler(2)) talks about
>>        processes, in actual fact these system calls are thread specific.
>>
>>        While the SCHED_DEADLINE parameters are in nanoseconds, current
>>        kernels truncate the lower 10 bits and we get an effective
>>        microsecond resolution.
>>
>>> [2] A piece of text describing the SCHED_DEADLINE policy, which I can
>>> drop into sched(7).
>>
> 
> I'd tweak the following a bit, just to be sure that users understand
> that one thing is the model of tasks behavior and another thing is what
> you can set using SCHED_DEADLINE. Then the two things are obviously
> closely related, but different settings can be in principle used to
> schedule the same task set (with lot of literature about optimal
> settings and so on).
> 
>>     SCHED_DEADLINE: Sporadic task model deadline scheduling
>>        SCHED_DEADLINE is currently implemented using GEDF (Global
>>        Earliest Deadline First) with additional CBS (Constant Bandwidth
>>        Server).
>>
>>        A sporadic task is on that has a sequence of jobs, where each job
>>        is activated at most once per period [ns]. Each job will have an
>>        absolute deadline relative to its activation before which it must
>>        finish its execution, and it shall at no time run longer
>>        than runtime [ns] after its release.
>>
> 
> A sporadic task is one that has a sequence of jobs, where each job is
> activated at most once per period. Each job has also a relative
> deadline, before which it should finish execution, and a computation
> time, that is the time necessary for executing the job without
> interruption. The instant of time when a task wakes up, because a new
> job has to be executed, is called arrival time (and it is also referred
> to as request time or release time). Start time is instead the time at
> which a task starts its execution. The absolute deadline is thus
> obtained adding the relative deadline to the arrival time. The
> following diagram clarifies these terms:
> 
>>               activation/wakeup       absolute deadline
>>               |        release        |
>>               v        v              v
>>        -------x--------x--------------x--------x-------
>>                        |<- Runtime -->|
>>               |<---------- Deadline ->|
>>               |<---------- Period  ----------->|
>>
> 
>                arrival/wakeup           absolute deadline
>                |        start time          |
>                v        v                   v
>         -------x--------xoooooooooooo-------x--------x-----
>                         |<- comp. ->|
>                |<---------- rel. deadline ->|
>                |<---------- period   --------------->|
> 
> SCHED_DEADLINE allows the user to specify three parameters (see
> sched_setattr(2)): Runtime [ns], Deadline [ns] and Period [ns]. Such
> parameters has not necessarily to correspond to the aforementioned
> terms, while usual practise is to set Runtime to something bigger than
> the average computation time (or worst-case execution time for hard
> real-time tasks), Deadline to the relative deadline and Period to the
> period of the task. With such a setting we would have:
> 
>                arrival/wakeup           absolute deadline
>                |        start time          |
>                v        v                   v
>         -------x--------xoooooooooooo-------x--------x-----
>                         |<- Runtime  ->|
>                |<---------- Deadline ------>|
>                |<---------- Period   --------------->|
>  
> 
> 
>>        This gives: runtime <= (rel) deadline <= period.
>>
> 
> It is checked that: Runtime <= Deadline <= Period.
> 
>>        The CBS guarantees non-interference between tasks, by throttling
>>        tasks that attempt to over-run their specified runtime.
>>
> 
> s/runtime/Runtime to be consistent.
> 
>>        In general the set of all SCHED_DEADLINE tasks is not
>>        feasible/schedulable within the given constraints. Therefore we
>>        must do an admittance test on setting/changing SCHED_DEADLINE
>>        policy/attributes.
>>
> 
> To guarantee some degree of timeliness we must do an admission test on
> setting/changing SCHED_DEADLINE policy/attributes.
> 
> 
>>        This admission test calculates that the task set is
>>        feasible/schedulable, failing this, sched_setattr() will return
>>        -EBUSY.
>>
>>        For example, it is required (but not necessarily sufficient) for
>>        the total utilization to be less or equal to the total amount of
>>        CPUs available, where, since each task can maximally run for
>>        runtime [us] per period [us], that task's utilization is its
>>        runtime/period.
>>
> 
> CPUs available, where, since each task can maximally run for Runtime
> per Period, that task's utilization is its Runtime/Period.
> 
>>        Because we must be able to calculate admittance SCHED_DEADLINE
>>        tasks are the highest priority (user controllable) tasks in the
>>        system, if any SCHED_DEADLINE task is runnable it will preempt
>>        any FIFO/RR/OTHER/BATCH/IDLE task.
>>
>>        SCHED_DEADLINE tasks will fail fork(2) with -EAGAIN, except when
>>        the forking task has SCHED_FLAG_RESET_ON_FORK set.
>>
>>        A SCHED_DEADLINE task calling sched_yield() will 'yield' the
>>        current job and wait for a new period to begin.
>>
> 
> Does it look any better?
> 
> Thanks,
> 
> - Juri
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
