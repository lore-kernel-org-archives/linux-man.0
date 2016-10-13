From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [patch] perf_event_open.2: sample_max_stack support
Date: Thu, 13 Oct 2016 17:16:16 -0400 (EDT)
Message-ID: <alpine.DEB.2.20.1610131713000.21363@macbook-air>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Stephane Eranian <eranian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org


Linux 4.8 added a new sample_max_stack parameter, as well as
/proc/sys/kernel/perf_event_max_stack which limits it and a new
EOVERFLOW error return.

Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 3c894cc..edfdb72 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -268,7 +268,8 @@ struct perf_event_attr {
     __s32 clockid;              /* clock to use for time fields */
     __u64 sample_regs_intr;     /* regs to dump on samples */
     __u32 aux_watermark;        /* aux bytes before wakeup */
-    __u32 __reserved_2;         /* align to u64 */
+    __u16 sample_max_stack;     /* max frames in callchain */
+    __u16 __reserved_2;         /* align to u64 */
 
 };
 .fi
@@ -1307,6 +1308,15 @@ currently supported.
 This specifies how much data is required to trigger a
 .B PERF_RECORD_AUX
 sample.
+.TP
+.IR "sample_max_stack" " (since Linux 4.8)"
+.\" commit 97c79a38cd454602645f0470ffb444b3b75ce574
+When
+.I sample_type
+includes
+.B PERF_SAMPLE_CALLCHAIN
+this specifies how many stack frames to report when
+generating the callchain.
 .SS Reading results
 Once a
 .BR perf_event_open ()
@@ -2780,6 +2790,14 @@ users to sample at a rate that impacts overall machine performance
 and potentially lock up the machine.
 The default value is
 100000 (samples per second).
+
+.TP
+.I /proc/sys/kernel/perf_event_max_stack
+.\" Introduced in c5dfd78eb79851e278b7973031b9ca363da87a7e
+
+This sets the maximum depth of stack frame entries reported
+when generating a call trace.
+
 .TP
 .I /proc/sys/kernel/perf_event_mlock_kb
 
@@ -3001,6 +3019,15 @@ This includes requesting low-skid events if not supported,
 branch tracing if it is not available, sampling if no PMU
 interrupt is available, and branch stacks for software events.
 .TP
+.BR EOVERFLOW " (since Linux 4.8)"
+.\" 97c79a38cd454602645f0470ffb444b3b75ce574
+Returned if
+.B PERF_SAMPLE_CALLCHAIN
+is requested and
+.I sample_max_stack
+is larger than the maximum specified in
+.IR /proc/sys/kernel/perf_event_max_stack .
+.TP
 .B EPERM
 Returned on many (but not all) architectures when an unsupported
 .IR exclude_hv ", " exclude_idle ", " exclude_user ", or " exclude_kernel
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
