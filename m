From: Tyler Hicks <tyhicks-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH 3/4] seccomp.2: SECCOMP_FILTER_FLAG_LOG flag
Date: Thu, 26 Oct 2017 04:11:41 +0000
Message-ID: <1508991102-13686-4-git-send-email-tyhicks@canonical.com>
References: <1508991102-13686-1-git-send-email-tyhicks@canonical.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508991102-13686-1-git-send-email-tyhicks-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Document the SECCOMP_FILTER_FLAG_LOG seccomp(2) flag added in Linux
commit v4.14-rc2~15^2~6.

Signed-off-by: Tyler Hicks <tyhicks-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
 man2/seccomp.2 | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/man2/seccomp.2 b/man2/seccomp.2
index a356f22..c85c289 100644
--- a/man2/seccomp.2
+++ b/man2/seccomp.2
@@ -205,6 +205,14 @@ Synchronization will fail if another thread in the same process is in
 .BR SECCOMP_MODE_STRICT
 or if it has attached new seccomp filters to itself,
 diverging from the calling thread's filter tree.
+.TP
+.BR SECCOMP_FILTER_FLAG_LOG " (since Linux 4.14)"
+.\" commit e66a39977985b1e69e17c4042cb290768eca9b02
+All filter return actions except
+.BR SECCOMP_RET_ALLOW
+should be logged. An administrator may override this filter flag by preventing specific actions from being logged via the
+.IR /proc/sys/kernel/seccomp/actions_logged
+file.
 .RE
 .TP
 .BR SECCOMP_GET_ACTION_AVAIL " (since Linux 4.14)"
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
