From: Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>
Subject: Re: For review: timer_settime.2
Date: Sat, 14 Feb 2009 22:41:24 +0100
Message-ID: <1234647684.4695.14.camel@laptop>
References: <4990DE50.7090503@gmail.com> <1234446864.10603.6.camel@laptop>
	 <49932437.3030005@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <49932437.3030005-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, 2009-02-12 at 08:17 +1300, Michael Kerrisk wrote:
> Hi Peter,
> 
> Peter Zijlstra wrote:
> > On Tue, 2009-02-10 at 14:54 +1300, Michael Kerrisk wrote:
> >>        If the value of the CLOCK_REALTIME clock is adjusted  while  an
> >>        absolute  timer  based on that clock is armed, then the expira-
> >>        tion of the timer will be appropriately adjusted.   Adjustments
> >>        to  the  CLOCK_REALTIME clock have no effect on relative timers
> >>        based on that clock.
> > 
> > I cannot find this to be true.
> > 
> >>From what I can make of the code, clock_settime() ends up calling
> > do_sys_settimeofday() for CLOCK_REALTIME (and the other clocks).
> > 
> > It is, however, not treating relative/abs timers any differently.
> > 
> > Both get converted to an absolute expiration time when set.
> > 
> > If POSIX mandates that we keep relative timers unchanged when we change
> > the underlying clock, we'd have to iterate all pending timers and reset
> > them.
> 
> The rules do indeed come from POSIX.
> 
> And indeed the rules do seem to be followed on Linux.  Since I found
> parts of the code to be hard to track, I also checked things with an
> example program.  (Ahhh! the pitfalls of reading code to find the
> truth!)

Ah, quite so. The magic is in hrtimers. Relative timers are ran on clock
monotonic.

OK I think that was the last bit.

Feel free to add:

Reviewed-by: Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>

To all 4 pathces.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
