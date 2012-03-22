From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ptrace.2: ffix and tfix
Date: Thu, 22 Mar 2012 15:23:06 -0400
Message-ID: <1332444186-16345-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/ptrace.2 |   51 ++++++++++++++++++++++++++++++++-------------------
 1 files changed, 32 insertions(+), 19 deletions(-)

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index 5a8b648..457c6ac 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -277,7 +277,7 @@ which are specified by the following flags:
 .BR PTRACE_O_TRACESYSGOOD " (since Linux 2.4.6)"
 When delivering system call traps, set bit 7 in the signal number
 (i.e., deliver
-.IR "SIGTRAP|0x80" ).
+.BR "SIGTRAP\ |\ 0x80" ).
 This makes it easy for the tracer to distinguish
 normal traps from those caused by a system call.
 .RB ( PTRACE_O_TRACESYSGOOD
@@ -468,7 +468,7 @@ The
 .I data
 argument is treated as for
 .BR PTRACE_CONT .
-.RI (addr
+.RI ( addr
 is ignored.)
 .TP
 .BR PTRACE_SYSEMU ", " PTRACE_SYSEMU_SINGLESTEP " (since Linux 2.6.14)"
@@ -539,7 +539,9 @@ but will not necessarily have stopped
 by the completion of this call; use
 .BR waitpid (2)
 to wait for the tracee to stop.
-See the "Attaching and detaching" subsection for additional information.
+See the 
+.B Attaching and detaching
+subsection for additional information.
 .RI ( addr
 and
 .I data
@@ -716,7 +718,9 @@ Example:
 .\"     describe how wait notifications queue (or not queue)
 .LP
 The following kinds of ptrace-stops exist: signal-delivery-stops,
-group-stop, PTRACE_EVENT stops, syscall-stops.
+group-stop,
+.B PTRACE_EVENT
+stops, syscall-stops.
 They all are reported by
 .BR waitpid (2)
 with
@@ -730,7 +734,7 @@ and if there is ambiguity in that value, by querying
 .I WSTOPSIG(status)
 macro can't be used to perform this examination,
 because it returns the value
-(\fIstatus\>>8)\ \fB&\ 0xff\fP\fP.)
+(\fIstatus\>>8\fP)\ \fB&\ 0xff\fP.)
 .SS Signal-delivery-stop
 When a (possibly multithreaded) process receives any signal except
 .BR SIGKILL ,
@@ -761,7 +765,11 @@ true, with the signal returned by
 If the signal is
 .BR SIGTRAP ,
 this may be a different kind of ptrace-stop;
-see the "Syscall-stops" and "execve" sections below for details.
+see the
+.B Syscall-stops
+and
+.B execve(2) under ptrace
+sections below for details.
 If
 .I WSTOPSIG(status)
 returns a stopping signal, this may be a group-stop; see below.
@@ -837,7 +845,7 @@ The
 signal has a side effect of waking up (all threads of)
 a group-stopped process.
 This side effect happens before signal-delivery-stop.
-The tracer can't suppress this side-effect (it can
+The tracer can't suppress this side effect (it can
 only suppress signal injection, which only causes the
 .BR SIGCONT
 handler to not be executed in the tracee, if such a handler is installed).
@@ -997,7 +1005,7 @@ with the exit signal set to
 .TP
 .B PTRACE_EVENT_CLONE
 Stop before return from
-.BR clone (2)
+.BR clone (2).
 .TP
 .B PTRACE_EVENT_VFORK_DONE
 Stop before return from
@@ -1039,12 +1047,13 @@ to finish exiting.
 on
 .B PTRACE_EVENT
 stops returns
-.B SIGTRAP in
+.B SIGTRAP
+in
 .IR si_signo ,
 with
 .I si_code
 set to
-.IR "(event<<8)\ |\ SIGTRAP" .
+(\fIevent<<8\fP)\ \fB|\ SIGTRAP\fP.
 .SS Syscall-stops
 If the tracee was restarted by
 .BR PTRACE_SYSCALL ,
@@ -1086,7 +1095,7 @@ If the
 option was set by the tracer, then
 .I WSTOPSIG(status)
 will give the value
-.IR "(SIGTRAP\ |\ 0x80)" .
+.RB ( "SIGTRAP\ |\ 0x80" ).
 .LP
 Syscall-stops can be distinguished from signal-delivery-stop with
 .B SIGTRAP
@@ -1173,7 +1182,7 @@ with
 set to
 .B SIGTRAP
 or
-.IR (SIGTRAP|0x80) .
+.RB ( "SIGTRAP\ |\ 0x80" ).
 .SS PTRACE_SINGLESTEP, PTRACE_SYSEMU, PTRACE_SYSEMU_SINGLESTEP stops
 [Details of these kinds of stops are yet to be documented.]
 .\"
@@ -1243,7 +1252,7 @@ is
 .BR PTRACE_SINGLESTEP ,
 .BR PTRACE_SYSEMU ,
 or
-.BR PTRACE_SYSEMU_SINGLESTEP.
+.BR PTRACE_SYSEMU_SINGLESTEP .
 If the tracee is in signal-delivery-stop,
 .I sig
 is the signal to be injected (if it is nonzero).
@@ -1252,7 +1261,7 @@ Otherwise,
 may be ignored.
 (When restarting a tracee from a ptrace-stop other than signal-delivery-stop,
 recommended practice is to always pass 0 in
-.I sig .)
+.IR sig .)
 .SS Attaching and detaching
 A thread can be attached to the tracer using the call
 
@@ -1285,9 +1294,11 @@ may be lost.
 Since attaching sends
 .B SIGSTOP
 and the tracer usually suppresses it, this may cause a stray
-.I EINTR
+.B EINTR
 return from the currently executing system call in the tracee,
-as described in the "signal injection and suppression" section.
+as described in the
+.B Signal injection and suppression
+section.
 .LP
 The request
 
@@ -1479,10 +1490,10 @@ Example: two threads call
 at the same time:
 .LP
 .nf
-*** we get syscall-entry-stop in thread 1: **
+*** we get syscall-enter-stop in thread 1: **
 PID1 execve("/bin/foo", "foo" <unfinished ...>
 *** we issue PTRACE_SYSCALL for thread 1 **
-*** we get syscall-entry-stop in thread 2: **
+*** we get syscall-enter-stop in thread 2: **
 PID2 execve("/bin/bar", "bar" <unfinished ...>
 *** we issue PTRACE_SYSCALL for thread 2 **
 *** we get PTRACE_EVENT_EXEC for PID0, we issue PTRACE_SYSCALL **
@@ -1539,7 +1550,9 @@ several kinds of
 notifications when the child process is traced by some other process.
 .LP
 Many of these bugs have been fixed, but as of Linux 2.6.38 several still
-exist; see BUGS below.
+exist; see
+.B BUGS
+below.
 .LP
 As of Linux 2.6.38, the following is believed to work correctly:
 .IP * 3
-- 
1.7.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
