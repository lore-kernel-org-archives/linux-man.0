From: Alan Stern <stern@rowland.harvard.edu>
Subject: Error (?) in man page for ppoll(2)
Date: Sun, 21 Jul 2019 11:32:16 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1907211104350.15063-100000@netrider.rowland.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mtk.manpages@gmail.com, linux-man@vger.kernel.org, Kernel development list <linux-kernel@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

Here are two extracts from the man page for ppoll(2) (from the
man-pages 4.16 package; the 5.01 version is the same):

       Specifying a negative value in timeout means an infinite timeout.


       Other than the difference in the precision of the timeout argument, the
       following ppoll() call:

           ready = ppoll(&fds, nfds, tmo_p, &sigmask);

       is equivalent to atomically executing the following calls:

           sigset_t origmask;
           int timeout;

           timeout = (tmo_p == NULL) ? -1 :
                     (tmo_p->tv_sec * 1000 + tmo_p->tv_nsec / 1000000);
           pthread_sigmask(SIG_SETMASK, &sigmask, &origmask);
           ready = poll(&fds, nfds, timeout);
           pthread_sigmask(SIG_SETMASK, &origmask, NULL);

But if tmo_p->tv_sec is negative, the ppoll() call is not equivalent to 
the corresponding poll() call.  The kernel rejects negative values of 
tv_sec with an EINVAL error; it does not interpret the value as meaning 
an infinite timeout.

(Yes, the kernel interprets tmo_p == NULL as an infinite timeout, but 
the man page is still wrong for the case tmo_p->tv_sec < 0.)

Suggested fix: Following the end of the second extract above, add:

	except that negative time values in tmo_p are not interpreted
	as an infinite timeout.

Also, in the ERRORS section, change the text for EINVAL to:

	EINVAL The nfds value exceeds the RLIMIT_NOFILE value or
	*tmo_p contains an invalid (negative) time value.

Alan Stern
