From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] toupper.3: nfix
Date: Thu, 10 Apr 2014 18:40:19 -0400
Message-ID: <1397169620-10086-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/toupper.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/toupper.3 b/man3/toupper.3
index 0b765ae..6e835b2 100644
--- a/man3/toupper.3
+++ b/man3/toupper.3
@@ -77,7 +77,7 @@ but uses the locale referred to by the locale handle
 If
 .I c
 is a uppercase letter,
-.BR toupper ()
+.BR tolower ()
 returns its lowercase equivalent,
 if a lowercase representation exists in the current locale.
 Otherwise, it returns
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
