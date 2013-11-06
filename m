From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [PATCH 2/4] perf_event_open.2 Linux 3.12 PERF_SAMPLE_IDENTIFIER
Date: Wed, 6 Nov 2013 13:30:41 -0500 (EST)
Message-ID: <alpine.DEB.2.10.1311061329120.26649@vincent-weaver-1.um.maine.edu>
References: <alpine.DEB.2.10.1311061324070.26649@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.10.1311061324070.26649-6xBS8L8d439fDsnSvq7Uq4Se7xf15W0s1dQoKJhdanU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


A new PERF_SAMPLE_IDENTIFIER sample type was added in Linux 3.12

Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 4ff9690..a443b6e 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -680,6 +687,27 @@ Records the data source: where in the memory hierarchy
 the data associated with the sampled instruction came from.
 This is only available if the underlying hardware
 supports this feature.
+.TP
+.BR PERF_SAMPLE_IDENTIFIER " (Since Linux 3.12)"
+Places the SAMPLE_ID value in a fixed position in the record,
+either at the beginning (for sample events) or at the end
+(if a non-sample event).
+
+This was necessary because a sample stream may have
+records from various different event sources with different
+.I sample_type
+settings.
+Parsing the event stream properly was not possible because the 
+format of the record was needed to find SAMPLE_ID, but
+the the format could not be found without knowing what
+event the sample belonged to (causing a circular
+dependency).
+
+This new
+.B PERF_SAMPLE_IDENTIFIER
+setting makes the event stream always parsable
+by putting SAMPLE_ID in a fixed location, even though
+it means having duplicate SAMPLE_ID values in records.
 .RE
 .TP
 .IR "read_format"
@@ -860,12 +888,33 @@ field, but enables including data mmap events
 in the ring-buffer.
 .TP
 .IR "sample_id_all" " (Since Linux 2.6.38)"
-If set, then TID, TIME, ID, CPU, and STREAM_ID can
+If set, then TID, TIME, ID, STREAM_ID, and CPU can
 additionally be included in
 .RB non- PERF_RECORD_SAMPLE s
 if the corresponding
 .I sample_type
 is selected.
+
+If 
+.B PERF_SAMPLE_IDENTIFIER
+is specified than an additional ID value is included 
+as the last value to ease parsing the record stream.
+This may lead to the
+.I id 
+value appearing twice.
+
+The layout is described by this pseudo-structure:
+.in +4n
+.nf
+struct sample_id {
+    { u32 pid, tid; } /* if PERF_SAMPLE_TID set        */
+    { u64 time;     } /* if PERF_SAMPLE_TIME set       */
+    { u64 id;       } /* if PERF_SAMPLE_ID set         */
+    { u64 stream_id;} /* if PERF_SAMPLE_STREAM_ID set  */
+    { u32 cpu, res; } /* if PERF_SAMPLE_CPU set        */
+    { u64 id;       } /* if PERF_SAMPLE_IDENTIFIER set */
+};
+.fi
 .TP
 .IR "exclude_host" " (Since Linux 3.2)"
 Do not measure time spent in VM host.
@@ -1385,6 +1510,7 @@ The values in the corresponding record (that follows the header)
 depend on the
 .I type
 selected as shown.
+
 .RS
 .TP 4
 .B PERF_RECORD_MMAP
@@ -1416,6 +1542,7 @@ struct {
     struct perf_event_header header;
     u64 id;
     u64 lost;
+    struct sample_id sample_id;
 };
 .fi
 .in
@@ -1437,6 +1564,7 @@ struct {
     struct perf_event_header header;
     u32 pid, tid;
     char comm[];
+    struct sample_id sample_id;
 };
 .fi
 .in
@@ -1451,6 +1579,7 @@ struct {
     u32 pid, ppid;
     u32 tid, ptid;
     u64 time;
+    struct sample_id sample_id;
 };
 .fi
 .in
@@ -1465,6 +1594,7 @@ struct {
     u64 time;
     u64 id;
     u64 stream_id;
+    struct sample_id sample_id;
 };
 .fi
 .in
@@ -1479,6 +1609,7 @@ struct {
     u32 pid, ppid;
     u32 tid, ptid;
     u64 time;
+    struct sample_id sample_id;
 };
 .fi
 .in
@@ -1492,6 +1623,7 @@ struct {
     struct perf_event_header header;
     u32 pid, tid;
     struct read_format values;
+    struct sample_id sample_id;
 };
 .fi
 .in
@@ -1503,6 +1635,7 @@ This record indicates a sample.
 .nf
 struct {
     struct perf_event_header header;
+    u64   sample_id;  /* if PERF_SAMPLE_IDENTIFIER */
     u64   ip;         /* if PERF_SAMPLE_IP */
     u32   pid, tid;   /* if PERF_SAMPLE_TID */
     u64   time;       /* if PERF_SAMPLE_TIME */
@@ -1531,6 +1664,16 @@ struct {
 .fi
 .RS 4
 .TP 4
+.I sample_id
+If
+.B PERF_SAMPLE_IDENTIFIER
+is enabled, a 64-bit unique ID is included.
+This is a duplication of the 
+.B PERF_SAMPLE_ID
+.I id
+value, but included at the beginning of the sample
+so parsers can easily obtain the value.
+.TP
 .I ip
 If
 .B PERF_SAMPLE_IP
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
