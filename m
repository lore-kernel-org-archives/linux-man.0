From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] sk98lin.4: tfix
Date: Fri,  7 Feb 2014 22:24:20 +0100
Message-ID: <1391808260-2295-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man4/sk98lin.4 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man4/sk98lin.4 b/man4/sk98lin.4
index 43b3be3..5541ed9 100644
--- a/man4/sk98lin.4
+++ b/man4/sk98lin.4
@@ -268,7 +268,7 @@ This parameter indicates the duplex mode to be used for port B
 of an adapter card.
 Possible values are:
 .IR Half ,
-.IR Full .
+.IR Full ,
 or
 .IR Both ;
 .I Both
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
