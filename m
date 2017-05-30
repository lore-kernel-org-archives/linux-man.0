From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: signals: Bug or manpage inconsistency?
Date: Tue, 30 May 2017 23:00:38 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1705302211450.2356@nanos>
References: <alpine.DEB.2.20.1705301402270.1950@nanos> <CA+55aFwC_8RWygnZWtgT+COY8mGY_RnDSW_vrD=+1x_NyPxChw@mail.gmail.com> <alpine.DEB.2.20.1705302105190.2356@nanos> <CA+55aFxhMrsBWCqw--s9defz257ruwBED5NHWzkJqpU3jGJhCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+55aFxhMrsBWCqw--s9defz257ruwBED5NHWzkJqpU3jGJhCw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, 30 May 2017, Linus Torvalds wrote:
> On Tue, May 30, 2017 at 12:35 PM, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> wrote:
> > The reason why I'm looking into that is the silly case with posix interval
> > timers dealing with ignored signals. We have to keep these timers self
> > rearming because nothing rearms them when SIG_IGN is lifted.
> 
> Why not do SIG_IGN specially at signal generation time, the way
> SIGCHLD does. If SIG_IGN is set, you re-arm immediately but do not
> actually deliver the signal. It will automatically be re-delivered
> next time around (assuming people have by then installed a real signal
> handler).

The rearming is exactly the issue. Assume the following:

	t.interval.tv_nsec = 1;
	t.interval.tv_sec = 0;

	timer_set(timerid, 0, &t, NULL);

This creates a 1 nanosecond periodic timer, which is silly to begin with,
but allowed. In the normal case this is automatically rate limited by:

  expire -> queue signal -> wakeup task -> dequeue signal -> rearm

So the scheduler controls how much CPU this task gets because the signal
must be dequeued to rearm the timer. If it's the only task on the system it
will still hog the CPU, but that's the same as if you do while(1).

In the SIG_IGN case it is not, because we need to rearm automatically. So
with that 1 nsec interval you created a DOS attack because the system is
busy expiring and rearming the timer.

The mitigation we have in place is to rate limit that rearming to one
jiffie, so the DOS won't happen.

But that's just a stupid hack. The proper solution would be to rearm the
timer at the point where the SIG_IGN is replaced or for that matter the
ignored signal is blocked.

I'm fine with the current behaviour vs. blocking the ignored signal, I
still think it's inconsistent, but that could be debated forever.

Though it needs to be documented somewhere proper and the man page of
sigpending() needs to be fixed so the next person looking into this starts
scratching his head and asks the same questions again.

So with the existing blocking ignored signal semantics the DOS is mitigated
as well, because the signal is queued and the rearming happens when the
signal is dequeued as in the normal case above, through unblocking or
sigwait().

Now there is a subtle issue with this. The following code sequence will
stop the timer forever:

     block(sig);

	timer expires -> signal is queued -> timer is stopped

     ignore(sig);

	pending signal is discarded

     install_handler(sig);
     unblock(sig);

     Neither the handler install nor the unblocking will restart the timer.

I think I have an idea how to handle both cases proper but I certainly
wanted to have clarity about the semantics before starting.

Thanks,

	tglx






--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
