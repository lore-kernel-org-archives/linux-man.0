From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] clock_getres.2: wfix
Date: Tue, 10 Sep 2013 00:25:56 +0200
Message-ID: <1378765556-29638-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/clock_getres.2 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/clock_getres.2 b/man2/clock_getres.2
index ae7af1b..1e94b32 100644
--- a/man2/clock_getres.2
+++ b/man2/clock_getres.2
@@ -202,7 +202,7 @@ specified is not supported on this system.
 .BR clock_settime ()
 does not have permission to set the clock indicated.
 .SH VERSIONS
-This system calls first appeared in Linux 2.6.
+These system calls first appeared in Linux 2.6.
 .SH CONFORMING TO
 SUSv2, POSIX.1-2001.
 .SH AVAILABILITY
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
