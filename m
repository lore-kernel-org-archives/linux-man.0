From: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: signals: Bug or manpage inconsistency?
Date: Tue, 30 May 2017 10:19:32 -0700
Message-ID: <CA+55aFygrsUhzQzEOX7YLzxMWE_GbKhJjQZ7nSDXnFFbRAWCJA@mail.gmail.com>
References: <alpine.DEB.2.20.1705301402270.1950@nanos> <alpine.DEB.2.20.1705301750390.1950@nanos>
 <20170530170414.GA22463@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170530170414.GA22463-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, May 30, 2017 at 10:04 AM, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>
> I can't comment, I never tried to understand the rationality behind the current
> behaviour. But at least the sending path should never drop a blocked SIG_DFL
> signal, there is no other way to ensure you won't miss a signal during exec.

Note that both SIG_DFL _and_ SIG_IGN are possible after exec, so if
you don't want to drop particular signals to the new process (which
may then add its own handler and want them), using the signal blocked
mask is the rigth thing to do for both of them,

SIG_IGN doesn't mean "ignore signal forever". It means "ignore signals
right now", and I think that our current signal blocking semantics are
likely the correct ones, exactly because it means "when you start
blocking signals, the kernel will not drop them".

There is no difference wrt SIG_DFL and SIG_IGN in this sense.

> Obviously this is a user-visible change and it can break something. Say, an
> application does sigwaitinfo(SIGCHLD) and SIGCHLD is ignored (SIG_IGN), this
> will no longer work.

That's an interesting special case. Yes, SIG_IGN actually has magical
properties wrt SIGCHLD. It basically means the opposite of ignoring
it, it's an "implicit signal handler".  So I could imagine people
using SIG_IGN to avoid the signal handler, but then block SIG_CHLD and
using sigwait() for it.

That sounds nonportable as hell, but I could imagine people doing it
because it happens to work.

So again, I really wouldn't want to change existing semantics unless
there is a big real reason for it. Our current semantics are not
wrong.

                Linus
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
