From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] getdents.2: tfix
Date: Thu, 28 Mar 2013 22:21:38 -0400
Message-ID: <1364523698-15564-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/getdents.2 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/getdents.2 b/man2/getdents.2
index b0fc971..91d0a31 100644
--- a/man2/getdents.2
+++ b/man2/getdents.2
@@ -73,7 +73,7 @@ struct linux_dirent {
                            offsetof(struct linux_dirent, d_name)) */
     /*
     char           pad;       // Zero padding byte
-    char           d_type;    // File type (only since Linux 2.6.4;
+    char           d_type;    // File type (only since Linux 2.6.4);
                               // offset is (d_reclen \- 1)
     */
 
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
