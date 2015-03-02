From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: Re: [patch] perf_event_open.2: 3.19 PERF_SAMPLE_REGS_INTR support
Date: Mon, 2 Mar 2015 14:31:40 -0500 (EST)
Message-ID: <alpine.DEB.2.11.1503021425220.17687@vincent-weaver-1.umelst.maine.edu>
References: <alpine.DEB.2.11.1502120031150.17793@vincent-weaver-1.umelst.maine.edu> <20150228222605.GA13177@krava.redhat.com> <CABPqkBQQ3JZp_BdwRJDEGpyqrchixfGG_1Lqh88HJtzXWOGE7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABPqkBQQ3JZp_BdwRJDEGpyqrchixfGG_1Lqh88HJtzXWOGE7Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephane Eranian <eranian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Jiri Olsa <jolsa-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chuck Ebbert <cebbert.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sun, 1 Mar 2015, Stephane Eranian wrote:

> You need to describe your test better. Are you saying that the register values
> you were seeing with REGS_USER, REGS_INTR, precise_ip > 0 are all
> the same? That is certainly not impossible. If your PMU interrupts are all
> at the user level, then REGS_INTR = REGS_USER. With precise_ip > 0,
> you will get the machine state on retirement of the sampled instruction.
> But if you have no sampling skid without precise_ip, then both states
> the REGS_INTR and REGS_INTR+precise_ip>0 could be identical.

If you enable both PERF_SAMPLE_REGS_USER and PERF_SAMPLE_REGS_INTR
then you will get in the PERF_RECORD_SAMPLE results for both user
and intr. However they will be identical, always, because
the kernel code just checks if PERF_SAMPLE_REGS_INTR was given and
then returns the PEBS state for both.

My test was expecting that if you specified PERF_SAMPLE_REGS_USER and
PERF_SAMPLE_REGS_INTR then for the PERF_SAMPLE_REGS_USER values you'd
get the same results as when PERF_SAMPLE_REGS_INTR were not specified, but 
that's not the case.

This is an obscure corner case, but I found the results unexpected.

Vince
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
