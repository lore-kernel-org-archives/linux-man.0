From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] alarm.2: wfix
Date: Sat,  1 Mar 2014 15:48:41 +0100
Message-ID: <1393685321-20813-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/alarm.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/alarm.2 b/man2/alarm.2
index 6805ae8..1eea89d 100644
--- a/man2/alarm.2
+++ b/man2/alarm.2
@@ -69,7 +69,7 @@ Alarms created by
 .BR alarm()
 are preserved across
 .BR execve (2)
-not are not inherited by children created via
+and are not inherited by children created via
 .BR fork (2).
 .PP
 .BR sleep (3)
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
