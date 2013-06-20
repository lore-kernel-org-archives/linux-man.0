From: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ptrace.2: Clarify PTRACE_INTERRUPT, PTRACE_LISTEN and group-stop behavior
Date: Thu, 20 Jun 2013 13:11:44 +0200
Message-ID: <1371726704-23409-1-git-send-email-dvlasenk@redhat.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: root <root-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>, Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jan Kratochvil <jan.kratochvil-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

From: root <root-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>

For easier review, here are the changes as plain text:


PTRACE_INTERRUPT (since Linux 3.4)
Stop a tracee.
[*MODIFIED TEXT->**] If the tracee is running in kernel space
and PTRACE_SYSCALL is in effect, it will stop with syscall-exit-stop.
If the tracee was already stopped by a signal and PTRACE_LISTEN was sent
to it, it will stop with PTRACE_EVENT_STOP with WSTOPSIG(status) ==
stop_sig. If any other ptrace-stop is generated at the same time
(for example, if a signal is sent to the tracee), this ptrace-stop
happens.  If none of the above applies (for example, if the tracee
is running in userspace), it will stop with PTRACE_EVENT_STOP with
WSTOPSIG(status) == SIGTRAP.


Stopped states
A tracee can be in two states: running or stopped.
[**ADDED TEXT->**] For the purposes of ptrace, tracee which is blocked in a syscall
(such as read(2), pause(2) etc) is nevertheless considered to be running,
even if tracee is blocked for a long time.  The state of the tracee after
PTRACE_LISTEN is somewhat of a gray area: it is not in any ptrace-stop
(ptrace commands won't work on it, and it will deliver waitpid
notifications), but it also may be considered "stopped" because it is
not executing instructions (is not scheduled), and if it was in
group-stop before PTRACE_LISTEN, it will not respond to signals until
SIGCONT is received.


Group-stop
...
[**NEW PARAGRAPH ADDED->**]
If tracee was attached using PTRACE_SEIZE, group-stop is indicated
by PTRACE_EVENT_STOP: status>>16 == PTRACE_EVENT_STOP. This allows detection
of group-stops without extra PTRACE_GETSIGINFO call.


PTRACE_EVENT_STOP
Stop induced by PTRACE_INTERRUPT command [**ADDED TEXT->**], or group-stop (only
if attached using PTRACE_SEIZE).


Signed-off-by: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
CC: Jan Kratochvil <jan.kratochvil-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
CC: Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
CC: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
CC: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
CC: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

---
 man2/ptrace.2 | 46 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 37 insertions(+), 9 deletions(-)

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index 0d77e3f..472ae72 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -598,14 +598,18 @@ directly has no such limitation.
 .TP
 .BR PTRACE_INTERRUPT " (since Linux 3.4)"
 Stop a tracee.
-If the tracee is running, it will stop with
-.BR PTRACE_EVENT_STOP .
-If the tracee is already stopped by a signal, or receives a signal
-in parallel with
-.BR PTRACE_INTERRUPT ,
-it may report a group-stop
-or a signal-delivery-stop instead of
-.BR PTRACE_EVENT_STOP .
+If the tracee is running in kernel space and PTRACE_SYSCALL is in effect,
+it will stop with syscall-exit-stop.
+If the tracee was already stopped by a signal and PTRACE_LISTEN was sent to it,
+it will stop with
+.B PTRACE_EVENT_STOP
+with WSTOPSIG(status) == stop_sig.
+If any other ptrace-stop is generated at the same time (for example,
+if a signal is sent to the tracee), this ptrace-stop happens.
+If none of the above applies (for example, if the tracee is running in userspace),
+it will stop with
+.B PTRACE_EVENT_STOP
+with WSTOPSIG(status) == SIGTRAP.
 .B PTRACE_INTERRUPT
 only works on tracees attached by
 .BR PTRACE_SEIZE .
@@ -760,6 +764,22 @@ and any subsequent ptrace stops will be reported under
 the thread group leader's PID.
 .SS Stopped states
 A tracee can be in two states: running or stopped.
+For the purposes of ptrace, tracee which is blocked in a syscall
+(such as
+.BR read (2),
+.BR pause (2)
+etc)
+is nevertheless considered to be running, even if tracee is blocked
+for a long time.
+The state of the tracee after
+.BR PTRACE_LISTEN
+is somewhat of a gray area: it is not in any ptrace-stop (ptrace commands
+won't work on it, and it will deliver waitpid notifications),
+but it also may be considered "stopped" because
+it is not executing instructions (is not scheduled), and if it was
+in group-stop before
+.BR PTRACE_LISTEN ,
+it will not respond to signals until SIGCONT is received.
 .LP
 There are many kinds of states when the tracee is stopped, and in ptrace
 discussions they are often conflated.
@@ -1045,6 +1065,14 @@ then it is definitely a group-stop.
 .B SIGKILL
 killed the tracee.)
 .LP
+If tracee was attached using PTRACE_SEIZE, group-stop
+is indicated by
+.BR PTRACE_EVENT_STOP :
+status>>16 == PTRACE_EVENT_STOP. This allows detection of group-stops
+without extra
+.B PTRACE_GETSIGINFO
+call.
+.LP
 As of Linux 2.6.38,
 after the tracer sees the tracee ptrace-stop and until it
 restarts or kills it, the tracee will not run,
@@ -1170,7 +1198,7 @@ to finish exiting.
 .B PTRACE_EVENT_STOP
 Stop induced by
 .B PTRACE_INTERRUPT
-command.
+command, or group-stop (only if attached using PTRACE_SEIZE).
 .LP
 .B PTRACE_GETSIGINFO
 on
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
