From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 15/19] ld.so.8: tfix
Date: Sun,  6 Dec 2015 19:47:28 +0100
Message-ID: <1449427652-3585-15-git-send-email-jwilk@jwilk.net>
References: <1449427652-3585-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449427652-3585-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man8/ld.so.8 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man8/ld.so.8 b/man8/ld.so.8
index 8a80eba..608cf7c 100644
--- a/man8/ld.so.8
+++ b/man8/ld.so.8
@@ -83,7 +83,7 @@ In the default path
 .IR /lib ,
 and then
 .IR /usr/lib .
-(On some 64-bit archiectures, the default paths for 64-bit shared objects are
+(On some 64-bit architectures, the default paths for 64-bit shared objects are
 .IR /lib64 ,
 and then
 .IR /usr/lib64 .)
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
