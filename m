From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] mcheck.3: typo in compiler flag
Date: Wed, 18 Dec 2013 20:28:13 +0100
Message-ID: <1387394893-7789-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

See http://bugs.debian.org/732464

Reported-by: Raphael Geissert <geissert-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
---
 man3/mcheck.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/mcheck.3 b/man3/mcheck.3
index 17b38cb..9c52a8e 100644
--- a/man3/mcheck.3
+++ b/man3/mcheck.3
@@ -55,7 +55,7 @@ function must be called before the first call to
 .BR malloc (3)
 or a related function.
 In cases where this is difficult to ensure, linking the program with
-.IR \-mcheck
+.IR \-lmcheck
 inserts an implicit call to
 .BR mcheck ()
 (with a NULL argument)
-- 
1.8.5.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
