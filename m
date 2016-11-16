From: Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 1/2] ptrace.2: Document the behavior of PTRACE_SYSEMU stops
Date: Wed, 16 Nov 2016 00:51:59 -0500
Message-ID: <20161116055159.GA26922@juliacomputing.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
---
 man2/ptrace.2 | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index 3a5ee65..cb1b976 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -737,7 +737,7 @@ is ignored.)
 For
 .BR PTRACE_SYSEMU ,
 continue and stop on entry to the next system call,
-which will not be executed.
+which will not be executed. See the documentation on syscall-stops below.
 For
 .BR PTRACE_SYSEMU_SINGLESTEP ,
 do the same but also singlestep if not a system call.
@@ -1568,18 +1568,35 @@ set to
 .IR "(event<<8)\ |\ SIGTRAP" .
 .SS Syscall-stops
 If the tracee was restarted by
-.BR PTRACE_SYSCALL ,
+.BR PTRACE_SYSCALL
+or
+.BR PTRACE_SYSEMU ,
 the tracee enters
-syscall-enter-stop just prior to entering any system call.
-If the tracer restarts the tracee with
+syscall-enter-stop just prior to entering any system call (which
+will not be executed if the restart was using
+.BR PTRACE_SYSEMU,
+regardless of any change made to registers at this point or how the
+tracee is restarted after this stop).
+No matter which method caused the syscall-entry-stop,
+if the tracer restarts the tracee with
 .BR PTRACE_SYSCALL ,
 the tracee enters syscall-exit-stop when the system call is finished,
 or if it is interrupted by a signal.
 (That is, signal-delivery-stop never happens between syscall-enter-stop
 and syscall-exit-stop; it happens
 .I after
-syscall-exit-stop.)
-.LP
+syscall-exit-stop.). If the tracee is continued using any other method
+(
+including
+.BR PTRACE_SYSEMU
+), no syscall-exit-stop occurs. Note that all mentions
+.BR PTRACE_SYSEMU
+apply equally to
+.BR PTRACE_SYSEMU_SINGLESTEP.
+.LP
+However, even if the tracee is was continued using
+.BR PTRACE_SYSCALL
+, it is not guaranteed that the next stop will be a syscall-exit-stop.
 Other possibilities are that the tracee may stop in a
 .B PTRACE_EVENT
 stop, exit (if it entered
@@ -1695,12 +1712,11 @@ set to
 .B SIGTRAP
 or
 .IR (SIGTRAP|0x80) .
-.SS PTRACE_SINGLESTEP, PTRACE_SYSEMU, PTRACE_SYSEMU_SINGLESTEP stops
+.SS PTRACE_SINGLESTEP stops
 [Details of these kinds of stops are yet to be documented.]
 .\"
 .\" FIXME .
-.\" document stops occurring with PTRACE_SINGLESTEP, PTRACE_SYSEMU,
-.\" PTRACE_SYSEMU_SINGLESTEP
+.\" document stops occurring with PTRACE_SINGLESTEP
 .SS Informational and restarting ptrace commands
 Most ptrace commands (all except
 .BR PTRACE_ATTACH ,
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
