From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 1/2] mtrace.3: tfix
Date: Mon, 31 Oct 2016 11:10:42 +0100
Message-ID: <20161031101043.8201-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man3/mtrace.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/mtrace.3 b/man3/mtrace.3
index 20efff1..537d1fc 100644
--- a/man3/mtrace.3
+++ b/man3/mtrace.3
@@ -88,7 +88,7 @@ T{
 .BR muntrace ()
 T}	Thread safety	MT-Unsafe
 .TE
-.\" FIXME: The marking is different from that in theglibc manual,
+.\" FIXME: The marking is different from that in the glibc manual,
 .\" markings in glibc manual are more detailed:
 .\"
 .\"      mtrace: MT-Unsafe env race:mtrace const:malloc_hooks init
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
