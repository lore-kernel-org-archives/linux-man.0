From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] prctl.2: ffix
Date: Sun,  4 May 2014 22:27:47 +0200
Message-ID: <1399235267-16903-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/prctl.2 | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/man2/prctl.2 b/man2/prctl.2
index fcc8922..1199891 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -962,7 +962,8 @@ is nonzero.
 .TP
 .B EINVAL
 .I option
-is PR_SET_THP_DISABLE
+is
+.BR PR_SET_THP_DISABLE
 and
 .IR arg3 ,
 .IR arg4 ,
@@ -972,7 +973,8 @@ is nonzero.
 .TP
 .B EINVAL
 .I option
-is PR_GET_THP_DISABLE
+is
+.BR PR_GET_THP_DISABLE
 and
 .IR arg2 ,
 .IR arg3 ,
-- 
2.0.0.rc0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
