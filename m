From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] proc.5: tfix
Date: Sun, 23 Dec 2012 09:16:42 -0400
Message-ID: <1356268602-15896-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man5/proc.5 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 78119cb..0a184d2 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -325,7 +325,7 @@ Up to and including Linux 2.6.35,
 this file is protected to only allow reading by the real UID of the process.
 Since Linux 2.6.36,
 .\" commit 3036e7b490bf7878c6dae952eec5fb87b1106589
-this file is readable file is readable
+this file is readable
 by all users on the system.
 .TP
 .I /proc/[pid]/maps
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
