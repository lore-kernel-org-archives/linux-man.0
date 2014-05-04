From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/3] inet.3: tfix
Date: Sat,  3 May 2014 21:24:34 -0400
Message-ID: <1399166675-16019-2-git-send-email-taffit@debian.org>
References: <1399166675-16019-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399166675-16019-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/inet.3 | 1 -
 1 file changed, 1 deletion(-)

diff --git a/man3/inet.3 b/man3/inet.3
index 611655d..18d2982 100644
--- a/man3/inet.3
+++ b/man3/inet.3
@@ -130,7 +130,6 @@ The form that uses exactly four decimal numbers is referred to as
 (or sometimes:
 .IR "IPv4 dotted-quad notation" ).
 
-If
 .BR inet_aton ()
 returns 1 if the supplied string was successfully interpreted,
 or 0 if the string is invalid
-- 
2.0.0.rc0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
