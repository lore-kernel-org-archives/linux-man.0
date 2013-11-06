From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [PATCH 4/4] perf_event_open.2 Linux 3.12 rdpmc/mmap
Date: Wed, 6 Nov 2013 13:34:56 -0500 (EST)
Message-ID: <alpine.DEB.2.10.1311061332040.26649@vincent-weaver-1.um.maine.edu>
References: <alpine.DEB.2.10.1311061324070.26649@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.10.1311061324070.26649-6xBS8L8d439fDsnSvq7Uq4Se7xf15W0s1dQoKJhdanU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


It turns out that the perf_event mmap page rdpmc/time setting was
broken, dating back to the introduction of the feature.  Due
to a mistake with a bitfield, two different values mapped to
the same feature bit.

A new somewhat backwards compatible interface was introduced
in Linux 3.12.  A much longer report on the issue can be found
here:
   https://lwn.net/Articles/567894/

Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>


diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 4ff9690..a443b6e 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
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
 .I cap_usr_time
-User time capability.
+and
+.I cap_usr_rdpmc
+from Linux 3.4 until Linux 3.11.
+Both bits were defined to point to the same location, so it was
+impossible to know if 
+.I cap_usr_time
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
@@ -2221,6 +2387,17 @@ ioctl argument was broken and would repeatedly operate
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
