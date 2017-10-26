From: Tyler Hicks <tyhicks-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH 2/4] seccomp.2: SECCOMP_GET_ACTION_AVAIL operation
Date: Thu, 26 Oct 2017 04:11:40 +0000
Message-ID: <1508991102-13686-3-git-send-email-tyhicks@canonical.com>
References: <1508991102-13686-1-git-send-email-tyhicks@canonical.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508991102-13686-1-git-send-email-tyhicks-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Document the SECCOMP_GET_ACTION_AVAIL seccomp(2) operation added in
Linux commit v4.14-rc2~15^2~9.

Signed-off-by: Tyler Hicks <tyhicks-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
 man2/seccomp.2 | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/man2/seccomp.2 b/man2/seccomp.2
index 5cd28b7..a356f22 100644
--- a/man2/seccomp.2
+++ b/man2/seccomp.2
@@ -206,6 +206,17 @@ Synchronization will fail if another thread in the same process is in
 or if it has attached new seccomp filters to itself,
 diverging from the calling thread's filter tree.
 .RE
+.TP
+.BR SECCOMP_GET_ACTION_AVAIL " (since Linux 4.14)"
+.\" commit d612b1fd8010d0d67b5287fe146b8b55bcbb8655
+Test to see if an action is supported by the kernel. This operation is helpful to confirm that the kernel knows of a more recently added filter return action since the kernel treats all unknown actions as
+.BR SECCOMP_RET_KILL .
+.IP
+The value of
+.IR flags
+must be 0, and
+.IR args
+must be a pointer to an unsigned 32-bit filter return action.
 .SS Filters
 When adding filters via
 .BR SECCOMP_SET_MODE_FILTER ,
@@ -610,6 +621,13 @@ Note that for the purposes of calculating this limit,
 each already existing filter program incurs an
 overhead penalty of 4 instructions.
 .TP
+.BR EOPNOTSUPP
+.I operation
+specified
+.BR SECCOMP_GET_ACTION_AVAIL ,
+but the kernel does not support the filter return action specified by
+.IR args .
+.TP
 .BR ESRCH
 Another thread caused a failure during thread sync, but its ID could not
 be determined.
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
