From: Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 2/2] ptrace.2: Expand documentation PTRACE_EVENT_SECCOMP traps
Date: Wed, 16 Nov 2016 00:52:27 -0500
Message-ID: <20161116055227.GA26949@juliacomputing.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: linux-man@vger.kernel.org

In Linux 4.8 (through a series of commits, 93e35efb8de45393cf61ed07f7b407629bf698ea
being the actual reordering on x86), the order of PTRACE_EVENT_SECCOMP and
syscall-entry-stops was reversed. Document both behaviors and their
interaction with the various forms of restart.

Signed-off-by: Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
---
 man2/ptrace.2 | 79 +++++++++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 74 insertions(+), 5 deletions(-)

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index cb1b976..a821b7b 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -646,8 +646,8 @@ value such that
 
 While this triggers a
 .BR PTRACE_EVENT
-stop, it is similar to a syscall-enter-stop, in that the tracee has
-not yet entered the syscall that seccomp triggered on.
+stop, it is similar to a syscall-enter-stop. For details,
+see the note on PTRACE_EVENT_SECCOMP below.
 The seccomp event message data (from the
 .BR SECCOMP_RET_DATA
 portion of the seccomp filter rule) can be retrieved with
@@ -1133,6 +1133,7 @@ be further subdivided into
 .IR signal-delivery-stop ,
 .IR group-stop ,
 .IR syscall-stop ,
+.IR PTRACE_EVENT stops,
 and so on.
 These stopped states are described in detail below.
 .LP
@@ -1553,7 +1554,8 @@ has been set by the tracer.
 The seccomp event message data (from the
 .BR SECCOMP_RET_DATA
 portion of the seccomp filter rule) can be retrieved with
-.BR PTRACE_GETEVENTMSG .
+.BR PTRACE_GETEVENTMSG . The semantics of this stop are described in
+detail in a separate section below.
 .LP
 .B PTRACE_GETSIGINFO
 on
@@ -1599,7 +1601,7 @@ However, even if the tracee is was continued using
 , it is not guaranteed that the next stop will be a syscall-exit-stop.
 Other possibilities are that the tracee may stop in a
 .B PTRACE_EVENT
-stop, exit (if it entered
+stop (including seccomp stops), exit (if it entered
 .BR _exit (2)
 or
 .BR exit_group (2)),
@@ -1690,11 +1692,14 @@ indistinguishable from each other by the tracer.
 The tracer needs to keep track of the sequence of
 ptrace-stops in order to not misinterpret syscall-enter-stop as
 syscall-exit-stop or vice versa.
-The rule is that syscall-enter-stop is
+In general a syscall-enter-stop is
 always followed by syscall-exit-stop,
 .B PTRACE_EVENT
 stop or the tracee's death;
 no other kinds of ptrace-stop can occur in between.
+However, note that seccomp stops (see below) can cause syscall-exit-stops,
+without preceeding syscall-entry-stops. If seccomp is in use, care needs
+to be taken not to mis-interpret such stops as syscall-entry-stops.
 .LP
 If after syscall-enter-stop,
 the tracer uses a restarting command other than
@@ -1712,6 +1717,70 @@ set to
 .B SIGTRAP
 or
 .IR (SIGTRAP|0x80) .
+.SS PTRACE_EVENT_SECCOMP stops (Linux 3.5 - 4.7)
+The behavior of
+.BR PTRACE_EVENT_SECCOMP
+stops and their interaction with other kinds
+of ptrace stops has changed between kernel versions. This documents the behavior
+from their introduction until Linux 4.7 (inclusive). The behavior in later kernel
+versions is documented in the next section.
+
+A
+.BR PTRACE_EVENT_SECCOMP
+stop occurs whenever a
+.BR SECCOMP_RET_TRACE
+rule is triggered. This is independent of which methods was used to restart
+the system call. Notably, seccomp still runs even if the tracee
+was restarted using
+.BR PTRACE_SYSEMU
+and this system call is unconditionally skipped.
+
+Restarts from this stop will behave as if the stop had occurred right
+before the system call in question. In particular, both
+.BR PTRACE_SYSCALL
+and
+.BR PTRACE_SYSEMU
+will normally cause a subsequent syscall-entry-stop. However, if after the
+.BR PTRACE_EVENT_SECCOMP
+the system call number is negative, both the syscall-entry-stop
+and the system call itself will be skipped. This means that if the
+system call number is negative after a
+.BR PTRACE_EVENT_SECCOMP
+and the tracee is restarted using
+.BR PTRACE_SYSCALL,
+the next observed stop will be a syscall-exit-stop,
+rather than the syscall-entry-stop
+that may have been expected.
+
+.SS PTRACE_EVENT_SECCOMP stops (Linux 4.8+)
+
+In Linux 4.8, the
+.BR PTRACE_EVENT_SECCOMP
+stop was re-ordered to occur between syscall-entry-stop and
+syscall-exit-stop. Note that, seccomp no longer
+runs (and no `PTRACE_EVENT_SECCOMP` will be reported) if
+the system call is skipped
+due to
+.BR PTRACE_SYSEMU
+.
+
+Functionally, a PTRACE_EVENT_SECCOMP stop functions comparably
+to a syscall-entry-stop (i.e. continuations using
+.BR PTRACE_SYSCALL
+will cause syscall-exit-stops, the system call number may be changed
+and any other modified registers are visible to the to-be-executed syscall as well).
+Note that there may, but need not have been a preceeding syscall-entry-stop.
+
+After a
+.BR PTRACE_EVENT_SECCOMP
+stop, seccomp will be re-run, with a
+.BR SECCOMP_RET_TRACE
+rule now functioning the same as a
+.BR SECCOMP_RET_ALLOW
+. Specifically, this means that if registers are not modified during the
+.BR PTRACE_EVENT_SECCOMP
+stop, the system call will then be allowed.
+
 .SS PTRACE_SINGLESTEP stops
 [Details of these kinds of stops are yet to be documented.]
 .\"
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
