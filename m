From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [patch] perf_event_open() updates for Linux 3.12
Date: Fri, 20 Sep 2013 14:15:36 -0400 (EDT)
Message-ID: <alpine.DEB.2.10.1309201412380.26813@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Below are the changes to perf_event_open.2 for the upcoming
Linux 3.12 release.

I'm not sure if sending these at 3.12-rc1 time is too early.

There are some pretty big changes this time, including an
unfortunate ABI breakage with the cap_usr_rdpmc/cap_usr_time
bits.

Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 71a09d5..7b87c4c 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -468,6 +468,13 @@ This counts the number of emulation faults.
 The kernel sometimes traps on unimplemented instructions
 and emulates them for user space.
 This can negatively impact performance.
+.TP
+.BR PERF_COUNT_SW_DUMMY " (Since Linux 3.12)"
+This is a placeholder event that counts nothing.
+Informational sample record types such as mmap or comm
+must be associated with an active event.
+This dummy event allows gathering such records without requiring
+a counting event.
 .RE
 
 .RS
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
@@ -879,6 +928,11 @@ Do not include kernel callchains.
 .IR "exclude_callchain_user" " (Since Linux 3.7)"
 Do not include user callchains.
 .TP
+.IR "mmap2" " (Since Linux 3.12)"
+Include an extended mmap record that contains enough
+additional information to uniquely identify
+shared mappings.
+.TP
 .IR "wakeup_events" ", " "wakeup_watermark"
 This union sets how many samples
 .RI ( wakeup_events )
@@ -1142,8 +1196,13 @@ struct perf_event_mmap_page {
     __u64 time_running;     /* time event on CPU */
     union {
         __u64   capabilities;
-        __u64   cap_usr_time  : 1,
-                cap_usr_rdpmc : 1,
+        struct {
+            __u64   cap_usr_time / cap_usr_rdpmc / cap_bit0 : 1,
+                    cap_bit0_is_deprecated : 1,
+                    cap_user_rdpmc         : 1,
+                    cap_user_time          : 1,
+                    cap_user_time_zero     : 1,
+        };
     };
     __u16   pmc_width;
     __u16   time_shift;
@@ -1173,8 +1232,9 @@ A seqlock for synchronization.
 A unique hardware counter identifier.
 .TP
 .I offset
-.\" FIXME clarify
-Add this to hardware counter value??
+When using rdpmc for reads this offset value
+must be added to the one returned by rdpmc to get
+the current total event count.
 .TP
 .I time_enabled
 Time the event was active.
@@ -1182,10 +1242,45 @@ Time the event was active.
 .I time_running
 Time the event was running.
 .TP
+.IR cap_usr_time " / " cap_usr_rdpmc " / " cap_bit0 " (Since Linux 3.4)"
+There was a bug in the definition of 
+.I cap_usr_time
+and
+.I cap_usr_rdpmc
+from Linux 3.4 until Linux 3.11.
+Both bits were defined to point to the same location, so it was
+impossible to know if 
 .I cap_usr_time
-User time capability.
+or
+.I cap_usr_rdpmc
+were actually set.
+
+Starting with 3.12 these are renamed to
+.I cap_bit0
+and you should use the new
+.I cap_user_time
+and
+.I cap_user_rdpmc
+fields instead.
+
 .TP
+.IR cap_bit0_is_deprecated " (Since Linux 3.12)"
+If set this bit indicates that the kernel supports
+the properly separated
+.I cap_user_time
+and
+.I cap_user_rdpmc
+bits.
+
+If not-set, it indicates an older kernel where
+.I cap_usr_time
+and
 .I cap_usr_rdpmc
+map to the same bit and thus both features should
+be used with caution.
+
+.TP
+.IR cap_user_rdpmc " (Since Linux 3.12)" 
 If the hardware supports user-space read of performance counters
 without syscall (this is the "rdpmc" instruction on x86), then
 the following code can be used to do a read:
@@ -1195,7 +1290,6 @@ the following code can be used to do a read:
 u32 seq, time_mult, time_shift, idx, width;
 u64 count, enabled, running;
 u64 cyc, time_offset;
-s64 pmc = 0;
 
 do {
     seq = pc\->lock;
@@ -1215,7 +1309,7 @@ do {
 
     if (pc\->cap_usr_rdpmc && idx) {
         width = pc\->pmc_width;
-        pmc = rdpmc(idx \- 1);
+        count += rdpmc(idx \- 1);
     }
 
     barrier();
@@ -1223,6 +1317,16 @@ do {
 .fi
 .in
 .TP
+.I cap_user_time " (Since Linux 3.12)"
+This bit indicates the hardware has a constant, non-stop
+timestamp counter (TSC on x86).
+.TP
+.IR cap_user_time_zero " (Since Linux 3.12)"
+Indicates the presence of
+.I time_zero
+which allows mapping timestamp values to
+the hardware clock.
+.TP
 .I pmc_width
 If
 .IR cap_usr_rdpmc ,
@@ -1274,6 +1378,27 @@ enabled and possible running (if idx), improving the scaling:
     count = quot * enabled + (rem * enabled) / running;
 .fi
 .TP
+.IR time_zero " (Since Linux 3.12)"
+
+If 
+.I cap_usr_time_zero
+is set then the hardware clock (the TSC timestamp counter on x86) 
+can be calculated from the
+.IR time_zero ", " time_mult ", and " time_shift " values:"
+.nf
+    time = timestamp - time_zero;
+    quot = time / time_mult;
+    rem  = time % time_mult;
+    cyc = (quot << time_shift) + (rem << time_shift) / time_mult;
+.fi
+And vice versa:
+.nf
+    quot = cyc >> time_shift;
+    rem  = cyc & ((1 << time_shift) - 1);
+    timestamp = time_zero + quot * time_mult +
+        ((rem * time_mult) >> time_shift);
+.fi
+.TP
 .I data_head
 This points to the head of the data section.
 The value continuously increases, it does not wrap.
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
@@ -1855,6 +1998,29 @@ OS fault handler
 .PD
 .RE
 .RE
+.TP
+.B PERF_RECORD_MMAP2
+This record includes information on mmap() calls.
+It includes extended fields not available with
+the
+.B PERF_RECORD_MMAP
+record that allow uniquely identifying shared mappings.
+.in +4n
+.nf
+struct {
+    struct perf_event_header header;
+    u32 pid, tid;
+    u64 addr;
+    u64 len;
+    u64 pgoff;
+    u32 maj;
+    u32 min;
+    u64 ino;
+    u64 ino_generation;
+    char filename[];
+    struct sample_id sample_id;
+};
+.fi
 .RE
 .RE
 .SS Signal overflow
@@ -1994,6 +2160,12 @@ output should be ignored.
 This adds an ftrace filter to this event.
 
 The argument is a pointer to the desired ftrace filter.
+.TP
+.BR PERF_EVENT_IOC_ID " (Since Linux 3.12)"
+Returns the event ID value for the given event fd.
+
+The argument is a pointer to a 64-bit unsigned integer
+to hold the result.
 .SS Using prctl
 A process can enable or disable all the event groups that are
 attached to it using the
@@ -2200,6 +2372,17 @@ ioctl argument was broken and would repeatedly operate
 on the event specified rather than iterating across
 all sibling events in a group.
 
+From Linux 3.4 to Linux 3.11 the mmap
+.I cap_usr_rdpmc
+and
+.I cap_usr_time
+bits mapped to the same location.
+Code should migrate to the new
+.I cap_user_rdpmc
+and
+.I cap_user_time
+fields instead.
+
 Always double-check your results!
 Various generalized events have had wrong values.
 For example, retired branches measured
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
