From: Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [patch] wait4.2: Add a note that these functions are deprecated
Date: Wed, 19 Sep 2012 00:01:16 +0300
Message-ID: <20120918210116.GA22808@bunk.dyndns.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man2/wait4.2 |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man2/wait4.2 b/man2/wait4.2
index 68e49ad..3548396 100644
--- a/man2/wait4.2
+++ b/man2/wait4.2
@@ -31,7 +31,7 @@
 .\"	Rewrote much of this page, and removed much duplicated text,
 .\"		replacing with pointers to wait.2
 .\"
-.TH WAIT4 2  2010-09-20 "Linux" "Linux Programmer's Manual"
+.TH WAIT4 2  2012-09-18 "Linux" "Linux Programmer's Manual"
 .SH NAME
 wait3, wait4 \- wait for process to change state, BSD style
 .SH SYNOPSIS
@@ -150,10 +150,15 @@ On Linux,
 is a library function implemented on top of the
 .BR wait4 ()
 system call.
+
+These functions are deprecated (not in POSIX.1-2001), use
+.BR waitpid (2)
+in new programs.
 .SH "SEE ALSO"
 .BR fork (2),
 .BR getrusage (2),
 .BR sigaction (2),
 .BR signal (2),
 .BR wait (2),
+.BR waitpid (2),
 .BR signal (7)
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
