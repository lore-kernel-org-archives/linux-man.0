From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] resolver.3: ffix
Date: Sun,  3 Mar 2013 20:10:39 -0400
Message-ID: <1362355839-11975-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/resolver.3 |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/man3/resolver.3 b/man3/resolver.3
index af532f7..d64f61c 100644
--- a/man3/resolver.3
+++ b/man3/resolver.3
@@ -87,7 +87,8 @@ domain name servers.
 The
 .BR res_init ()
 function reads the configuration files (see
-resolv.conf(5)) to get the default domain name, search order and name
+.BR resolv.conf (5))
+to get the default domain name, search order and name
 server address(es).
 If no server is given, the local host is tried.
 If no domain is given, that associated with the local host is used.
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
