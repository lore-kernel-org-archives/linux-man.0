From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: signals: Bug or manpage inconsistency?
Date: Tue, 30 May 2017 21:35:33 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1705302105190.2356@nanos>
References: <alpine.DEB.2.20.1705301402270.1950@nanos> <CA+55aFwC_8RWygnZWtgT+COY8mGY_RnDSW_vrD=+1x_NyPxChw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+55aFwC_8RWygnZWtgT+COY8mGY_RnDSW_vrD=+1x_NyPxChw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, 30 May 2017, Linus Torvalds wrote:
> On Tue, May 30, 2017 at 6:21 AM, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> wrote:
> >
> > Linus, any recollection?
> >
> > IMO, it's perfectly reasonable to discard ignored signals even when the
> > signal is in the blocked mask. When its unblocked and SIG_IGN is replaced
> > then the next signal will be delivered. But hell knows, how much user space
> > depends on this weird behaviour by now.
> 
> Is there any real reason you care? Because clearly we're doing what
> POSIX allows, and I'd be nervous about changing existing behavior.
> 
> There are various races wrt signals that happen particularly around
> fork/exec, and the way that programs handle those races is to block
> signals. I don't know that anybody cares about the exact semantics of
> this, but I could *imagine* that they do.
> 
> Our current behavior is actually very nice: blocking a signal
> basically guarantees that you're now "atomic" wrt that signal. You
> won't lose signaling events after the blocking, unless you explicitly
> throw them away.

Right, blocking signals which are not set to SIG_IGN makes perfectly sense. The
SIG_IGN case is what bothers me.

If you do

   ignore(sig);
			<- Signal discarded

   sigpending() -> empty

   block(sig);
			<- Signal queued

   sigpending() -> queued signal marked pending

   unblock(sig);
			<- Queued signal dequeued and discarded due to SIG_IGN

   sigpending() -> empty

> So I would suggest *not* changing the semantics unless you have a
> major real reason for wanting to do that.

The reason why I'm looking into that is the silly case with posix interval
timers dealing with ignored signals. We have to keep these timers self
rearming because nothing rearms them when SIG_IGN is lifted. That means
it's a nice way to keep the system busy and the process which armed the
timer is never waking up. We have a crude 'rate limit' of the interval to
one jiffie in place which prevents a unpriviledged DOS attack by arming the
timer with a very small interval. But that turns that mechanism into a
battery drain which is not obvious to figure out.

When I was working on a mitigation for that, which of course involves
fiddling with the signal code, I noticed that issue with sigpending() which
returns the blocked _and_ ignored signal as pending despite the man page
claiming otherwise. That made me look deeper and wonder about the rather
strange and inconsistent semantics of all of this.

Thanks,

	tglx


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
