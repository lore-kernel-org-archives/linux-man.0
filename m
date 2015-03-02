From: Stephane Eranian <eranian@google.com>
Subject: Re: [patch] perf_event_open.2: 3.19 PERF_SAMPLE_REGS_INTR support
Date: Mon, 2 Mar 2015 15:26:09 -0500
Message-ID: <CABPqkBTc=_8=nRfYpZwZ4eKbpWLnBuy_4aWoTrPupWGu=oK+jg@mail.gmail.com>
References: <alpine.DEB.2.11.1502120031150.17793@vincent-weaver-1.umelst.maine.edu>
	<20150228222605.GA13177@krava.redhat.com>
	<CABPqkBQQ3JZp_BdwRJDEGpyqrchixfGG_1Lqh88HJtzXWOGE7Q@mail.gmail.com>
	<alpine.DEB.2.11.1503021425220.17687@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.11.1503021425220.17687@vincent-weaver-1.umelst.maine.edu>
Sender: linux-kernel-owner@vger.kernel.org
To: Vince Weaver <vincent.weaver@maine.edu>
Cc: Jiri Olsa <jolsa@redhat.com>, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, linux-man@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Chuck Ebbert <cebbert.lkml@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Andi Kleen <andi@firstfloor.org>
List-Id: linux-man@vger.kernel.org

vince,

On Mon, Mar 2, 2015 at 2:31 PM, Vince Weaver <vincent.weaver@maine.edu> wrote:
>
> On Sun, 1 Mar 2015, Stephane Eranian wrote:
>
> > You need to describe your test better. Are you saying that the register values
> > you were seeing with REGS_USER, REGS_INTR, precise_ip > 0 are all
> > the same? That is certainly not impossible. If your PMU interrupts are all
> > at the user level, then REGS_INTR = REGS_USER. With precise_ip > 0,
> > you will get the machine state on retirement of the sampled instruction.
> > But if you have no sampling skid without precise_ip, then both states
> > the REGS_INTR and REGS_INTR+precise_ip>0 could be identical.
>
> If you enable both PERF_SAMPLE_REGS_USER and PERF_SAMPLE_REGS_INTR
> then you will get in the PERF_RECORD_SAMPLE results for both user
> and intr. However they will be identical, always, because
> the kernel code just checks if PERF_SAMPLE_REGS_INTR was given and
> then returns the PEBS state for both.
>
If the PMU interrupt occurred at the user level, then this makes sense.
both perf_sample_regs_user() and perf_sample_regs_intr() use the
same pt_regs() which has the user state.

I think your comment is more along the lines that REGS_USER should not receive
PEBS machine state. Problem is that there is only one set of pt_regs passed to
__intel_pmu_pebs_event(). And if REGS_INTR is set, then the pt_regs
registers are
indeed overwritten with PEBS captured state. To avoid the issue, we
would have to
carry around two sets of pt_regs.

> My test was expecting that if you specified PERF_SAMPLE_REGS_USER and
> PERF_SAMPLE_REGS_INTR then for the PERF_SAMPLE_REGS_USER values you'd
> get the same results as when PERF_SAMPLE_REGS_INTR were not specified, but
> that's not the case.
>
This could certainly be fixed with two sets of pt_regs to make the results more
consisten when REGS_USER and REGS_INTR + precise are used.

>
> This is an obscure corner case, but I found the results unexpected.
>
> Vince
