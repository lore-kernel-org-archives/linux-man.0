From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [patch] perf_event_open.2 cpu/pid argument cleanup
Date: Thu, 14 Nov 2013 17:08:52 -0500 (EST)
Message-ID: <alpine.DEB.2.10.1311141702550.10341@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


This patch attempts to clarify the pid and cpu options to
perf_event_open.

It does two things:
  1.  Tries to make clear that the "pid" argument can mean
	process *or* thread.  This is made confusing by
	how Linux uses the terms mostly interchangably.
  2.  The cpu/pid documentation was confusing because of
	how the parameters are interdependent.  Since there
	are only 6 possible combinations I broke out the
	possibilities into a table.

I'm open to comments, especially on how the pid/cpu stuff was broken
out, I'm not sure if I got the style right for that part.

Reported-by: Manuel Selva <selva.manuel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>



diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 1889689..7d84389 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -75,54 +75,36 @@ be accessed via
 .BR  mmap (2) .
 .SS Arguments
 .P
-The argument
-.I pid
-allows events to be attached to processes in various ways.
-If
-.I pid
-is 0, measurements happen on the current thread, if
-.I pid
-is greater than 0, the process indicated by
-.I pid
-is measured, and if
-.I pid
-is \-1, all processes are counted.
-
 The
-.I cpu
-argument allows measurements to be specific to a CPU.
-If
-.I cpu
-is greater than or equal to 0,
-measurements are restricted to the specified CPU;
-if
-.I cpu
-is \-1, the events are measured on all CPUs.
-.P
-Note that the combination of
-.IR pid " == \-1"
-and
-.IR cpu " == \-1"
-is not valid.
-.P
-A
-.IR pid " > 0"
-and
-.IR cpu " == \-1"
-setting measures per-process and follows that process to whatever CPU the
-process gets scheduled to.
-Per-process events can be created by any user.
-.P
-A
-.IR pid " == \-1"
+.I pid
 and
-.IR cpu " >= 0"
-setting is per-CPU and measures all processes on the specified CPU.
-Per-CPU events need the
+.I cpu
+arguments allow specifying which process and CPU to monitor:
+.TP
+.BR pid==0 " and " cpu==\-1
+This measures the current process/thread on any CPU.
+.TP
+.BR pid==0 " and " cpu>=0
+This measures the current process/thread only 
+when running on the specified CPU.
+.TP
+.BR pid>0 " and " cpu==\-1
+This measures the specified process/thread on any CPU.
+.TP
+.BR pid>0 " and " cpu>=0
+This measures the specified process/thread only
+when running on the specified CPU.
+.TP
+.BR pid==\-1 " and " cpu>=0
+This measures all processes/threads on the specified CPU.
+Measurements such as this require the
 .B CAP_SYS_ADMIN
 capability or a
 .I /proc/sys/kernel/perf_event_paranoid
 value of less than 1.
+.TP
+.BR pid==\-1 " and " cpu==\-1
+This setting is invalid and will return an error.
 .P
 The
 .I group_fd
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
