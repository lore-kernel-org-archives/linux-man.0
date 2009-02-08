From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Why does timerfd() only support CLOCK_REALTIME and
	CLOCK_MONOTONIC?
Date: Mon, 9 Feb 2009 10:29:51 +1300
Message-ID: <cfd18e0f0902081329j4b18c4f2g91269d3209f1932d@mail.gmail.com>
References: <cfd18e0f0902081025t3fe333ev1616af990e6d19ce@mail.gmail.com>
	 <alpine.DEB.1.10.0902081127510.18839@alien.or.mcafeemobile.com>
	 <alpine.DEB.1.10.0902081245560.18839@alien.or.mcafeemobile.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.1.10.0902081245560.18839-GPJ85BhbkB8RepQJljzAVbITYcZ0+W3JAL8bYrjMMd8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Davide Libenzi <davidel-AhlLAIvw+VEjIGhXcJzhZg@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

> @@ -186,12 +187,9 @@ SYSCALL_DEFINE2(timerfd_create, int, clo
>        BUILD_BUG_ON(TFD_CLOEXEC != O_CLOEXEC);
>        BUILD_BUG_ON(TFD_NONBLOCK != O_NONBLOCK);
>
> -       if (flags & ~(TFD_CLOEXEC | TFD_NONBLOCK))
> +       if ((flags & ~TFD_FLAGS_SET) ||
> +           invalid_clockid(clockid))
>                return -EINVAL;

Oh!  Does this mean that in 2.6.2[789] it wasn't possible to use
TFD_TIMER_ABSTIME?

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
