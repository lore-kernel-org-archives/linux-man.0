From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 06/19] cbrt.3: tfix
Date: Sun,  6 Dec 2015 19:47:19 +0100
Message-ID: <1449427652-3585-6-git-send-email-jwilk@jwilk.net>
References: <1449427652-3585-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449427652-3585-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man3/cbrt.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/cbrt.3 b/man3/cbrt.3
index c44b8ec..cdbae5b 100644
--- a/man3/cbrt.3
+++ b/man3/cbrt.3
@@ -63,7 +63,7 @@ or
 .BR cbrtl ():
 .RS 4
 _BSD_SOURCE || _SVID_SOURCE || _XOPEN_SOURCE\ >=\ 600 || _ISOC99_SOURCE ||
-_POSIX_C_SOUCE\ >=\ 200112L;
+_POSIX_C_SOURCE\ >=\ 200112L;
 .br
 or
 .I cc\ -std=c99
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
