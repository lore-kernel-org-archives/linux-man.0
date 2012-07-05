From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] regex.3: detailed reference to GNU libc regex manual
Date: Thu,  5 Jul 2012 22:34:19 +0200
Message-ID: <1341520459-30794-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

http://www.gnu.org/software/libc/manual/html_node/Regular-Expressions.html

Following review of Debian patches
<CAKgNAkjG47WTi7CYtM20k-uNEDRcSncTaMxhfU6_DU1hsoYQSg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
---
 man3/regex.3 |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/man3/regex.3 b/man3/regex.3
index 7cd8f6b..6500576 100644
--- a/man3/regex.3
+++ b/man3/regex.3
@@ -296,4 +296,5 @@ POSIX.1-2001.
 .SH "SEE ALSO"
 .BR grep (1),
 .BR regex (7),
-GNU regex manual
+the glibc manual section
+.I "Regular Expression Matching"
-- 
1.7.10

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
