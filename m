From: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: signals: Bug or manpage inconsistency?
Date: Tue, 30 May 2017 12:58:53 -0700
Message-ID: <CA+55aFxhMrsBWCqw--s9defz257ruwBED5NHWzkJqpU3jGJhCw@mail.gmail.com>
References: <alpine.DEB.2.20.1705301402270.1950@nanos> <CA+55aFwC_8RWygnZWtgT+COY8mGY_RnDSW_vrD=+1x_NyPxChw@mail.gmail.com>
 <alpine.DEB.2.20.1705302105190.2356@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.20.1705302105190.2356@nanos>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, May 30, 2017 at 12:35 PM, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> wrote:
> Right, blocking signals which are not set to SIG_IGN makes perfectly sense. The
> SIG_IGN case is what bothers me.

The thing is, the SIG_IGN may not *remain* a SIG_IGN.

Put another way, let's say that you are a process that uses signals
for some event thing. You have a signal handler for handling the
event, but it may be that you also have a mode in which you are in
some kind of "don't care" phase, and you don't want to be woken up or
have that signal handler even be invoked, so you set the signal to
SIG_IGN.

But then when you want to start listening to the event again, you
might need to set up data structures for the signal handler, and what
you do is

 - block the signal to avoid all race conditions with things that
might come in before you're ready

 - set up your data structures

 - set the new signal handler

 - unblock the signal to make it all "live".

and notice that there's a race condition there: you need to set up
your data structures in order to take the signal sanely, but maybe
because of how you structured things, the act of setting up your data
structures is also what may make the signal start happening!

And when your data structures are set up, you do *not* want to drop
new signals that are starting to come in!

Note how you could not set the new signal handler before your data
structures were ready (because then you'd crash or not be able to
handle them), but also note how you can not just ignore signals.

That's what I meant by the nice "atomic" behavior of blocking the
signal.  With the signal blocked, it now doesn't matter if a signal
happens during that "not completely ready phase" or not.

And notice how SIG_IGN is just one _part_ of that "not completely ready" phase.

Does anybody do this? I really don't know. Maybe not.

But our current code _allows_ you to do it, and actually feels like a
much better model than the one you are trying to argue for.

So I literally think that what we do now is objectively better than
something that ignores the blocking, and just always ignores a signal.

Exactly because that can fundamentally race with the whole "we're now
going to unblock the signal" phase.

With the "signal is blocked means that it gets queued" model, you can
handle that race cleanly.

> The reason why I'm looking into that is the silly case with posix interval
> timers dealing with ignored signals. We have to keep these timers self
> rearming because nothing rearms them when SIG_IGN is lifted.

Why not do SIG_IGN specially at signal generation time, the way
SIGCHLD does. If SIG_IGN is set, you re-arm immediately but do not
actually deliver the signal. It will automatically be re-delivered
next time around (assuming people have by then installed a real signal
handler).

That sounds very much like the SIGCHLD case.

            Linus
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
