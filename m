From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] kcmp.2: tfix
Date: Sun, 19 Jun 2016 22:52:16 +0200
Message-ID: <1466369536-2119-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/kcmp.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/kcmp.2 b/man2/kcmp.2
index 831fd9f..78843a0 100644
--- a/man2/kcmp.2
+++ b/man2/kcmp.2
@@ -188,7 +188,7 @@ Insufficient permission to inspect process resources.
 The
 .B CAP_SYS_PTRACE
 capability is required to inspect processes that you do not own.
-Other ptrace limitations imay also apply, such as
+Other ptrace limitations may also apply, such as
 .BR CONFIG_SECURITY_YAMA ,
 which, when
 .I /proc/sys/kernel/yama/ptrace_scope
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
