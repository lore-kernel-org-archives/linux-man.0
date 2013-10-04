From: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Subject: [PATCH] Document transaction flags in perf_event_open manpage
Date: Fri, 4 Oct 2013 08:02:40 +0200
Message-ID: <20131004060240.GD6882@two.firstfloor.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org
Cc: peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Assuming the transaction extensions in Peter's tree are reaching
3.13, here are the perf_event_open man page changes for it.

I also added a reference to ocperf (unrelated)

-Andi

--- perf_event_open.2-o	2013-10-03 22:38:20.317545826 -0700
+++ perf_event_open.2	2013-10-03 22:58:29.439279879 -0700
@@ -572,7 +572,7 @@
 These are implementation defined; see your CPU manual (for example
 the Intel Volume 3B documentation or the AMD BIOS and Kernel Developer
 Guide).
-The libpfm4 library can be used to translate from the name in the
+The libpfm4 library or the ocperf tool can be used to translate from the name in the
 architectural manuals to the raw hex value
 .BR perf_event_open ()
 expects in this field.
@@ -708,6 +708,12 @@
 setting makes the event stream always parsable
 by putting SAMPLE_ID in a fixed location, even though
 it means having duplicate SAMPLE_ID values in records.
+.TP
+.BR PERF_SAMPLE_TRANSACTION " (Since Linux 3.13)"
+Report memory transaction abort flags (for example from Intel TSX) for abort events
+in the transaction field. The 
+.B precise_ip 
+level must be larger than 0. 
 .RE
 .TP
 .IR "read_format"
@@ -1660,6 +1666,7 @@
     u64   dyn_size;   /* if PERF_SAMPLE_STACK_USER */
     u64   weight;     /* if PERF_SAMPLE_WEIGHT */
     u64   data_src;   /* if PERF_SAMPLE_DATA_SRC */
+    u64   transaction; /* if PERF_SAMPLE_TRANSACTION */
 };
 .fi
 .RS 4
@@ -1997,6 +2004,33 @@
 .RE
 .PD
 .RE
+.TP
+.I transaction
+When the 
+.B PERF_SAMPLE_TRANSACTION " (Since Linux 3.13)"
+flag is set for an abort event the abort flags of a memory transaction are reported in a 64bit field.
+Valid flags are 
+.B PERF_TXN_ELISION
+for an elision abort,
+.B PERF_TXN_TRANSACTION
+for a transaction abort,
+.B PERF_TXN_SYNC
+for a synchronous abort (related to the reported instruction),
+.B PERF_TXN_ASYNC
+for an asynchronous abort (not related to the instruction),
+.B PERF_TXN_RETRY
+for retryable aborts,
+.B PERF_TXN_CONFLICT
+for aborts due to memory conflicts with other threads,
+.B PERF_TXN_CAPACITY_WRITE
+for aborts due to write capacity overflow,
+.B PERF_TXN_CAPACITY_READ
+for aborts due to read capacity overflow,
+and the bits masked by 
+.B PERF_TXN_ABORT_MASK
+at bit position
+.B PERF_TXN_ABORT_SHIFT
+indicates the user specified abort code.
 .RE
 .TP
 .B PERF_RECORD_MMAP2


-- 
ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org -- Speaking for myself only.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
