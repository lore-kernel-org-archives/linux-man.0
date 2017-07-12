From: Long Wang <w@laoqinren.net>
Subject: [PATCH] getline.3: wfix
Date: Wed, 12 Jul 2017 16:10:01 +0800
Message-ID: <1499847001-83794-1-git-send-email-w@laoqinren.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Long Wang <w@laoqinren.net>
---
 man3/getline.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/getline.3 b/man3/getline.3
index 7483afd..9bc4d8e 100644
--- a/man3/getline.3
+++ b/man3/getline.3
@@ -173,7 +173,7 @@ main(int argc, char *argv[])
     ssize_t nread;
 
     if (argc != 2) {
-        fprintf(stderr, "Usage: %s <file>\en", argv[1]);
+        fprintf(stderr, "Usage: %s <file>\en", argv[0]);
         exit(EXIT_FAILURE);
     }
 
-- 
2.7.4



--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
