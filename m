From: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ptrace.2: Clarify PTRACE_INTERRUPT, PTRACE_LISTEN and
 group-stop behavior
Date: Fri, 21 Jun 2013 12:49:53 +0200
Message-ID: <51C42FD1.5010407@redhat.com>
References: <1371726704-23409-1-git-send-email-dvlasenk@redhat.com> <20130620142452.GA846@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130620142452.GA846-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Kratochvil <jan.kratochvil-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/20/2013 04:24 PM, Oleg Nesterov wrote:
>> PTRACE_INTERRUPT (since Linux 3.4)
>> Stop a tracee.
>> [*MODIFIED TEXT->**] If the tracee is running in kernel space
>> and PTRACE_SYSCALL is in effect, it will stop with syscall-exit-stop.
> 
> Yes, but this looks a bit confusing. Or perhaps it is just me.
> 
> IOW, it looks as if PTRACE_INTERRUPT has no effect in this case, the
> tracee should report syscall-exit anyway. I do not know how to explain
> this better...

How about this?

"If the tracee is running or sleeping in kernel space
and PTRACE_SYSCALL is in effect, it will return from kernel
and send syscall-exit-stop notification."

I wonder whether we need to add that "The interrupted system call
will be restarted when tracee is restarted" or this is obvious
enough?

> I think it makes sense to mention that a) PTRACE_INTERRUPT is only
> valid if PTRACE_SEIZE was used, and b) this is the only request which
> doesn't need the stopped tracee. (PTRACE_KILL should die)

It is mentioned elsewhere on the man page.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
