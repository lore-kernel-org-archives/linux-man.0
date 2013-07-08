From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] console_ioctl.4: tfix
Date: Tue,  9 Jul 2013 00:27:46 +0200
Message-ID: <1373322466-14811-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man4/console_ioctl.4 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man4/console_ioctl.4 b/man4/console_ioctl.4
index 5cb3e2f..7f5a444 100644
--- a/man4/console_ioctl.4
+++ b/man4/console_ioctl.4
@@ -213,7 +213,7 @@ and
 .I charheight
 are filled with
 the respective data for the currently loaded font, and the
-.I hardata
+.I chardata
 array contains the font data if the initial value of
 .I charcount
 indicated enough space was available; otherwise the
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
