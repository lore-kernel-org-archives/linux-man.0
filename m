From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] get_robust_list.2: tfix
Date: Tue,  8 May 2012 22:49:13 -0400
Message-ID: <1336531753-22522-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Only one set_robust_list() error is currently documented.
---
 man2/get_robust_list.2 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/get_robust_list.2 b/man2/get_robust_list.2
index e6e753e..7dc0198 100644
--- a/man2/get_robust_list.2
+++ b/man2/get_robust_list.2
@@ -79,7 +79,7 @@ an error code otherwise.
 .SH ERRORS
 The
 .BR set_robust_list ()
-system call can fail with the following errors:
+system call can fail with the following error:
 .TP
 .B EINVAL 
 .I len
-- 
1.7.10

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
