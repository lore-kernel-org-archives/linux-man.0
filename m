From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] prctl.2: wfix
Date: Sat, 10 Nov 2012 19:22:39 -0400
Message-ID: <1352589760-23885-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/prctl.2 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/prctl.2 b/man2/prctl.2
index b0ab23e..c8a4919 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -418,7 +418,7 @@ Thereafter, a thread can adjust its current timer slack value via
 The timer slack values of
 .IR init
 (PID 1), the ancestor of all processes,
-is 50,000 nanoseconds (50 microseconds).
+are 50,000 nanoseconds (50 microseconds).
 The timer slack values are preserved across
 .BR execve (2).
 .TP
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
