From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] shmget.2: wfix
Date: Fri, 23 May 2014 15:42:38 +0200
Message-ID: <1400852558-10067-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The section is about failures, no need to recall this for that specific
error code.
---
 man2/shmget.2 | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/man2/shmget.2 b/man2/shmget.2
index 44e3daa..f781048 100644
--- a/man2/shmget.2
+++ b/man2/shmget.2
@@ -214,8 +214,7 @@ or greater than
 .BR SHMMAX .
 .TP
 .B EINVAL
-(The call did not create a new segment and)
-a segment for the given
+A segment for the given
 .I key
 exists, but \fIsize\fP is greater than the size
 of that segment.
-- 
2.0.0.rc2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
