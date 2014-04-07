From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [patch] perf_event_open.2 -- expand ERRORS section
Date: Mon, 7 Apr 2014 00:56:21 -0400 (EDT)
Message-ID: <alpine.DEB.2.10.1404070052310.16856@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Expand the perf_event_open.2 ERRORS section to be more comprehensive.

These were determined both by code inspection and by writing a large
number of test programs.

Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 42146a9..cd7f60d 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -2362,6 +2362,10 @@ returns the new file descriptor, or \-1 if an error occurred
 .I errno
 is set appropriately).
 .SH ERRORS
+The errors returned by
+.BR perf_event_open ()
+can be inconsistent, and may
+vary across processor architectures and performance monitoring units.
 .TP
 .B E2BIG
 Returned if the perf_event_attr
@@ -2378,8 +2382,68 @@ is returned, the perf_event_attr
 field is overwritten by the kernel to be the size of the structure
 it was expecting.
 .TP
+.B EACCES
+Returned when the requested event requires root permissions
+(or a more permissive perf_event paranoid setting).
+Some common causes are attaching to a process owned by a different user,
+monitoring all processes on a given cpu,
+or not setting exclude_kernel and the paranoid setting requires it.
+.TP
+.B EBADF
+Returned if the
+.I group_fd
+file descriptor is not valid, or, if PERF_FLAG_PID_CGROUP is set,
+the cgroup file descriptor in
+.I pid
+is not valid.
+.TP
+.B EFAULT
+Returned if the
+.I attr
+pointer points at an invalid memory address.
+.TP
 .B EINVAL
-Returned if the specified event is not available.
+Returned if the specified event is invalid.
+There are many possible reasons for this.
+A not-exhaustive list:
+.I sample_freq
+higher than the maximum setting,
+the
+.I cpu
+to monitor does not exist,
+.I read_format
+is out of range,
+.I sample_type
+is out of range,
+the
+.I flags
+value is out of range,
+.I exclusive
+or
+.I pinned
+set and the event is not a group leader,
+the event
+.I config
+values are out of range or set reserved bits,
+the generic event selected is not supported, or
+there is not enough room to add the selected event.
+.TP
+.B EMFILE
+Each opened event uses one file descriptor.
+If a large number of events are opened the per-user file
+descriptor limit (often 1024) will be hit and no more
+events can be created.
+.TP
+.B ENODEV
+Returned when the event involves a feature not supported
+by the current cpu.
+.TP
+.B ENOENT
+Returned if the
+.I type
+setting is not valid.
+Also returned for
+some unsupported generic events.
 .TP
 .B ENOSPC
 Prior to Linux 3.3, if there was not enough room for the event,
@@ -2388,8 +2452,30 @@ was returned.
 Linus did not like this, and this was changed to
 .BR EINVAL .
 .B ENOSPC
-is still returned if you try to read results into
-too small of a buffer.
+is still returned if you try to add more breakpoint events
+than supported by hardware.
+.TP
+.B ENOSYS
+Returned if
+.B PERF_SAMPLE_STACK_USER
+is set in
+.I sample_type
+and it is not supported by hardware.
+.TP
+.B EOPNOTSUPP
+Returned if an event requiring a specific hardware feature is
+requested but there is no hardware support.
+This includes requesting low-skid events if not supported,
+branch tracing if it is not available, sampling if no PMU
+interrupt is available, and branch stacks for software events.
+.TP
+.B EPERM
+Returned if sufficient permissions not available to create the event.
+This includes attempting to set a breakpoint on a kernel address
+and setting a ftrace function trace tracepoint.
+.TP
+.B ESRCH
+Returned if attempting to attach to a process that does not exist.
 .SH VERSION
 .BR perf_event_open ()
 was introduced in Linux 2.6.31 but was called
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
