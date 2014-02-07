From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] set_mempolicy.2: ffix
Date: Fri,  7 Feb 2014 22:11:51 +0100
Message-ID: <1391807511-32596-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/set_mempolicy.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/set_mempolicy.2 b/man2/set_mempolicy.2
index b1aabb7..f891cc4 100644
--- a/man2/set_mempolicy.2
+++ b/man2/set_mempolicy.2
@@ -78,7 +78,7 @@ The
 argument must specify one of
 .BR MPOL_DEFAULT ,
 .BR MPOL_BIND ,
-.BR MPOL_INTERLEAVE,
+.BR MPOL_INTERLEAVE ,
 or
 .BR MPOL_PREFERRED .
 All modes except
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
