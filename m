From: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Subject: [PATCH] Fix ppoll example
Date: Sun, 27 Dec 2009 01:40:07 +0100
Message-ID: <20091227004007.GA8638@basil.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org


The ppoll replacement example gets the timeout argument
wrong. Fix that.

-Andi

--- man-pages-3.23/man2/poll.2	2009-09-30 03:36:44.000000000 +0200
+++ man-pages-3.23-hacked/man2/poll.2	2009-12-27 01:36:31.000000000 +0100
@@ -27,6 +27,7 @@
 .\" 2006-03-13, mtk, Added ppoll() + various other rewordings
 .\" 2006-07-01, mtk, Added POLLRDHUP + various other wording and
 .\"	formatting changes.
+.\" 2009-12, ak, Fix ppoll example.
 .\"
 .TH POLL 2 2009-09-15 "Linux" "Linux Programmer's Manual"
 .SH NAME
@@ -202,9 +203,10 @@
 .nf
 
     sigset_t origmask;
+    struct timespec ts = { .tv_sec = timeout };
 
     sigprocmask(SIG_SETMASK, &sigmask, &origmask);
-    ready = poll(&fds, nfds, timeout);
+    ready = poll(&fds, nfds, timeout >= 0 ? &ts : NULL);
     sigprocmask(SIG_SETMASK, &origmask, NULL);
 .fi
 .PP
-- 
ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org -- Speaking for myself only.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
