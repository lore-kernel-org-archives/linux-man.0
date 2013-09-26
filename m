From: Ian Pilcher <arequipeno-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: ppoll with multiple threads
Date: Thu, 26 Sep 2013 17:04:46 -0500
Message-ID: <5244AF7E.1020500@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The select(2) man page was updated about a year ago to clarify the
behavior of pselect in multi-threaded programs.

http://git.kernel.org/cgit/docs/man-pages/man-pages.git/commit/man2/select.2?id=2e72e991695f745d6419feeb77598f61d8c86a52

Should a similar update be made to poll(2) for ppoll?

If I'm reading the kernel source (fs/select.c) correctly, both syscalls
(pselect6 and ppoll) use a (possibly unfortunately named) "sigprocmask"
function to manipulate the signal mask, so their behavior should be the
same in this regard.

Also, it might be nice to clarify that these changes are clarifications
of existing behavior, rather than new behavior (i.e. clarify the
clarification).  The current situation is pretty confusing:

http://stackoverflow.com/questions/17011460/ppoll-vs-pselect-with-multiple-threads

-- 
========================================================================
Ian Pilcher                                         arequipeno-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Sometimes there's nothing left to do but crash and burn...or die trying.
========================================================================
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
