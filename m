From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [patch] perf_event_open.2: PERF_RECORD_LOST_SAMPLES record type
Date: Sat, 15 Oct 2016 22:02:51 -0400 (EDT)
Message-ID: <alpine.DEB.2.20.1610152201370.4137@macbook-air>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kan Liang <kan.liang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stephane Eranian <eranian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org


Linux 4.2 added a new record type: PERF_RECORD_LOST_SAMPLES
It is generated when hardware samples (currently only Intel PEBS)
are lost.

Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 9f33122..a47df2d 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -2551,6 +2551,25 @@ process ID of the thread starting an instruction trace.
 .I tid
 thread ID of the thread starting an instruction trace.
 .RE
+.TP
+.BR PERF_RECORD_LOST_SAMPLES " (since Linux 4.2)"
+\" f38b0dbb491a6987e198aa6b428db8692a6480f8
+When using hardware sampling (such as Intel PEBS) this record
+indicates some number of samples may have been lost.
+
+.in +4n
+.nf
+struct {
+    struct perf_event_header header;
+    u64 lost;
+    struct sample_id sample_id;
+};
+.fi
+.RS
+.TP
+.I lost
+the number of potentially lost samples.
+.RE
 .RE
 .SS Overflow handling
 Events can be set to notify when a threshold is crossed,
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
