From: shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH] prctl.2: PR_{SET,GET}_CHILD_SUBREAPER
Date: Thu,  9 Aug 2012 12:09:01 -0700
Message-ID: <50240ad3.6ae4440a.5977.ffffc0ce@mx.google.com>
References: <1344233940-2680-4-git-send-email-shawnlandden@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1344233940-2680-4-git-send-email-shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

From: Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

---
 man2/prctl.2 |   26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/man2/prctl.2 b/man2/prctl.2
index f866f04..b1a005e 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -42,10 +42,12 @@
 .\" 2012-04-25 Michael Kerrisk, Document PR_TASK_PERF_EVENTS_DISABLE and
 .\"				PR_TASK_PERF_EVENTS_ENABLE
 .\" 2012-08-03 Shawn Landden, Document PR_SET_NO_NEW_PRIVS, PR_GET_NO_NEW_PRIVS,
-.\"       SECCOMP_MODE_STRICT, SECCOMP_MODE_FILTER
 .\"       (thx Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org> 259e5e6c)
+.\"       SECCOMP_MODE_STRICT, SECCOMP_MODE_FILTER,
 .\"       PR_SET_TIMERSLACK, PR_GET_TIMESLACK, ARM alignment trap handler
 .\"       PR_SET_PTRACER
+.\"       PR_SET_CHILD_SUBREAPER, PR_GET_CHILD_SUBREAPER
+.\"       (thx Lennart Poettering <lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org> ebec18a6)
 .\"
 .TH PRCTL 2 2012-08-03 "Linux" "Linux Programmer's Manual"
 .SH NAME
@@ -323,6 +325,7 @@ This operation is only available if the kernel is configured with
 enabled.
 .TP
 .BR PR_SET_PTRACER " (since Linux 3.3)"
+.\" see commit ebec18a6d3aa1e7d84aab16225e87fd25170ec2b
 When using restricted ptrace, permit process of pid
 .I arg2
 to ptrace the current task. A value of 0 means "no process", and the special
@@ -334,6 +337,27 @@ when the kernel has been configured with
 .B CONFIG_SECURITY_YAMA
 and the yama LSM is active.
 .TP
+.BR PR_SET_CHILD_SUBREAPER " (since Linux 3.3)"
+Sets a process, such as a service manager, such that orphan (double-forking)
+child processes re-parent to this process instead of
+.BR init (8).
+The service manager
+is able to receive
+.B SIGCHLD
+signals and is able to investigate the process until
+it calls
+.BR wait (2).
+All children of this process will inherit a flag if they should
+look for a child_subreaper process at exit. Set
+.I arg2
+to 1 or 0 to enable or disable, respectively.
+.TP
+.BR PR_GET_CHILD_SUBREAPER " (since Linux 3.3)"
+Returns whether calling process is a child subreaper (see
+.BR PR_SET_CHILD_SUBREAPER ),
+in the location pointed to by
+.IR "(int\ *) arg2" .
+.TP
 .BR PR_SET_SECUREBITS " (since Linux 2.6.26)"
 Set the "securebits" flags of the calling thread to the value supplied in
 .IR arg2 .
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
