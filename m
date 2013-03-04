From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] nss.5: tfix
Date: Sun,  3 Mar 2013 20:12:30 -0400
Message-ID: <1362355950-12047-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man5/nss.5 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man5/nss.5 b/man5/nss.5
index 9486a7e..45c91e1 100644
--- a/man5/nss.5
+++ b/man5/nss.5
@@ -71,7 +71,7 @@ If set to TRUE, the NIS backend for the
 .BR getservbyname (3)
 and
 .BR getservbyname_r (3)
-function will assume that the
+functions will assume that the
 .I services.byservicename
 NIS map exists and is authoritative, particularly
 that it contains both keys with /proto and without /proto for both
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
