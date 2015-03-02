From: Vince Weaver <vincent.weaver@maine.edu>
Subject: Re: [patch] perf_event_open.2: 3.19 PERF_SAMPLE_REGS_INTR support
Date: Mon, 2 Mar 2015 16:19:15 -0500 (EST)
Message-ID: <alpine.DEB.2.11.1503021617260.17687@vincent-weaver-1.umelst.maine.edu>
References: <alpine.DEB.2.11.1502120031150.17793@vincent-weaver-1.umelst.maine.edu> <20150228222605.GA13177@krava.redhat.com> <CABPqkBQQ3JZp_BdwRJDEGpyqrchixfGG_1Lqh88HJtzXWOGE7Q@mail.gmail.com> <alpine.DEB.2.11.1503021425220.17687@vincent-weaver-1.umelst.maine.edu>
 <CABPqkBTc=_8=nRfYpZwZ4eKbpWLnBuy_4aWoTrPupWGu=oK+jg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABPqkBTc=_8=nRfYpZwZ4eKbpWLnBuy_4aWoTrPupWGu=oK+jg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephane Eranian <eranian@google.com>
Cc: Jiri Olsa <jolsa@redhat.com>, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, linux-man@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Chuck Ebbert <cebbert.lkml@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Andi Kleen <andi@firstfloor.org>
List-Id: linux-man@vger.kernel.org

On Mon, 2 Mar 2015, Stephane Eranian wrote:

> vince,

> PEBS machine state. Problem is that there is only one set of pt_regs passed to
> __intel_pmu_pebs_event(). And if REGS_INTR is set, then the pt_regs
> registers are
> indeed overwritten with PEBS captured state. To avoid the issue, we
> would have to
> carry around two sets of pt_regs.

I don't think we have to carry around both (would that ever be useful?)
Just that the behavior is a bit surprising and I should document it in the 
manpage.

One question I do have: if it never makes sense to measure REGS_USER and 
REGS_INTR at the same time, why was the latter added at all?  Why not just 
have the REGS_USER information automatically upgrade to REGS_INTR if 
precise_ip is high enough?

Vince
