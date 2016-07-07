From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 2/3] ip.7: tfix
Date: Thu,  7 Jul 2016 11:57:37 +0200
Message-ID: <1467885458-625-2-git-send-email-jwilk@jwilk.net>
References: <1467885458-625-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467885458-625-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man7/ip.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/ip.7 b/man7/ip.7
index 37e2c86..8db71e2 100644
--- a/man7/ip.7
+++ b/man7/ip.7
@@ -1150,7 +1150,7 @@ address was not local.
 Operation on a nonblocking socket would block.
 .TP
 .B EALREADY
-An connection operation on a nonblocking socket is already in progress.
+A connection operation on a nonblocking socket is already in progress.
 .TP
 .B ECONNABORTED
 A connection was closed during an
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
