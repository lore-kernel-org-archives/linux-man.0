From: Stephane Eranian <eranian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patch] perf_event_open.2: 3.19 PERF_SAMPLE_REGS_INTR support
Date: Mon, 2 Mar 2015 17:30:25 -0500
Message-ID: <CABPqkBQ9-KoykRtP3sc+FhhDr9qrM3GsrHWyWWSm2eiUoEZ3Lg@mail.gmail.com>
References: <alpine.DEB.2.11.1502120031150.17793@vincent-weaver-1.umelst.maine.edu>
	<20150228222605.GA13177@krava.redhat.com>
	<CABPqkBQQ3JZp_BdwRJDEGpyqrchixfGG_1Lqh88HJtzXWOGE7Q@mail.gmail.com>
	<alpine.DEB.2.11.1503021425220.17687@vincent-weaver-1.umelst.maine.edu>
	<CABPqkBTc=_8=nRfYpZwZ4eKbpWLnBuy_4aWoTrPupWGu=oK+jg@mail.gmail.com>
	<alpine.DEB.2.11.1503021617260.17687@vincent-weaver-1.umelst.maine.edu>
	<CABPqkBSpDg08CTAzknjGpYtHw4QDRFA89SDBcE-5TS9ed1aqAA@mail.gmail.com>
	<alpine.DEB.2.11.1503021721090.20187@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1503021721090.20187-6xBS8L8d439fDsnSvq7Uqyn2WXadKZNJe7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Cc: Jiri Olsa <jolsa-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chuck Ebbert <cebbert.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Vince,

On Mon, Mar 2, 2015 at 5:23 PM, Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org> wrote:
> On Mon, 2 Mar 2015, Stephane Eranian wrote:
>
>
>> Vince, REGS_USER is user ONLY. It does not capture machine state if PMU
>> interrupt occurred inside the kernel. REGS_USER is useful in support of dwarf
>> based user level call stack unwinding. Otherwise REGS_INTR is what most
>> analysis tools need.
>
> so the summary is:
>
>         REGS_USER : gives you the registers at the time of interrupt,
>                         but always in user mode (if in kernel reports
>                         last ip before entered kernel)
>                         useful for stack unwinding
>
>         REGS_INTR and precise_ip=0:
>                         same as REGS_USER
>
No. Reports the machine state at PMU interrupt, kernel or user space.

>         REGS_INTR and precise_ip>0 and PEBS hardware:
>                         gives you the register state at time
>                         of interrupt.  Can be inside of kernel.
>
Gives you the machine state at the time the sampled instruction retired.
There is skid between the moment the instruction is sampled by PEBS
and the PMU interrupting at that even when PEBS has only one entry.
>
>         do not enable REGS_USER and REG_INTR at the same time
>                 as REGS_USER will have REG_INTR values and
>                 cannot be used for user stack unwinding
>
> Vince
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
