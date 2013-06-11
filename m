From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] fallocate.2: 0 is returned on *success*
Date: Tue, 11 Jun 2013 21:59:29 +0200
Message-ID: <1370980770-25405-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Introduced by 47a979088fcd7f
---
 man2/fallocate.2 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/fallocate.2 b/man2/fallocate.2
index a61c513..58a19c2 100644
--- a/man2/fallocate.2
+++ b/man2/fallocate.2
@@ -110,7 +110,7 @@ Not all file systems support
 .BR FALLOC_FL_PUNCH_HOLE ;
 if a file system doesn't support the operation, an error is returned.
 .SH RETURN VALUE
-On error,
+On success,
 .BR fallocate ()
 returns zero.
 On error, \-1 is returned and
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
