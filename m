From: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ptrace.2: if SEIZE was used, initial auto-attach stop is EVENT_STOP
Date: Tue,  2 Jul 2013 12:51:17 +0200
Message-ID: <1372762277-31981-1-git-send-email-dvlasenk@redhat.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jan Kratochvil <jan.kratochvil-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

For every PTRACE_O_TRACEfoo option, mention that old-style SIGSTOP
is replaced by PTRACE_EVENT_STOP if PTRACE_SEIZE attach was used.

Mention the same thing again in the description of PTRACE_EVENT_STOP.

Signed-off-by: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
CC: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
CC: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
CC: Jan Kratochvil <jan.kratochvil-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
CC: Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
---
 man2/ptrace.2 | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index 79d14cc..55c4fe2 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -340,7 +340,12 @@ Stop the tracee at the next
 .BR clone (2)
 and automatically start tracing the newly cloned process,
 which will start with a
-.BR SIGSTOP .
+.BR SIGSTOP ,
+or
+.B PTRACE_EVENT_STOP
+if
+.B PTRACE_SEIZE
+was used.
 A
 .BR waitpid (2)
 by the tracer will return a
@@ -421,7 +426,12 @@ Stop the tracee at the next
 .BR fork (2)
 and automatically start tracing the newly forked process,
 which will start with a
-.BR SIGSTOP .
+.BR SIGSTOP ,
+or
+.B PTRACE_EVENT_STOP
+if
+.B PTRACE_SEIZE
+was used.
 A
 .BR waitpid (2)
 by the tracer will return a
@@ -449,7 +459,12 @@ Stop the tracee at the next
 .BR vfork (2)
 and automatically start tracing the newly vforked process,
 which will start with a
-.BR SIGSTOP .
+.BR SIGSTOP ,
+or
+.B PTRACE_EVENT_STOP
+if
+.B PTRACE_SEIZE
+was used.
 A
 .BR waitpid (2)
 by the tracer will return a
@@ -1208,7 +1223,16 @@ to finish exiting.
 .B PTRACE_EVENT_STOP
 Stop induced by
 .B PTRACE_INTERRUPT
-command, or group-stop (only if attached using PTRACE_SEIZE).
+command, group-stop, or initial ptrace-stop when a new child is attached
+(only if attached using
+.BR PTRACE_SEIZE ).
+Note that unlike other
+.B PTRACE_EVENT
+stops, this stop has
+.I WSTOPSIG(status)
+other than
+.B SIGTRAP
+if it reports a group-stop.
 .LP
 .B PTRACE_GETSIGINFO
 on
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
