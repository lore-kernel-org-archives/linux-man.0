From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [patch 08/10] perf_event_open.2: 4.1 add aux_watermark
Date: Thu, 16 Apr 2015 14:18:25 -0400 (EDT)
Message-ID: <alpine.DEB.2.11.1504161417460.15181@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephane Eranian <eranian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Frederic Weisbecker <fweisbec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Kaixu Xia <kaixu.xia-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>, Robert Richter <rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, kan.liang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, markus.t.metzger-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-man@vger.kernel.org


This manpage patch relates to the addition of the aux_watermark attr
field in the following commit:

	commit 1a5941312414c71dece6717da9a0fa1303127afa
	Author: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

	perf: Add wakeup watermark control to the AUX area

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
	Link: http://lkml.kernel.org/r/1421237903-181015-10-git-send-email-alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
	Signed-off-by: Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 01ee579..fa6f6c5 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -256,6 +256,8 @@ struct perf_event_attr {
     __u32 sample_stack_user;    /* size of stack to dump on
                                    samples */
     __u32 __reserved_2;         /* Align to u64 */
+    __u32   aux_watermark;
+    __u32   __reserved_2;       /* align to u64 */
 
 };
 .fi
@@ -350,6 +352,11 @@ and
 .I sample_stack_user
 in Linux 3.7.
 .\" commit 1659d129ed014b715b0b2120e6fd929bdd33ed03
+.B PERF_ATTR_SIZE_VER5
+is 112 corresponding to the addition of
+.I aux_watermak
+.\" commit 1a5941312414c71dece6717da9a0fa1303127afa
+in Linux 4.1.
 .TP
 .I "config"
 This specifies which event you want, in conjunction with
@@ -1218,6 +1225,12 @@ described in the kernel header
 This defines the size of the user stack to dump if
 .B PERF_SAMPLE_STACK_USER
 is specified.
+.TP
+.IR "aux_watermark" " (since Linux 4.1)"
+.\" commit 1a5941312414c71dece6717da9a0fa1303127afa
+This specifies how much data is required to trigger a
+.B PERF_RECORD_AUX
+sample.
 .SS Reading results
 Once a
 .BR perf_event_open ()
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
