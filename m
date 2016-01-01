From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] toupper.3: tfix
Date: Fri,  1 Jan 2016 15:49:03 +0100
Message-ID: <1451659743-5523-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man3/toupper.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/toupper.3 b/man3/toupper.3
index 2401a4d..d90a980 100644
--- a/man3/toupper.3
+++ b/man3/toupper.3
@@ -76,7 +76,7 @@ but uses the locale referred to by the locale handle
 
 If
 .I c
-is a uppercase letter,
+is an uppercase letter,
 .BR tolower ()
 returns its lowercase equivalent,
 if a lowercase representation exists in the current locale.
-- 
2.6.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
