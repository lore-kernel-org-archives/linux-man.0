From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] resolv.conf.5: tfix
Date: Thu, 10 May 2012 13:29:44 -0400
Message-ID: <1336670984-28095-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man5/resolv.conf.5 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man5/resolv.conf.5 b/man5/resolv.conf.5
index 589c315..e82ea72 100644
--- a/man5/resolv.conf.5
+++ b/man5/resolv.conf.5
@@ -35,7 +35,7 @@ The file is designed to be human readable and contains a list of
 keywords with values that provide various types of resolver information.
 .LP
 If this file does not exist,
-only the name server be on the local machine will be queried;
+only the name server on the local machine will be queried;
 the domain name is determined from the hostname
 and the domain search path is constructed from the domain name.
 .LP
-- 
1.7.10

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
