From: Davide Libenzi <davidel-AhlLAIvw+VEjIGhXcJzhZg@public.gmane.org>
Subject: Re: Why does timerfd() only support CLOCK_REALTIME and
 CLOCK_MONOTONIC?
Date: Sun, 8 Feb 2009 11:29:33 -0800 (PST)
Message-ID: <alpine.DEB.1.10.0902081127510.18839@alien.or.mcafeemobile.com>
References: <cfd18e0f0902081025t3fe333ev1616af990e6d19ce@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0902081025t3fe333ev1616af990e6d19ce-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, 9 Feb 2009, Michael Kerrisk wrote:

> Hi Davide,
> 
> At the moment I'm looking into writing man pages for timer_create(2)
> and friends.  (Somewhat bizarrely, these pages do not yet exist.)  As
> I looked into the source code of timer_create(), etc., and did some
> tests, I saw that timer_create() supports the following clocks:
> 
> TIMER_REALTIME
> TIMER_MONOTONIC
> TIMER_PROCESS_CPUTIME_ID
> TIMER_THREAD_CPUTIME_ID
> clockid obtained from clock_getcpuclockid(3)
> clockid obtained from pthread_getcpuclockid(3)
> 
> On the other hand, timerfd() only permits the first two of these.
> What's the reason for that limitation of timerfd()?  (It may be worth
> adding something to the man page on this point.)

No particular reason I can think of. If Thomas makes invalid_clockid() 
available, we could allow timerfd() to support all time timers 
timer_create() supports.
Do you see any reason why this won't work Thomas?



- Davide


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
