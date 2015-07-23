From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [patch 06/11] perf_event_open.2: 4.1 add AUX sample support
Date: Thu, 23 Jul 2015 13:13:03 -0400 (EDT)
Message-ID: <alpine.DEB.2.20.1507231312240.3742@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephane Eranian <eranian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Frederic Weisbecker <fweisbec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Kaixu Xia <kaixu.xia-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>, Robert Richter <rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, kan.liang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, markus.t.metzger-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
List-Id: linux-man@vger.kernel.org


This manpage patch relates to the addition of the AUX sample type
as added in the following commit:

	commit 68db7e98c3a6ebe7284b6cf14906ed7c55f3f7f0
	Author: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

	perf: Add AUX record

	Signed-off-by: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
	Signed-off-by: Peter Zijlstra (Intel) <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
	Cc: Arnaldo Carvalho de Melo <acme-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
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
	Cc: adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
	Cc: kan.liang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
	Cc: markus.t.metzger-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
	Cc: mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
	Link: http://lkml.kernel.org/r/1421237903-181015-7-git-send-email-alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
	Signed-off-by: Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>


Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
 
diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index bd6c4c9..dfb0b64 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -2445,6 +2445,39 @@ is the flags information.
 .I filename
 is a string describing the backing of the allocated memory.
 .RE
+.TP
+.BR PERF_RECORD_AUX " (since Linux 4.1)"
+\" commit 68db7e98c3a6ebe7284b6cf14906ed7c55f3f7f0
+This record reports that new data is available in the separate
+AUX buffer region.
+
+.in +4n
+.nf
+struct {
+    struct perf_event_header header;
+    u64 aux_offset;
+    u64 aux_size;
+    u64 flags;
+    struct sample_id sample_id;
+};
+.fi
+.RS
+.TP
+.I aux_offset
+offset in the AUX mmap region where the new data begins.
+.TP
+.I aux_size
+size of the data made available.
+.TP
+.I flags
+describes the aux update.
+.RS
+.TP
+.B PERF_AUX_FLAG_TRUNCATED
+if set then the data returned was truncated to fit the available
+buffer size.
+.RE
+.RE
 .RE
 .SS Overflow handling
 Events can be set to notify when a threshold is crossed,
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
