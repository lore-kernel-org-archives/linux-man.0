From: Stephane Eranian <eranian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patch] perf_event_open.2: 3.19 PERF_SAMPLE_REGS_INTR support
Date: Fri, 6 Mar 2015 14:51:53 -0500
Message-ID: <CABPqkBTdJ8Qy0=3fnhqfj1anU_6R9tGqHGTQCO_SCHphqypJaA@mail.gmail.com>
References: <alpine.DEB.2.11.1502120031150.17793@vincent-weaver-1.umelst.maine.edu>
	<20150228222605.GA13177@krava.redhat.com>
	<CABPqkBQQ3JZp_BdwRJDEGpyqrchixfGG_1Lqh88HJtzXWOGE7Q@mail.gmail.com>
	<alpine.DEB.2.11.1503021425220.17687@vincent-weaver-1.umelst.maine.edu>
	<CABPqkBTc=_8=nRfYpZwZ4eKbpWLnBuy_4aWoTrPupWGu=oK+jg@mail.gmail.com>
	<alpine.DEB.2.11.1503021617260.17687@vincent-weaver-1.umelst.maine.edu>
	<CABPqkBSpDg08CTAzknjGpYtHw4QDRFA89SDBcE-5TS9ed1aqAA@mail.gmail.com>
	<alpine.DEB.2.11.1503021721090.20187@vincent-weaver-1.umelst.maine.edu>
	<20150302225807.GJ823@two.firstfloor.org>
	<alpine.DEB.2.11.1503061332150.25334@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1503061332150.25334-6xBS8L8d439fDsnSvq7Uqyn2WXadKZNJe7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Cc: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>, Jiri Olsa <jolsa-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chuck Ebbert <cebbert.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Mar 6, 2015 at 1:37 PM, Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org> wrote:
> On Mon, 2 Mar 2015, Andi Kleen wrote:
>
>> >     do not enable REGS_USER and REG_INTR at the same time
>> >             as REGS_USER will have REG_INTR values and
>> >             cannot be used for user stack unwinding
>>
>> If that's true it would be a bug. But I doubt it.
>>
>> The PEBS handler sets up its own pt_regs, so they should
>> be independent.
>
> I could be wrong here, but was tracing through the code.
>
> If you trigger a PEBS interrupt (because you have precise_ip set)
> and you have both REGS_USER and REGS_INTR set, then
>         __intel_pmu_pebs_event()
> is called from
>         arch/x86/kernel/cpu/perf_event_intel_ds.c
>
> and in there it sets the regs values based solely on
>
>         if (sample_type & PERF_SAMPLE_REGS_INTR) {
>         }
>
> with those values copies into regs and then passed upstream through
>         perf_event_overflow()
>
> so if the sample_type has *both* PERF_SAMPLE_REGS_INTR and
> PERF_SAMPLE_REGS_USER set, then the PERF_SAMPLE_REGS_USER values
> will have the same register values as the PERF_SAMPLE_REGS_INTR values.
>
> Maybe this is the expected behavior, or maybe I am missing something
> still.
>
If you look at perf_sample_regs_user() is has 3 pt_regs. If interrupt occurred
while in user mode, then regs_users get regs. And those could have been updated
by PEBS if REGS_INTR is set. The question is: is this valid?
If PEBS is one entry, then you'd get the state at retirement of the
sampled instruction.

The interrupt would come a bit later. the pt_regs reflects user mode,
thus either the
sampled instruction was still in user mode or it was in kernel mode.
In the later case,
this is a problem because you are reporting kernel state for REG_USER.
In the former
case, you'd report state for an instruction that is retired early that
where the interrupt hit.

It boils down to the definition of REGS_USER? Is that last know user
level state, interrupted
user state?

For REGS_INTR:
    - precise_ip = 0: machine state at PMU interrupt
    - precise_ip > 0: machine state at retirement of PEBS sampled instruction

For REGS_USER:
    - precise_ip = 0: last known user level machine state on PMU interrupt
    - precise_ip > 0:
       - interrupt hit in user space: machine state at retirement of
PEBS sampled instruction
       - interrupt hit in kernel space: last known user level machine
state on PMU interrupt

At least, that's how I think it currently works.
Do you agree, Vince?



> Vince
>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
