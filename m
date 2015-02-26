From: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] memusage.1: tfix
Date: Thu, 26 Feb 2015 23:23:25 +0900
Message-ID: <1424960605-31766-1-git-send-email-namhyung@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man1/memusage.1 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man1/memusage.1 b/man1/memusage.1
index 1bcb758..2e477f5 100644
--- a/man1/memusage.1
+++ b/man1/memusage.1
@@ -163,7 +163,7 @@ Also trace
 .BR mmap (2),
 .BR mremap (2),
 and
-.BR mmap (2).
+.BR munmap (2).
 .TP
 .BI \-?\fR,\ \fB\-\-help
 Print help and exit.
-- 
2.3.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
