From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] zdump.8: Add OPTIONS section
Date: Sat,  8 Apr 2017 17:52:41 +0200
Message-ID: <20170408155241.6130-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man8/zdump.8 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man8/zdump.8 b/man8/zdump.8
index 789e6672b..f5c2d643b 100644
--- a/man8/zdump.8
+++ b/man8/zdump.8
@@ -24,7 +24,7 @@ prints the current time in each
 .I zonename
 named on the command line.
 .PP
-These options are available:
+.SH OPTIONS
 .TP
 .B \-\-version
 Output version information and exit.
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
