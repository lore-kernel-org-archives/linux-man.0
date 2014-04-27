From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] fallocate.2: ffix
Date: Sun, 27 Apr 2014 23:52:25 +0200
Message-ID: <1398635545-12432-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/fallocate.2 | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/man2/fallocate.2 b/man2/fallocate.2
index b14bb28..73c4f12 100644
--- a/man2/fallocate.2
+++ b/man2/fallocate.2
@@ -233,12 +233,14 @@ or
 is not a multiple of the filesystem block size.
 .TP
 .B EINVAL
-mode contains both
+.I mode
+contains both
 .B FALLOC_FL_COLLAPSE_RANGE
 and other flags;
 no other flags are permitted with
 .BR FALLOC_FL_COLLAPSE_RANGE .
-.TP EINVAL
+.TP
+.B EINVAL
 .I mode
 is
 .BR FALLOC_FL_COLLAPSE_RANGE ,
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
