From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [patch] perf_event_open.2: PERF_RECORD_MISC_PROC_MAP_PARSE_TIMEOUT
Date: Mon, 17 Oct 2016 10:50:40 -0400 (EDT)
Message-ID: <alpine.DEB.2.20.1610171048150.7683@macbook-air>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kan Liang <kan.liang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Arnaldo Carvalho de Melo <acme-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


Linux 4.2 reserved a new bit from the misc field in the perf_event_open
mmap sample buffer:
PERF_RECORD_MISC_PROC_MAP_PARSE_TIMEOUT

Despite being reserved in the public include/uapi/linux/perf_event.h
header file, this bit is never set by the kernel, rather it is used
internally by the userspace "perf" utility to indicate that when
attempting to parse all of the /proc/xxx/maps files for the sample
it ended up taking too long so the scan was aborted.

Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index fa8b1bd..59ad289 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -1822,6 +1822,14 @@ See also
 .BR PERF_RECORD_MISC_EXT_RESERVED " (since Linux 2.6.35)"
 .\" commit 1676b8a077c352085d52578fb4f29350b58b6e74
 This indicates there is extended data available (currently not used).
+.TP
+.B PERF_RECORD_MISC_PROC_MAP_PARSE_TIMEOUT
+.\" commit 930e6fcd2bcce9bcd9d4aa7e755678d33f3fe6f4
+This bit is not set by the kernel.
+It is reserved for the userspace perf utility to indicate that
+.I /proc/xxx/maps
+parsing was taking too long and stopped and thus the mmap
+records may be truncated.
 .RE
 .TP
 .I type
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
