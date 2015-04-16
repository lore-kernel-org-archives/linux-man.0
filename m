From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [patch 05/10] perf_event_open.2: aux_{head,tail,offset,size}
 support
Date: Thu, 16 Apr 2015 14:15:52 -0400 (EDT)
Message-ID: <alpine.DEB.2.11.1504161414590.15181@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephane Eranian <eranian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Frederic Weisbecker <fweisbec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Kaixu Xia <kaixu.xia-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>, Robert Richter <rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, kan.liang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, markus.t.metzger-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-man@vger.kernel.org


This manpage patch relates to the addition of the AUX mmap region
as added in the following commit:

	commit 45bfb2e50471abbbfd83d40d28c986078b0d24ff
	Author: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>

	perf: Add AUX area to ring buffer for raw data streams

	Signed-off-by: Peter Zijlstra (Intel) <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
	Acked-by: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
	Cc: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
	Cc: Frederic Weisbecker <fweisbec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
	Cc: H. Peter Anvin <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
	Cc: Kaixu Xia <kaixu.xia-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
	Cc: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
	Cc: Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>
	Cc: Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
	Cc: Robert Richter <rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
	Cc: Stephane Eranian <eranian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
	Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
	Cc: acme-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
	Cc: adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
	Cc: kan.liang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
	Cc: markus.t.metzger-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
	Cc: mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
	Link: http://lkml.kernel.org/r/1421237903-181015-3-git-send-email-alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
	Signed-off-by: Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>


Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
 
diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 01ee579..28348f9 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -1348,6 +1348,10 @@ struct perf_event_mmap_page {
     __u64 __reserved[120];   /* Pad to 1k */
     __u64 data_head;         /* head in the data section */
     __u64 data_tail;         /* user-space written tail */
+    __u64   aux_head;
+    __u64   aux_tail;
+    __u64   aux_offset;
+    __u64   aux_size;
 }
 .fi
 .in
@@ -1564,6 +1568,33 @@ the
 .I data_tail
 value should be written by user space to reflect the last read data.
 In this case, the kernel will not overwrite unread data.
+.TP
+.IR aux_head ", " aux_tail ", " aux_offset ", " aux_size " (since Linux 4.1)
+.\" commit 45bfb2e50471abbbfd83d40d28c986078b0d24ff
+The AUX region allows mmaping a separate sample buffer for high
+bandwidth data streams (separate from the main perf sample buffer).
+An example of a high bandwidth stream is instruction tracing support,
+as is found in newer Intel processors.
+
+To set up an AUX area, first
+.I aux_offset
+needs to be set with an offset greater than
+.IR data_offset + data_size
+and
+.I aux_size
+needs to be set to the desired buffer size.
+The desired offset and size must be page aligned.
+These values are then passed to mmap in order to map the AUX buffer.
+Pages in the AUX buffer are included as part of the user mlock
+rlimit as well as the
+.I perf_event_mlock_kb
+allowance.
+
+The
+.IR aux_head " and " aux_tail
+ring buffer pointers have the same behavior and ordering
+rules as the previous described
+.IR data_head " and " data_tail .
 .PP
 The following 2^n ring-buffer pages have the layout described below.
 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
