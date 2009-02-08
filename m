From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Why does timerfd() only support CLOCK_REALTIME and CLOCK_MONOTONIC?
Date: Mon, 9 Feb 2009 07:25:50 +1300
Message-ID: <cfd18e0f0902081025t3fe333ev1616af990e6d19ce@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Davide Libenzi <davidel-AhlLAIvw+VEjIGhXcJzhZg@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Davide,

At the moment I'm looking into writing man pages for timer_create(2)
and friends.  (Somewhat bizarrely, these pages do not yet exist.)  As
I looked into the source code of timer_create(), etc., and did some
tests, I saw that timer_create() supports the following clocks:

TIMER_REALTIME
TIMER_MONOTONIC
TIMER_PROCESS_CPUTIME_ID
TIMER_THREAD_CPUTIME_ID
clockid obtained from clock_getcpuclockid(3)
clockid obtained from pthread_getcpuclockid(3)

On the other hand, timerfd() only permits the first two of these.
What's the reason for that limitation of timerfd()?  (It may be worth
adding something to the man page on this point.)

Cheers,

Michael
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
