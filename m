From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] fallocate.2: ffix
Date: Sun, 18 May 2014 18:28:02 +0200
Message-ID: <1400430482-25427-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/fallocate.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/fallocate.2 b/man2/fallocate.2
index a29d7df..fa2703c 100644
--- a/man2/fallocate.2
+++ b/man2/fallocate.2
@@ -290,7 +290,7 @@ no other flags are permitted with
 is
 .BR FALLOC_FL_COLLAPSE_RANGE
 or
-.BR FALLOC_FL_ZERO_RANGE,
+.BR FALLOC_FL_ZERO_RANGE ,
 but the file referred to by
 .I fd
 is not a regular file.
-- 
2.0.0.rc2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
