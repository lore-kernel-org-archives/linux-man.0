From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] utimensat.2: tfix
Date: Wed, 24 Feb 2016 19:03:18 +0100
Message-ID: <1456336998-8134-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/utimensat.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/utimensat.2 b/man2/utimensat.2
index 047cda0..bfad7d6 100644
--- a/man2/utimensat.2
+++ b/man2/utimensat.2
@@ -243,7 +243,7 @@ values are
 and either:
 .RS
 .IP * 3
-the the effective user ID of the caller does not match
+the effective user ID of the caller does not match
 the owner of the file,
 the caller does not have write access to the file,
 and the caller is not privileged
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
