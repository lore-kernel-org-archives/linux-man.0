From: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] llseek.2: wfix
Date: Tue, 26 May 2015 00:20:41 +0900
Message-ID: <1432567241-8825-1-git-send-email-namhyung@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man2/llseek.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/llseek.2 b/man2/llseek.2
index da674df..2426315 100644
--- a/man2/llseek.2
+++ b/man2/llseek.2
@@ -61,7 +61,7 @@ It returns the resulting file position in the argument
 .IR result .
 
 This system call exists on various 32-bit platforms to support
-seeking lo large file offsets.
+seeking large file offsets.
 .SH RETURN VALUE
 Upon successful completion,
 .BR _llseek ()
-- 
2.4.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
