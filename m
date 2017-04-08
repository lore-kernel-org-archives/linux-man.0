From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] environ.7: Fix name of function that honors TMPDIR
Date: Sat,  8 Apr 2017 18:11:46 +0200
Message-ID: <20170408161146.7064-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

tempnam() takes the TMPDIR environment variable into account, unlike
tmpnam(), which always creates pathnames within /tmp.

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man7/environ.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/environ.7 b/man7/environ.7
index a6b4fc14d..366a1e017 100644
--- a/man7/environ.7
+++ b/man7/environ.7
@@ -186,7 +186,7 @@ and
 .IP *
 .B TMPDIR
 influences the path prefix of names created by
-.BR tmpnam (3)
+.BR tempnam (3)
 and other routines, and the temporary directory used by
 .BR sort (1)
 and other programs.
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
