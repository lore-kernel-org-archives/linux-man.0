From: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] rtld-audit.7: tfix
Date: Tue,  3 Nov 2015 09:18:17 +0900
Message-ID: <1446509897-21059-1-git-send-email-namhyung@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man7/rtld-audit.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/rtld-audit.7 b/man7/rtld-audit.7
index d0f7563..643bc57 100644
--- a/man7/rtld-audit.7
+++ b/man7/rtld-audit.7
@@ -400,7 +400,7 @@ If different
 invocations for this symbol return different values,
 then the maximum returned value is used.
 The
-.BR la_pltenter ()
+.BR la_pltexit ()
 function is called only if this buffer is
 explicitly set to a suitable value.
 
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
