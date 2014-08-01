From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] capabilities.7: tfix
Date: Fri,  1 Aug 2014 19:09:20 +0400
Message-ID: <1406905760-2232-1-git-send-email-yuray@komyakino.ru>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man7/capabilities.7 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/man7/capabilities.7 b/man7/capabilities.7
index 3d37fdd..7d55f51 100644
--- a/man7/capabilities.7
+++ b/man7/capabilities.7
@@ -1105,7 +1105,8 @@ is based on the withdrawn POSIX.1e draft standard; see
 .UE .
 .SH NOTES
 Since kernel 2.5.27, capabilities are an optional kernel component,
-and can be enabled/disabled via the CONFIG_SECURITY_CAPABILITIES
+and can be enabled/disabled via the
+.B CONFIG_SECURITY_CAPABILITIES
 kernel configuration option.
 
 The
-- 
2.0.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
