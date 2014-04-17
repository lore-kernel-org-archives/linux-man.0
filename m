From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] termios.3: sfix
Date: Wed, 16 Apr 2014 20:20:28 -0400
Message-ID: <1397694028-23971-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/termios.3 | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/man3/termios.3 b/man3/termios.3
index ec5a847..c0e3c45 100644
--- a/man3/termios.3
+++ b/man3/termios.3
@@ -751,7 +751,7 @@ If the timer expires without any input becoming available,
 .BR read (2)
 returns 0.
 If data is already available at the time of the call to
-.BR read (),
+.BR read (2),
 the call behaves as though the data was received immediately after the call.
 .TP
 MIN > 0, TIME > 0 (read with interbyte timeout)
@@ -772,14 +772,14 @@ has been received.
 (POSIX does not specify this termination condition,
 and on some other implementations
 .\" e.g., Solaris
-.BR read ()
+.BR read (2)
 does not return in this case.)
 .RE
 .IP
 Because the timer is started only after the initial byte
 becomes available, at least one byte will be read.
 If data is already available at the time of the call to
-.BR read (),
+.BR read (2),
 the call behaves as though the data was received immediately after the call.
 .PP
 POSIX
@@ -790,12 +790,12 @@ file status flag takes precedence over the MIN and TIME settings.
 If
 .B O_NONBLOCK
 is set, a
-.BR read ()
+.BR read (2)
 in noncanonical mode may return immediately,
 regardless of the setting of MIN or TIME.
 Furthermore, if no data is available,
 POSIX permits a
-.BR read ()
+.BR read (2)
 in noncanonical mode to return either 0, or \-1 with
 .I errno
 set to
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
