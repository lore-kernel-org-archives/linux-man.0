From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 4/8] request_key.2: tfix
Date: Wed,  4 Jan 2017 00:36:53 +0100
Message-ID: <20170103233657.8875-4-jwilk@jwilk.net>
References: <20170103233657.8875-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170103233657.8875-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/request_key.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/request_key.2 b/man2/request_key.2
index c6cdddc6b..843fdb8ef 100644
--- a/man2/request_key.2
+++ b/man2/request_key.2
@@ -462,7 +462,7 @@ specifiers.
 
 Then we run the program and check the contents of
 .IR /proc/keys
-to verify that the requested kay has been instantiated:
+to verify that the requested key has been instantiated:
 
 .in +4n
 .nf
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
