From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] capabilities.7: tfix
Date: Tue, 29 Jul 2014 21:45:08 +0400
Message-ID: <1406655908-2445-1-git-send-email-yuray@komyakino.ru>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man7/capabilities.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/capabilities.7 b/man7/capabilities.7
index 0b7f89f..3d37fdd 100644
--- a/man7/capabilities.7
+++ b/man7/capabilities.7
@@ -914,7 +914,7 @@ Removing capabilities from the bounding set is supported only if file
 capabilities are compiled into the kernel.
 In kernels before Linux 2.6.33,
 file capabilities were an optional feature configurable via the
-CONFIG_SECURITY_FILE_CAPABILITIES
+.B CONFIG_SECURITY_FILE_CAPABILITIES
 option.
 Since Linux 2.6.33, the configuration option has been removed
 and file capabilities are always part of the kernel.
-- 
2.0.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
