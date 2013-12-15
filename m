From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ftw.3: tfix
Date: Sun, 15 Dec 2013 16:45:13 -0400
Message-ID: <1387140313-28199-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/ftw.3 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/ftw.3 b/man3/ftw.3
index aaf1639..ba88100 100644
--- a/man3/ftw.3
+++ b/man3/ftw.3
@@ -267,7 +267,7 @@ is a directory, and \fBFTW_DEPTH\fP was specified in \fIflags\fP.
 .B FTW_DEPTH
 was not specified in
 .IR flags ,
-then directories will always be visitied with
+then directories will always be visited with
 .I typeflag
 set to
 .BR FTW_D .)
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
