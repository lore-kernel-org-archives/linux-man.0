From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [patch] perf_event_open.2 -- clarify EACCES and EPERM errors
Date: Tue, 15 Apr 2014 14:28:26 -0400 (EDT)
Message-ID: <alpine.DEB.2.10.1404151425470.15528@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Attempt to clarify the reasons for EACCES and EPERM errors.

Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index e513905..00842df 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -2385,11 +2385,14 @@ field is overwritten by the kernel to be the size of the structure
 it was expecting.
 .TP
 .B EACCES
-Returned when the requested event requires root permissions
-(or a more permissive perf_event paranoid setting).
-Some common cases where an unprivileged process 
-may encounter this error: are attaching to a process owned by a different user;
-monitoring all processes on a given CPU;
+Returned when the requested event requires
+.B CAP_SYS_ADMIN
+permissions (or a more permissive perf_event paranoid setting).
+Some common cases where an unprivileged process
+may encounter this error:
+attaching to a process owned by a different user;
+monitoring all processes (including those not belonging to the user)
+on a given CPU;
 and not setting
 .I exclude_kernel
 when the paranoid setting requires it.
@@ -2477,9 +2480,17 @@ branch tracing if it is not available, sampling if no PMU
 interrupt is available, and branch stacks for software events.
 .TP
 .B EPERM
-Returned if sufficient permissions not available to create the event.
-This includes attempting to set a breakpoint on a kernel address
-and setting a ftrace function trace tracepoint.
+Returned on many (but not all) architectures when an unsupported
+.IR exclude_hv ", " exclude_idle ", " exclude_user ", or " exclude_kernel
+setting is specified.
+
+It can also happen, as with
+.BR EACCES ,
+when the requested event requires
+.B CAP_SYS_ADMIN
+permissions (or a more permissive perf_event paranoid setting).
+This includes setting a breakpoint on a kernel address,
+and (since Linux 3.13) setting a kernel function-trace tracepoint.
 .TP
 .B ESRCH
 Returned if attempting to attach to a process that does not exist.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
