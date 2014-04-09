From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] man3/mbstowcs.3: tfix
Date: Wed,  9 Apr 2014 16:02:08 -0400
Message-ID: <1397073728-29053-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/mbstowcs.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/mbstowcs.3 b/man3/mbstowcs.3
index 2689ee5..08f72a3 100644
--- a/man3/mbstowcs.3
+++ b/man3/mbstowcs.3
@@ -108,7 +108,7 @@ functionality.
 .SH EXAMPLE
 The program below illustrates the use of
 .BR mbstowcs (),
-as well as some of the wider character classification functions.
+as well as some of the wide character classification functions.
 An example run is the following:
 .in +4n
 .nf
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
