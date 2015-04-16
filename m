From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [patch 07/10] perf_event_open.2: 4.1 add AUX_FLAG_OVERWRITE
 support
Date: Thu, 16 Apr 2015 14:17:39 -0400 (EDT)
Message-ID: <alpine.DEB.2.11.1504161416470.15181@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephane Eranian <eranian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Frederic Weisbecker <fweisbec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Kaixu Xia <kaixu.xia-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>, Robert Richter <rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, kan.liang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, markus.t.metzger-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-man@vger.kernel.org


This manpage patch relates to the addition of the AUX sample flag
AUX_FLAG_OVERWRITE as added in the following commit:

	commit 2023a0d2829e521fe6ad6b9907f3f90bfbf57142
	Author: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

	perf: Support overwrite mode for the AUX area

	Signed-off-by: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
	Signed-off-by: Peter Zijlstra (Intel) <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
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
	Link: http://lkml.kernel.org/r/1421237903-181015-9-git-send-email-alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
	Signed-off-by: Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -1590,6 +1590,15 @@
 .I perf_event_mlock_kb
 allowance.
 
+By default the AUX buffer will be truncated if it will not fit
+in the available space in the ring buffer.
+If the AUX buffer is mapped as a read only buffer, then it will
+operate in ring buffer mode where old data will be overwritten
+by new.
+In overwrite mode it might not be possible to infer where the
+new data began, and it is the consumer's job to disable
+measurement while reading to avoid possible data races.
+
 The
 .IR aux_head " and " aux_tail
 ring buffer pointers have the same behavior and ordering
@@ -2372,6 +2381,10 @@
 .B PERF_AUX_FLAG_TRUNCATED
 if set then the data returned was truncated to fix the available
 buffer size.
+.TP
+.B PERF_AUX_FLAG_OVERWRITE
+.\" commit 2023a0d2829e521fe6ad6b9907f3f90bfbf57142
+if set then the data returned has overwritten previous data.
 .RE
 .RE
 .RE
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
