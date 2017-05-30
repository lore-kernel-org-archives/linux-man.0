From: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: signals: Bug or manpage inconsistency?
Date: Tue, 30 May 2017 21:18:47 +0200
Message-ID: <20170530191847.GA23231@redhat.com>
References: <alpine.DEB.2.20.1705301402270.1950@nanos>
 <alpine.DEB.2.20.1705301750390.1950@nanos>
 <20170530170414.GA22463@redhat.com>
 <CA+55aFygrsUhzQzEOX7YLzxMWE_GbKhJjQZ7nSDXnFFbRAWCJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CA+55aFygrsUhzQzEOX7YLzxMWE_GbKhJjQZ7nSDXnFFbRAWCJA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 05/30, Linus Torvalds wrote:
>
> On Tue, May 30, 2017 at 10:04 AM, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> >
> > I can't comment, I never tried to understand the rationality behind the current
> > behaviour. But at least the sending path should never drop a blocked SIG_DFL
> > signal, there is no other way to ensure you won't miss a signal during exec.
>
> Note that both SIG_DFL _and_ SIG_IGN are possible after exec,

Yes, if it was already ignored before exec. But ignoring the compatibility the
only important case is when it is SIG_DFL because of flush_signal_handlers().

> SIG_IGN doesn't mean "ignore signal forever". It means "ignore signals
> right now", and I think that our current signal blocking semantics are
> likely the correct ones,

I am not saying it is incorrect, but I agree with Thomas in that this
sigismember(t->blocked) in sig_ignored() doesn't look really nice.

> exactly because it means "when you start
> blocking signals, the kernel will not drop them".

if the process is singe-threaded or the signal is private, or it is blocked
by all threads. Otherwise it will wakeup another thread for no reason, the
signal will be dropped in get_signal().

And again, this doesn't look consistent with do_sigaction(). It even has a
comment which explains that we want to flush the ignored signals, blocked
or not.

Nevermind, I am not trying to argue, and

> So again, I really wouldn't want to change existing semantics unless
> there is a big real reason for it. Our current semantics are not
> wrong.

I certainly agree.

Oleg.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
