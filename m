From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] put(3): fix formatting of trailing period
Date: Sat, 20 Jan 2018 00:33:22 -0500
Message-ID: <20180120053322.9173-1-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The period after the function call is incorrectly marked with bold.

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man3/puts.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/puts.3 b/man3/puts.3
index 2f039a43729f..2396f7d82d8e 100644
--- a/man3/puts.3
+++ b/man3/puts.3
@@ -65,7 +65,7 @@ more than once.
 .PP
 .BI "putchar(" c )
 is equivalent to
-.BI "putc(" c ", " stdout ).
+.BI "putc(" c ", " stdout ) \fR.
 .PP
 .BR puts ()
 writes the string
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
