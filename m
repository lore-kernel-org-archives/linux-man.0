From: Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>
Subject: [PATCH] pid_namespaces.7: tfix
Date: Sun, 16 Nov 2014 23:36:05 +0100
Message-ID: <1416177365-10451-1-git-send-email-richard@nod.at>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>
List-Id: linux-man@vger.kernel.org

s/PR_GET_CHILD_SUBREAPER/PR_SET_CHILD_SUBREAPER

Signed-off-by: Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>
---
 man7/pid_namespaces.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/pid_namespaces.7 b/man7/pid_namespaces.7
index 2090101..8582da3 100644
--- a/man7/pid_namespaces.7
+++ b/man7/pid_namespaces.7
@@ -70,7 +70,7 @@ to this process rather than
 (unless one of the ancestors of the child
 in the same PID namespace employed the
 .BR prctl (2)
-.B PR_GET_CHILD_SUBREAPER
+.B PR_SET_CHILD_SUBREAPER
 command to mark itself as the reaper of orphaned descendant processes).
 
 If the "init" process of a PID namespace terminates,
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
