From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] isalpha.3: ffix
Date: Mon,  7 Apr 2014 19:43:40 +0200
Message-ID: <1396892620-10994-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/isalpha.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/isalpha.3 b/man3/isalpha.3
index ae792a8..4364d52 100644
--- a/man3/isalpha.3
+++ b/man3/isalpha.3
@@ -114,7 +114,7 @@ _GNU_SOURCE
 .RE
 .PD
 
-.BR isascii_l (),
+.BR isascii_l ():
 .PD 0
 .RS 4
 .TP
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
