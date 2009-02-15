From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: For review: timer_settime.2
Date: Sun, 15 Feb 2009 10:39:34 +0100 (CET)
Message-ID: <alpine.LFD.2.00.0902151036140.5958@localhost.localdomain>
References: <4990DE50.7090503@gmail.com> <1234446864.10603.6.camel@laptop>  <49932437.3030005@gmail.com> <1234647684.4695.14.camel@laptop>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1234647684.4695.14.camel@laptop>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sat, 14 Feb 2009, Peter Zijlstra wrote:
> On Thu, 2009-02-12 at 08:17 +1300, Michael Kerrisk wrote:
> > Hi Peter,
> > 
> > Peter Zijlstra wrote:
> > > On Tue, 2009-02-10 at 14:54 +1300, Michael Kerrisk wrote:
> > >>        If the value of the CLOCK_REALTIME clock is adjusted  while  an
> > >>        absolute  timer  based on that clock is armed, then the expira-
> > >>        tion of the timer will be appropriately adjusted.   Adjustments
> > >>        to  the  CLOCK_REALTIME clock have no effect on relative timers
> > >>        based on that clock.
> > > 
> > > I cannot find this to be true.
> > > 
> > >>From what I can make of the code, clock_settime() ends up calling
> > > do_sys_settimeofday() for CLOCK_REALTIME (and the other clocks).
> > > 
> > > It is, however, not treating relative/abs timers any differently.
> > > 
> > > Both get converted to an absolute expiration time when set.
> > > 
> > > If POSIX mandates that we keep relative timers unchanged when we change
> > > the underlying clock, we'd have to iterate all pending timers and reset
> > > them.
> > 
> > The rules do indeed come from POSIX.
> > 
> > And indeed the rules do seem to be followed on Linux.  Since I found
> > parts of the code to be hard to track, I also checked things with an
> > example program.  (Ahhh! the pitfalls of reading code to find the
> > truth!)
> 
> Ah, quite so. The magic is in hrtimers. Relative timers are ran on clock
> monotonic.

Yes. I tripped over the relative CLOCK_REALTIME timer not being
affected of clock modifications in the early days of hrtimers. The
solution was just to run those timers on CLOCK_MONOTONIC to avoid any
special treatment.

Thanks,

	tglx
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
