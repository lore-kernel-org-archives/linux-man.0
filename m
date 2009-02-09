From: Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
Subject: Re: Why does timerfd() only support CLOCK_REALTIME and
	CLOCK_MONOTONIC?
Date: Sun, 8 Feb 2009 18:24:28 -0800
Message-ID: <20090209022428.GA10891@suse.de>
References: <cfd18e0f0902081025t3fe333ev1616af990e6d19ce@mail.gmail.com> <alpine.DEB.1.10.0902081127510.18839@alien.or.mcafeemobile.com> <alpine.DEB.1.10.0902081245560.18839@alien.or.mcafeemobile.com> <cfd18e0f0902081329j4b18c4f2g91269d3209f1932d@mail.gmail.com> <alpine.DEB.1.10.0902081340320.18839@alien.or.mcafeemobile.com> <cfd18e0f0902081353t70f9e107g28f8003f356f84db@mail.gmail.com> <alpine.DEB.1.10.0902081405120.18839@alien.or.mcafeemobile.com> <cfd18e0f0902081412x67f97e9eq7df94148807107c8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cfd18e0f0902081412x67f97e9eq7df94148807107c8-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Davide Libenzi <davidel-AhlLAIvw+VEjIGhXcJzhZg@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, stable-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Feb 09, 2009 at 11:12:21AM +1300, Michael Kerrisk wrote:
> On Mon, Feb 9, 2009 at 11:06 AM, Davide Libenzi <davidel-AhlLAIvw+VEjIGhXcJzhZg@public.gmane.org> wrote:
> > On Mon, 9 Feb 2009, Michael Kerrisk wrote:
> >
> >> On Mon, Feb 9, 2009 at 10:50 AM, Davide Libenzi <davidel-AhlLAIvw+VEjIGhXcJzhZg@public.gmane.org> wrote:
> >> > On Mon, 9 Feb 2009, Michael Kerrisk wrote:
> >> >
> >> >> > @@ -186,12 +187,9 @@ SYSCALL_DEFINE2(timerfd_create, int, clo
> >> >> >        BUILD_BUG_ON(TFD_CLOEXEC != O_CLOEXEC);
> >> >> >        BUILD_BUG_ON(TFD_NONBLOCK != O_NONBLOCK);
> >> >> >
> >> >> > -       if (flags & ~(TFD_CLOEXEC | TFD_NONBLOCK))
> >> >> > +       if ((flags & ~TFD_FLAGS_SET) ||
> >> >> > +           invalid_clockid(clockid))
> >> >> >                return -EINVAL;
> >> >>
> >> >> Oh!  Does this mean that in 2.6.2[789] it wasn't possible to use
> >> >> TFD_TIMER_ABSTIME?
> >> >
> >> > No, sorry, my fault. Patch is wrong. In "create" ATM we accept only
> >> > FCNTL-like flags. In "settime" we get TFD_TIMER_ABSTIME (that needs a
> >> > check too for EINVAL).
> >>
> >> That last piece should be a separate patch, that also gets pushed back
> >> into -stable.  Do you agree?
> >
> > Hmm, it's a check for extra bits that do not cause any harm. Dunno if it
> > fits -stable requirements. You should ask Greg.
> 
> I agree that it's not a critical fix.  The point is of course that if
> other flags are evntually added to timerfd_settime(), an application
> needs a way of checking for kernel support / lack of support (a la the
> recent discussion of eventfd "[patch/rfc] eventfd semaphore-like
> behavior").  It seems to me it would be good to have that check work
> as far back as possible in older kernels. If that check is to be added
> to 2.6.29, it seems reasonable to push it back to the current -stable
> kernels.
> 
> Greg?

Sounds reasonable to me.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
