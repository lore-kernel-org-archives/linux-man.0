From: Urs Thuermann <urs-5sm3ckEb1NlYFmeL5InDC7NAH6kLmebB@public.gmane.org>
Subject: [patch] sigprocmask.2: Explain EINVAL, add EFAULT
Date: 02 Nov 2009 16:03:00 +0100
Message-ID: <ygfy6mpq89n.fsf@janus.isnogud.escape.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Explain exactly what values for "how" in sigprocmask() are invalid.
Add EFAULT to the list of errors that may be returned by sigprocmask().

This patch is against the current man-pages git repository.

urs



diff --git a/man2/sigprocmask.2 b/man2/sigprocmask.2
index e0b4a7b..abe59d2 100644
--- a/man2/sigprocmask.2
+++ b/man2/sigprocmask.2
@@ -92,10 +92,16 @@ is unspecified in a multithreaded process; see
 .BR sigprocmask ()
 returns 0 on success and \-1 on error.
 .SH ERRORS
+.TP
 .B EINVAL
 The value specified in
 .I how
-was invalid.
+is not one of
+.BR SIG_SETMASK ", " SIG_BLOCK ", or " SIG_UNBLOCK .
+.TP
+.B EFAULT
+.IR set " or " oldset
+points to an invalid address.
 .SH "CONFORMING TO"
 POSIX.1-2001.
 .SH NOTES
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
