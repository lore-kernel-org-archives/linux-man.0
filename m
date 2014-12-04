From: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
Subject: Erroneous text about EINTR in futex man page
Date: Thu, 4 Dec 2014 14:08:46 -0500
Message-ID: <20141204190846.GA25606@brightrain.aerifal.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The following text in the futex(2) man page seems incorrect:

       EINTR  A FUTEX_WAIT operation was interrupted by a signal (see
              signal(7)) or a spurious wakeup.

I see no code in the kernel whereby a "spurious wakeup", or anything
other than interruption by a signal handler that's not SA_RESTART, can
cause futex to fail with EINTR. In general, overloading of EINTR
and/or spurious EINTRs from a syscall make it impossible to use that
syscall for implementing any function where EINTR is a mandatory
failure on interruption-by-signal, since there is no way for userspace
to distinguish whether the EINTR occurred as a result of an
interrupting signal or some other reason. The kernel folks have gone
to great lengths to fix spurious EINTRs (see signal(7) for history),
especially by non-interrupting signal handlers, including in futex,
and allowing EINTR here would be contrary to that goal.

It's my belief that the "or a spurious wakeup" text should simply be
removed.

The reason I'm raising this topic is its relevance to a thread on
libc-alpha:
[RFC] mutex destruction (#13690): problem description and workarounds

Rich
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
