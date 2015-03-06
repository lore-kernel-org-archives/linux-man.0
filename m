From: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Subject: Re: [patch] perf_event_open.2: 3.19 PERF_SAMPLE_REGS_INTR support
Date: Sat, 7 Mar 2015 00:05:56 +0100
Message-ID: <20150306230556.GN823@two.firstfloor.org>
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
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.11.1503061332150.25334-6xBS8L8d439fDsnSvq7Uqyn2WXadKZNJe7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Cc: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>, Stephane Eranian <eranian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jiri Olsa <jolsa-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chuck Ebbert <cebbert.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: linux-man@vger.kernel.org

> so if the sample_type has *both* PERF_SAMPLE_REGS_INTR and
> PERF_SAMPLE_REGS_USER set, then the PERF_SAMPLE_REGS_USER values
> will have the same register values as the PERF_SAMPLE_REGS_INTR values.
> 

It ultimatively calls this code:

static void perf_sample_regs_user(struct perf_regs *regs_user,
                                  struct pt_regs *regs,
                                  struct pt_regs *regs_user_copy)
{
        if (user_mode(regs)) {
                regs_user->abi = perf_reg_abi(current);
                regs_user->regs = regs;
        } else if (current->mm) {
                perf_get_regs_user(regs_user, regs, regs_user_copy);
        } else {
                regs_user->abi = PERF_SAMPLE_REGS_ABI_NONE;
                regs_user->regs = NULL;
        }
}

And perf_get_regs_user gets the task pt_regs at the top of the stack.
So if we interrupted in the kernel it will use that.

I think the first check handling the user case is bogus however
(although it will be very rarely wrong). The stack pointer could 
actually have changed since PEBS was logging 
the register and the PMI was finally triggered.

It should probably be dropped.

-Andi

-- 
ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org -- Speaking for myself only.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
