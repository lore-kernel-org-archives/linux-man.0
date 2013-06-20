From: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ptrace.2: Clarify PTRACE_INTERRUPT, PTRACE_LISTEN and
	group-stop behavior
Date: Thu, 20 Jun 2013 16:24:52 +0200
Message-ID: <20130620142452.GA846@redhat.com>
References: <1371726704-23409-1-git-send-email-dvlasenk@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1371726704-23409-1-git-send-email-dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Kratochvil <jan.kratochvil-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/20, Denys Vlasenko wrote:
>
> From: root <root-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>

I'll remove this guy from cc list before I reply ;)

> For easier review, here are the changes as plain text:

And thanks for the plain text.

Looks good to me. A couple of nits.

> PTRACE_INTERRUPT (since Linux 3.4)
> Stop a tracee.
> [*MODIFIED TEXT->**] If the tracee is running in kernel space
> and PTRACE_SYSCALL is in effect, it will stop with syscall-exit-stop.

Yes, but this looks a bit confusing. Or perhaps it is just me.

IOW, it looks as if PTRACE_INTERRUPT has no effect in this case, the
tracee should report syscall-exit anyway. I do not know how to explain
this better...

Perhaps. PTRACE_INTERRUPT sends the "fake" signal to the tracee (iow,
it sets TIF_SIGPENDING and wakes it up). The tracee will report
PTRACE_EVENT_STOP unless it is going to report something else
(syscall, signal).

I think it makes sense to mention that a) PTRACE_INTERRUPT is only
valid if PTRACE_SEIZE was used, and b) this is the only request which
doesn't need the stopped tracee. (PTRACE_KILL should die)

> If any other ptrace-stop is generated at the same time
> (for example, if a signal is sent to the tracee), this ptrace-stop
> happens.

Yes. Strictly speaking, do_jobctl_trap() is called before
ptrace_signal(), so this depends on the timing. So I think this
falls into "unless it is going to report something else" above.

Denys, thanks a lot for this work!

Oleg.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
