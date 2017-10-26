From: Tyler Hicks <tyhicks-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH 1/4] proc.5, seccomp.2: seccomp /proc interfaces
Date: Thu, 26 Oct 2017 04:11:39 +0000
Message-ID: <1508991102-13686-2-git-send-email-tyhicks@canonical.com>
References: <1508991102-13686-1-git-send-email-tyhicks@canonical.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508991102-13686-1-git-send-email-tyhicks-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Document the seccomp /proc interfaces added in Linux commits
v4.14-rc2~15^2~10 and v4.14-rc2~15^2~8.

Signed-off-by: Tyler Hicks <tyhicks-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
 man2/seccomp.2 | 36 ++++++++++++++++++++++++++++++++++++
 man5/proc.5    |  7 +++++++
 2 files changed, 43 insertions(+)

diff --git a/man2/seccomp.2 b/man2/seccomp.2
index a99c262..5cd28b7 100644
--- a/man2/seccomp.2
+++ b/man2/seccomp.2
@@ -490,6 +490,42 @@ ptracers can use this mechanism to escape from the seccomp sandbox.)
 .TP
 .BR SECCOMP_RET_ALLOW
 This value results in the system call being executed.
+.SS /proc interfaces
+The files in the directory
+.IR /proc/sys/kernel/seccomp
+provide additional seccomp information and configuration:
+.TP
+.IR actions_avail " (since Linux 4.14)"
+.\" commit 8e5f1ad116df6b0de65eac458d5e7c318d1c05af
+A read-only ordered list of seccomp filter return actions in string form. The
+ordering, from left-to-right, is in decreasing order of precedence. The list
+represents the set of seccomp filter return actions supported by the kernel.
+.TP
+.IR actions_logged " (since Linux 4.14)"
+.\" commit 0ddec0fc8900201c0897b87b762b7c420436662f
+A read-write ordered list of seccomp filter return actions that are allowed to
+be logged. Writes to the file do not need to be in ordered form but reads from
+the file will be ordered in the same way as the
+.IR actions_avail
+file.
+.IP
+It is important to note that the value of
+.IR actions_logged
+does not prevent certain filter return actions from being logged when the audit
+subsystem is configured to audit a task. If the action is not found in the
+.IR actions_logged
+file, the final decision on whether to audit the action for that task is
+ultimately left up to the audit subsystem to decide for all filter return
+actions other than
+.BR SECCOMP_RET_ALLOW .
+.IP
+The "allow" string is not accepted in the
+.IR actions_logged
+file as it is not possible to log
+.BR SECCOMP_RET_ALLOW
+actions. Attempting to write "allow" to the file will result in
+.BR EINVAL
+being returned.
 .SH RETURN VALUE
 On success,
 .BR seccomp ()
diff --git a/man5/proc.5 b/man5/proc.5
index eeba1cf..215b3d9 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -4720,6 +4720,13 @@ See
 See
 .BR sched (7).
 .TP
+.IR /proc/sys/kernel/seccomp " (since Linux 4.14)"
+.\" commit 8e5f1ad116df6b0de65eac458d5e7c318d1c05af
+This directory provides additional seccomp information and
+configuration. See
+.BR seccomp (2)
+for further details.
+.TP
 .IR /proc/sys/kernel/sem " (since Linux 2.4)"
 This file contains 4 numbers defining limits for System V IPC semaphores.
 These fields are, in order:
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
