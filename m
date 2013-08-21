From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] fstatat.2: wfix
Date: Wed, 21 Aug 2013 22:41:16 +0200
Message-ID: <1377117676-28260-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/fstatat.2 |    1 -
 1 file changed, 1 deletion(-)

diff --git a/man2/fstatat.2 b/man2/fstatat.2
index 877a175..d8ca0eb 100644
--- a/man2/fstatat.2
+++ b/man2/fstatat.2
@@ -96,7 +96,6 @@ can either be 0, or include one or more of the following flags ORed:
 If
 .I pathname
 is an empty string, operate on the file referred to by
-in which case the call operates on the file referred to by
 .IR dirfd
 (which may have been obtained using the
 .BR open (2)
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
