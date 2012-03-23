From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/3] ptrace.2: more ffix and tfix
Date: Fri, 23 Mar 2012 11:31:51 -0400
Message-ID: <1332516711-8633-1-git-send-email-taffit@debian.org>
References: <1332472329-31499-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1332472329-31499-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The previous ones were spotted during the translations, while those were
spotted during its review.

Regards

David
---
 man2/ptrace.2 |   14 ++++++++------
 1 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index 457c6ac..62f4458 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -180,7 +180,8 @@ The word is returned as the result of the
 call.
 Typically, the offset must be word-aligned, though this might vary by
 architecture.
-See NOTES.
+See 
+.BR NOTES .
 .RI ( data
 is ignored.)
 .TP
@@ -264,7 +265,7 @@ itself.
 .RI ( addr
 is ignored.)
 .TP
-.BR PTRACE_SETOPTIONS " (since Linux 2.4.6; see BUGS for caveats)"
+.BR PTRACE_SETOPTIONS " (since Linux 2.4.6; see " BUGS " for caveats)"
 Set ptrace options from
 .IR data .
 .RI ( addr
@@ -718,7 +719,7 @@ Example:
 .\"     describe how wait notifications queue (or not queue)
 .LP
 The following kinds of ptrace-stops exist: signal-delivery-stops,
-group-stop,
+group-stops,
 .B PTRACE_EVENT
 stops, syscall-stops.
 They all are reported by
@@ -802,12 +803,12 @@ Note that a suppressed signal still causes system calls to return
 prematurely.
 In this case system calls will be restarted: the tracer will
 observe the tracee to reexecute the interrupted system call (or
-.BR restart_syscall(2)
+.BR restart_syscall (2)
 system call for a few syscalls which use a different mechanism
 for restarting) if the tracer uses
 .BR PTRACE_SYSCALL .
 Even system calls (such as
-.BR poll(2) )
+.BR poll (2))
 which are not restartable after signal are restarted after
 signal is suppressed;
 however, kernel bugs exist which cause some syscalls to fail with
@@ -1454,7 +1455,8 @@ The
 .B PTRACE_O_TRACEEXEC
 option is the recommended tool for dealing with this situation.
 First, it enables
-.BR PTRACE_EVENT_EXEC -stop,
+.B PTRACE_EVENT_EXEC
+stop,
 which occurs before
 .BR execve(2)
 returns.
-- 
1.7.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
