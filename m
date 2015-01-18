From: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] ptrace.2, sigaction.2, seccomp.2: ptrace and siginfo details
Date: Sat, 17 Jan 2015 22:26:17 -0800
Message-ID: <20150118062617.GA10640@www.outflux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

While writing some additional seccomp tests, I realized PTRACE_EVENT_SECCOMP
wasn't documented yet. Fixed this, and added additional notes related to
ptrace events SIGTRAP details.

Signed-off-by: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 man2/ptrace.2    | 45 ++++++++++++++++++++++++++++++++++++++++++
 man2/seccomp.2   |  1 +
 man2/sigaction.2 | 59 ++++++++++++++++++++++++++++++++++++++++++++------------
 3 files changed, 93 insertions(+), 12 deletions(-)

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index bb29502..67e0b32 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -40,6 +40,8 @@
 .\"        PTRACE_SETSIGINFO, PTRACE_SYSEMU, PTRACE_SYSEMU_SINGLESTEP
 .\"    (Thanks to Blaisorblade, Daniel Jacobowitz and others who helped.)
 .\" 2011-09, major update by Denys Vlasenko <vda.linux-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
+.\" 2015-01, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
+.\"    Added PTRACE_O_TRACESECCOMP, PTRACE_EVENT_SECCOMP
 .\"
 .TH PTRACE 2 2014-08-19 "Linux" "Linux Programmer's Manual"
 .SH NAME
@@ -566,6 +568,30 @@ value such that
 
 The PID of the new process can (since Linux 2.6.18) be retrieved with
 .BR PTRACE_GETEVENTMSG .
+.TP
+.BR PTRACE_O_TRACESECCOMP " (since Linux 3.5)"
+Stop the tracee when a
+.BR seccomp (2)
+.BR SECCOMP_RET_TRACE
+rule is triggered. A
+.BR waitpid (2)
+by the tracer will return a
+.I status
+value such that
+
+.nf
+  status>>8 == (SIGTRAP | (PTRACE_EVENT_SECCOMP<<8))
+.fi
+
+While this triggers a
+.BR PTRACE_EVENT
+stop, it is similar to a syscall-enter-stop, in that the tracee has
+not yet entered the syscall that seccomp triggered on. The seccomp
+event message data (from the
+.BR SECCOMP_RET_DATA
+portion of the seccomp filter rule)
+can be retrieved with
+.BR PTRACE_GETEVENTMSG .
 .RE
 .TP
 .BR PTRACE_GETEVENTMSG " (since Linux 2.5.46)"
@@ -585,6 +611,13 @@ For
 and
 .BR PTRACE_EVENT_CLONE ,
 this is the PID of the new process.
+For
+.BR PTRACE_EVENT_SECCOMP ,
+this is the
+.BR seccomp (2)
+filter's
+.BR SECCOMP_RET_DATA
+associated with the triggered rule.
 .RI ( addr
 is ignored.)
 .TP
@@ -1310,6 +1343,17 @@ or
 if
 .B PTRACE_SEIZE
 was used.
+.TP
+.B PTRACE_EVENT_SECCOMP
+Stop triggered by a
+.BR seccomp (2)
+rule on tracee syscall entry when
+.BR PTRACE_O_TRACESECCOMP
+has been set by the tracer. The seccomp event message data (from the
+.BR SECCOMP_RET_DATA
+portion of the seccomp filter rule)
+can be retrieved with
+.BR PTRACE_GETEVENTMSG .
 .LP
 .B PTRACE_GETSIGINFO
 on
@@ -2082,6 +2126,7 @@ attach.)
 .BR execve (2),
 .BR fork (2),
 .BR gettid (2),
+.BR seccomp (2),
 .BR sigaction (2),
 .BR tgkill (2),
 .BR vfork (2),
diff --git a/man2/seccomp.2 b/man2/seccomp.2
index ac72eb6..702ceb8 100644
--- a/man2/seccomp.2
+++ b/man2/seccomp.2
@@ -662,6 +662,7 @@ main(int argc, char **argv)
 .SH SEE ALSO
 .BR prctl (2),
 .BR ptrace (2),
+.BR sigaction (2),
 .BR signal (7),
 .BR socket (7)
 .sp
diff --git a/man2/sigaction.2 b/man2/sigaction.2
index aae572b..f06fe57 100644
--- a/man2/sigaction.2
+++ b/man2/sigaction.2
@@ -43,6 +43,8 @@
 .\"	out of this page into separate pages.
 .\" 2010-06-11 Andi Kleen, add hwpoison signal extensions
 .\" 2010-06-11 mtk, improvements to discussion of various siginfo_t fields.
+.\" 2015-01-17, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
+.\"	Added notes on ptrace SIGTRAP and SYS_SECCOMP.
 .\"
 .TH SIGACTION 2 2014-12-31 "Linux" "Linux Programmer's Manual"
 .SH NAME
@@ -416,10 +418,6 @@ and
 fill in
 .I si_addr
 with the address of the fault.
-.\" FIXME . SIGTRAP also sets the following for ptrace_notify() ?
-.\"     info.si_code = exit_code;
-.\"     info.si_pid = task_pid_vnr(current);
-.\"     info.si_uid = current_uid();  /* Real UID */
 On some architectures,
 these signals also fill in the
 .I si_trapno
@@ -438,6 +436,20 @@ For example, if a full page was corrupted,
 .I si_addr_lsb
 contains
 .IR log2(sysconf(_SC_PAGESIZE)) .
+When
+.BR SIGTRAP
+is delivered in response to a
+.BR ptrace (2)
+event (PTRACE_EVENT_foo),
+.I si_addr
+is not populated, but
+.I si_pid
+and
+.I si_uid
+are populated with the respective process ID and user ID responsible for
+delivering the trap. In the case of
+.BR seccomp (2)
+the tracee will be shown as delivering the event.
 .B BUS_MCERR_*
 and
 .I si_addr_lsb
@@ -457,9 +469,8 @@ The
 .I si_fd
 field indicates the file descriptor for which the I/O event occurred.
 .IP *
-The
 .B SIGSYS
-signal that is (since Linux 3.5)
+(since Linux 3.5)
 .\" commit a0727e8ce513fe6890416da960181ceb10fbfae6
 generated when a seccomp filter returns
 .B SECCOMP_RET_TRAP
@@ -467,13 +478,26 @@ fills in
 .IR si_call_addr ,
 .IR si_syscall ,
 .IR si_arch ,
-and various other fields as described in
+.IR si_errno ,
+and other fields as described in
 .BR seccomp (2).
 .PP
 .I si_code
 is a value (not a bit mask)
-indicating why this signal was sent.
-The following list shows the values which can be placed in
+indicating why this signal was sent. For a
+.BR ptrace (2)
+event,
+.I si_code
+will contain
+.BR SIGTRAP
+and have the ptrace event in the high byte:
+
+.nf
+    (SIGTRAP | PTRACE_EVENT_foo << 8).
+.fi
+
+For a regular signal, the following list shows the values which can be
+placed in
 .I si_code
 for any signal, along with reason that the signal was generated.
 .RS 4
@@ -514,9 +538,6 @@ or
 .\" SI_DETHREAD is defined in 2.6.9 sources, but isn't implemented
 .\" It appears to have been an idea that was tried during 2.5.6
 .\" through to 2.5.24 and then was backed out.
-.\"
-.\" FIXME .
-.\" Eventually need to add the SYS_SECCOMP code here (see seccomp(2))
 .RE
 .PP
 The following values can be placed in
@@ -691,6 +712,19 @@ high priority input available
 .B POLL_HUP
 device disconnected
 .RE
+.PP
+The following value can be placed in
+.I si_code
+for a
+.BR SIGSYS
+signal:
+.RS 4
+.TP 15
+.BR SYS_SECCOMP " (since Linux 3.5)"
+triggered by a
+.BR seccomp (2)
+filter rule
+.RE
 .SH RETURN VALUE
 .BR sigaction ()
 returns 0 on success; on error, \-1 is returned, and
@@ -830,6 +864,7 @@ See
 .BR killpg (2),
 .BR pause (2),
 .BR restart_syscall (2),
+.BR seccomp (2)
 .BR sigaltstack (2),
 .BR signal (2),
 .BR signalfd (2),
-- 
1.9.1


-- 
Kees Cook
Chrome OS Security
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
