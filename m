From: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] seccomp.2: Clarify SECCOMP_RET_KILL kills tasks not processes
Date: Thu, 6 Jul 2017 12:23:07 -0700
Message-ID: <20170706192307.GA38040@beast>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zach Reizner <zachr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jorge Lucangeli Obes <jorgelo-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Zach Reizner pointed out a mismatch between kernel behavior and the
man-page documentation of SECCOMP_RET_KILL which kills tasks not
processes.

Signed-off-by: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 man2/seccomp.2 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man2/seccomp.2 b/man2/seccomp.2
index 7d0e721..b805154 100644
--- a/man2/seccomp.2
+++ b/man2/seccomp.2
@@ -371,9 +371,9 @@ In decreasing order of precedence,
 the values that may be returned by a seccomp filter are:
 .TP
 .BR SECCOMP_RET_KILL
-This value results in the process exiting immediately
+This value results in the task exiting immediately
 without executing the system call.
-The process terminates as though killed by a
+The task terminates as though killed by a
 .B SIGSYS
 signal
 .RI ( not
@@ -769,7 +769,7 @@ install_filter(int syscall_nr, int t_arch, int f_errno)
                system calls */
         BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_ALLOW),
 
-        /* [7] Destination of architecture mismatch: kill process */
+        /* [7] Destination of architecture mismatch: kill task */
         BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_KILL),
     };
 
-- 
2.7.4


-- 
Kees Cook
Pixel Security
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
