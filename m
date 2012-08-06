From: Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/4] prctl.2: document PR_SET_PTRACER
Date: Sun,  5 Aug 2012 23:19:00 -0700
Message-ID: <1344233940-2680-4-git-send-email-shawnlandden@gmail.com>
References: <1344113204-4294-3-git-send-email-shawnlandden@gmail.com>
 <1344233940-2680-1-git-send-email-shawnlandden@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1344233940-2680-1-git-send-email-shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/prctl.2 |   29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/man2/prctl.2 b/man2/prctl.2
index 7f0ac46..f866f04 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -45,6 +45,7 @@
 .\"       SECCOMP_MODE_STRICT, SECCOMP_MODE_FILTER
 .\"       (thx Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org> 259e5e6c)
 .\"       PR_SET_TIMERSLACK, PR_GET_TIMESLACK, ARM alignment trap handler
+.\"       PR_SET_PTRACER
 .\"
 .TH PRCTL 2 2012-08-03 "Linux" "Linux Programmer's Manual"
 .SH NAME
@@ -321,6 +322,18 @@ This operation is only available if the kernel is configured with
 .BR CONFIG_SECCOMP
 enabled.
 .TP
+.BR PR_SET_PTRACER " (since Linux 3.3)"
+When using restricted ptrace, permit process of pid
+.I arg2
+to ptrace the current task. A value of 0 means "no process", and the special
+value
+.B PR_SET_PTRACER_ANY
+disables restricted ptrace for this process. Restricted ptrace is set via
+.IR /proc/sys/kernel/yama/ptrace_scope
+when the kernel has been configured with
+.B CONFIG_SECURITY_YAMA
+and the yama LSM is active.
+.TP
 .BR PR_SET_SECUREBITS " (since Linux 2.6.26)"
 Set the "securebits" flags of the calling thread to the value supplied in
 .IR arg2 .
@@ -699,6 +712,16 @@ is
 .B EINVAL
 .I option
 is
+.BR PR_SET_PTRACER
+and
+.I arg2
+is not 0,
+.BR PR_SET_PTRACER_ANY ,
+or the pid of an active process.
+.TP
+.B EINVAL
+.I option
+is
 .BR PR_SET_MM ,
 and one of the following is true
 .RS
@@ -742,6 +765,12 @@ and
 .I arg3
 is not a valid filter program.
 .TP
+.B ENOMEM
+.I option
+is
+.BR PR_SET_PTRACER
+and insufficient memory to set up ptrace relation with given pid.
+.TP
 .B EPERM
 .I option
 is
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
