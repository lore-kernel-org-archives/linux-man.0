From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] alarm.2, io_destroy.2: tfix
Date: Sun, 12 May 2013 15:28:08 -0400
Message-ID: <1368386889-31178-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Actually a consistency fix.
---
 man2/alarm.2      |    2 +-
 man2/io_destroy.2 |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/alarm.2 b/man2/alarm.2
index 736cd90..7252880 100644
--- a/man2/alarm.2
+++ b/man2/alarm.2
@@ -46,7 +46,7 @@ seconds.
 
 If
 .I seconds
-is zero, any pending alarm is cancelled.
+is zero, any pending alarm is canceled.
 
 In any event any previously set
 .BR alarm ()
diff --git a/man2/io_destroy.2 b/man2/io_destroy.2
index 4a8cf28..e4d78a5 100644
--- a/man2/io_destroy.2
+++ b/man2/io_destroy.2
@@ -24,7 +24,7 @@ system call
 will attempt to cancel all outstanding asynchronous I/O operations against
 .IR ctx_id ,
 will block on the completion of all operations
-that could not be cancelled, and will destroy the
+that could not be canceled, and will destroy the
 .IR ctx_id .
 .SH RETURN VALUE
 On success,
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
