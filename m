From: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
Subject: [PATCH 1/5] kcmp.2: note about SECURITY_YAMA
Date: Fri, 20 Dec 2013 16:37:39 -0800
Message-ID: <1387586263-9002-1-git-send-email-shawn@churchofgit.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
---
 man2/kcmp.2 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man2/kcmp.2 b/man2/kcmp.2
index 59dd4d1..c910ac2 100644
--- a/man2/kcmp.2
+++ b/man2/kcmp.2
@@ -187,7 +187,12 @@ is invalid.
 Insufficient permission to inspect process resources.
 The
 .B CAP_SYS_PTRACE
-capability is required to inspect processes that you do not own.
+capability is required to inspect processes that you do not own. Other
+limitations on ptrace apply, such as
+.BR CONFIG_SECURITY_YAMA ,
+which when /proc/sys/kernel/yama/ptrace_scope is 2 (the default) limits
+.BR kcmp()
+to child processes.
 .TP
 .B ESRCH
 Process
-- 
1.8.5.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
