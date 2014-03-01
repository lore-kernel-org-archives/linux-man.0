From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] unlink.2: same intro paragraph of unlinkat() errors as other *at()
Date: Sat,  1 Mar 2014 14:10:39 +0100
Message-ID: <1393679439-1123-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Same as link.2, open.2, readlink.2, rename.2, symlink.2, etc.
---
 man2/unlink.2 | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/man2/unlink.2 b/man2/unlink.2
index 7aafb90..d6a7a68 100644
--- a/man2/unlink.2
+++ b/man2/unlink.2
@@ -237,12 +237,6 @@ capability).
 .I pathname
 refers to a file on a read-only filesystem.
 .PP
-The same errors that occur for
-.BR unlink ()
-and
-.BR rmdir (2)
-can also occur for
-.BR unlinkat ().
 The following additional errors can occur for
 .BR unlinkat ():
 .TP
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
