From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] open.2: tfix
Date: Sun, 12 Mar 2017 00:01:45 +0100
Message-ID: <20170311230145.7243-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/open.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/open.2 b/man2/open.2
index 6e6398374..750cc1ad0 100644
--- a/man2/open.2
+++ b/man2/open.2
@@ -178,7 +178,7 @@ Before each
 the file offset is positioned at the end of the file,
 as if with
 .BR lseek (2).
-The modification of the fle offset and the write operation
+The modification of the file offset and the write operation
 are performed as a single atomic step.
 
 .B O_APPEND
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
