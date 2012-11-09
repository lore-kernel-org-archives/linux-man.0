From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] getauxval.3: ffix
Date: Fri,  9 Nov 2012 19:17:58 -0400
Message-ID: <1352503078-32586-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/getauxval.3 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/getauxval.3 b/man3/getauxval.3
index 825b224..3b456ed 100755
--- a/man3/getauxval.3
+++ b/man3/getauxval.3
@@ -119,7 +119,7 @@ The instruction cache block size.
 .TP
 .BR AT_PAGESZ
 The system page size (the same value returned by
-.IR sysconf(_SC_PAGESIZE) .
+.IR sysconf(_SC_PAGESIZE) ).
 .TP
 .BR AT_PHDR
 The address of the program headers of the executable.
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
