From: Vince Weaver <vincent.weaver@maine.edu>
Subject: Re: [patch] perf_event_open.2: 3.19 PERF_SAMPLE_REGS_INTR support
Date: Mon, 2 Mar 2015 17:23:35 -0500 (EST)
Message-ID: <alpine.DEB.2.11.1503021721090.20187@vincent-weaver-1.umelst.maine.edu>
References: <alpine.DEB.2.11.1502120031150.17793@vincent-weaver-1.umelst.maine.edu> <20150228222605.GA13177@krava.redhat.com> <CABPqkBQQ3JZp_BdwRJDEGpyqrchixfGG_1Lqh88HJtzXWOGE7Q@mail.gmail.com> <alpine.DEB.2.11.1503021425220.17687@vincent-weaver-1.umelst.maine.edu>
 <CABPqkBTc=_8=nRfYpZwZ4eKbpWLnBuy_4aWoTrPupWGu=oK+jg@mail.gmail.com> <alpine.DEB.2.11.1503021617260.17687@vincent-weaver-1.umelst.maine.edu> <CABPqkBSpDg08CTAzknjGpYtHw4QDRFA89SDBcE-5TS9ed1aqAA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABPqkBSpDg08CTAzknjGpYtHw4QDRFA89SDBcE-5TS9ed1aqAA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephane Eranian <eranian@google.com>
Cc: Vince Weaver <vincent.weaver@maine.edu>, Jiri Olsa <jolsa@redhat.com>, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, linux-man@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Chuck Ebbert <cebbert.lkml@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Andi Kleen <andi@firstfloor.org>
List-Id: linux-man@vger.kernel.org

On Mon, 2 Mar 2015, Stephane Eranian wrote:


> Vince, REGS_USER is user ONLY. It does not capture machine state if PMU
> interrupt occurred inside the kernel. REGS_USER is useful in support of dwarf
> based user level call stack unwinding. Otherwise REGS_INTR is what most
> analysis tools need.

so the summary is:

	REGS_USER : gives you the registers at the time of interrupt,
			but always in user mode (if in kernel reports
			last ip before entered kernel)
			useful for stack unwinding

	REGS_INTR and precise_ip=0:
			same as REGS_USER

	REGS_INTR and precise_ip>0 and PEBS hardware:
			gives you the register state at time
			of interrupt.  Can be inside of kernel.


	do not enable REGS_USER and REG_INTR at the same time
		as REGS_USER will have REG_INTR values and
		cannot be used for user stack unwinding

Vince
