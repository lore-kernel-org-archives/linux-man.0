From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] feature_test_macros.7: tfix
Date: Thu, 10 Dec 2015 20:53:48 +0100
Message-ID: <1449777228-5280-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man7/feature_test_macros.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/feature_test_macros.7 b/man7/feature_test_macros.7
index d470990..e6457e4 100644
--- a/man7/feature_test_macros.7
+++ b/man7/feature_test_macros.7
@@ -202,7 +202,7 @@ is defined with a value greater than or equal to 500
 .I and
 neither
 .B _POSIX_SOURCE
-not
+nor
 .B _POSIX_C_SOURCE
 is explicitly defined, then
 the following macros are implicitly defined:
-- 
2.6.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
