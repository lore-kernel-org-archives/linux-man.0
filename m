From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] core.5: tfix
Date: Wed,  1 Feb 2017 21:28:46 +0100
Message-ID: <20170201202846.1815-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man5/core.5 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man5/core.5 b/man5/core.5
index 582886cab..8a34ebf3c 100644
--- a/man5/core.5
+++ b/man5/core.5
@@ -240,7 +240,7 @@ Since kernel 2.6.19, Linux supports an alternate syntax for the
 file.
 If the first character of this file is a pipe symbol (\fB|\fP),
 then the remainder of the line is interpreted as the command-line for
-a a user-space program (or script) that is to be executed.
+a user-space program (or script) that is to be executed.
 Instead of being written to a disk file, the core dump is given as
 standard input to the program.
 Note the following points:
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
