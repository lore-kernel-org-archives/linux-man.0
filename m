From: Tyler Hicks <tyhicks-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH 4/4] seccomp.2: SECCOMP_RET_LOG action
Date: Thu, 26 Oct 2017 04:11:42 +0000
Message-ID: <1508991102-13686-5-git-send-email-tyhicks@canonical.com>
References: <1508991102-13686-1-git-send-email-tyhicks@canonical.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508991102-13686-1-git-send-email-tyhicks-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Document the SECCOMP_RET_LOG seccomp(2) action added in Linux commit
v4.14-rc2~15^2~5.

Signed-off-by: Tyler Hicks <tyhicks-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
 man2/seccomp.2 | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/man2/seccomp.2 b/man2/seccomp.2
index c85c289..8c91a47 100644
--- a/man2/seccomp.2
+++ b/man2/seccomp.2
@@ -507,6 +507,14 @@ of other
 sandboxed processes\(emwithout extreme care;
 ptracers can use this mechanism to escape from the seccomp sandbox.)
 .TP
+.BR SECCOMP_RET_LOG " (since Linux 4.14)"
+.\" commit 59f5cf44a38284eb9e76270c786fb6cc62ef8ac4
+This value results in the system call being executed after the filter return
+action is logged. An administrator may override the logging of this action via
+the
+.IR /proc/sys/kernel/seccomp/actions_logged
+file.
+.TP
 .BR SECCOMP_RET_ALLOW
 This value results in the system call being executed.
 .SS /proc interfaces
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
