From: Vince Weaver <vincent.weaver@maine.edu>
Subject: [patch v2] perf_event_open.2: 3.19 PERF_SAMPLE_REGS_INTR support
Date: Tue, 21 Jul 2015 11:47:08 -0400 (EDT)
Message-ID: <alpine.DEB.2.20.1507211144560.29103@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Stephane Eranian <eranian@google.com>, Jiri Olsa <jolsa@redhat.com>, cebbert.lkml@gmail.com, Linus Torvalds <torvalds@linux-foundation.org>, andi@firstfloor.org
List-Id: linux-man@vger.kernel.org


This manpage patch relates to the addition of PERF_SAMPLE_REGS_INTR
support added in the following commit:

    perf_sample_regs_intr; Linux 3.19
	commit 60e2364e60e86e81bc6377f49779779e6120977f
	Author: Stephane Eranian <eranian@google.com>

            perf: Add ability to sample machine state on interrupt

	Reviewed-by: Jiri Olsa <jolsa@redhat.com>
	Signed-off-by: Stephane Eranian <eranian@google.com>
	Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
	Cc: cebbert.lkml@gmail.com
	Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
	Cc: Linus Torvalds <torvalds@linux-foundation.org>
	Cc: linux-api@vger.kernel.org
	Link: http://lkml.kernel.org/r/1411559322-16548-2-git-send-email-eranian@google.com
	Signed-off-by: Ingo Molnar <mingo@kernel.org>

The primary difference between PERF_SAMPLE_REGS_INTR and the
existing PERF_SAMPLE_REGS_USER is that the new support will
return kernel register values if the overflow happened while
in kernel mode.  Also if precise_ip is set higher than 0 then
the PEBS register state will be returned rather than the 
saved interrupt state.

This patch incorporates feedback from Stephane Eranian and
Andi Kleen.

Signed-off-by: Vince Weaver <vincent.weaver@maine.edu>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 39c8d8c..ca03928 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -256,7 +256,7 @@ struct perf_event_attr {
     __u32 sample_stack_user;    /* size of stack to dump on
                                    samples */
     __u32 __reserved_2;         /* Align to u64 */
-
+    __u64 sample_regs_intr;     /* regs to dump on samples */
 };
 .fi
 .in
@@ -350,6 +350,11 @@ and
 .I sample_stack_user
 in Linux 3.7.
 .\" commit 1659d129ed014b715b0b2120e6fd929bdd33ed03
+.B PERF_ATTR_SIZE_VER4
+is 104 corresponding to the addition of
+.I sample_regs_intr
+in Linux 3.19.
+.\" commit 60e2364e60e86e81bc6377f49779779e6120977f
 .TP
 .I "config"
 This specifies which event you want, in conjunction with
@@ -752,6 +757,23 @@ event must be measured or no values will be recorded.
 Also note that some perf_event measurements, such as sampled
 cycle counting, may cause extraneous aborts (by causing an
 interrupt during a transaction).
+.TP
+.BR PERF_SAMPLE_REGS_INTR " (since Linux 3.19)"
+.\" commit 60e2364e60e86e81bc6377f49779779e6120977f
+Records a subset of the current CPU register state
+as specified by
+.IR sample_regs_intr .
+Unlike
+.B PERF_SAMPLE_REGS_USER
+the register values will return kernel register
+state if the overflow happened while kernel
+code is running.
+If the CPU supports hardware sampling of
+register state (as does PEBS on x86) and
+.I precise_ip
+is set higher than zero then the register
+values returned are those captured by
+hardware.
 .RE
 .TP
 .IR "read_format"
@@ -1855,6 +1877,9 @@ struct {
     u64   weight;     /* if PERF_SAMPLE_WEIGHT */
     u64   data_src;   /* if PERF_SAMPLE_DATA_SRC */
     u64   transaction;/* if PERF_SAMPLE_TRANSACTION */
+    u64   abi;        /* if PERF_SAMPLE_REGS_INTR */
+    u64   regs[weight(mask)];
+                      /* if PERF_SAMPLE_REGS_INTR */
 };
 .fi
 .RS 4
@@ -2242,6 +2267,27 @@ the high 32 bits of the field by shifting right by
 .B PERF_TXN_ABORT_SHIFT
 and masking with
 .BR PERF_TXN_ABORT_MASK .
+.TP
+.IR abi ", " regs[weight(mask)]
+If
+.B PERF_SAMPLE_REGS_INTR
+is enabled, then the user CPU registers are recorded.
+
+The
+.I abi
+field is one of
+.BR PERF_SAMPLE_REGS_ABI_NONE ", " PERF_SAMPLE_REGS_ABI_32 " or "
+.BR PERF_SAMPLE_REGS_ABI_64 .
+
+The
+.I regs
+field is an array of the CPU registers that were specified by
+the
+.I sample_regs_intr
+attr field.
+The number of values is the number of bits set in the
+.I sample_regs_intr
+bit mask.
 .RE
 .TP
 .B PERF_RECORD_MMAP2

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 01ee579..f6a2865 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -256,7 +256,7 @@ struct perf_event_attr {
     __u32 sample_stack_user;    /* size of stack to dump on
                                    samples */
     __u32 __reserved_2;         /* Align to u64 */
-
+    __u64 sample_regs_intr;     /* regs to dump on samples */
 };
 .fi
 .in
@@ -350,6 +350,11 @@ and
 .I sample_stack_user
 in Linux 3.7.
 .\" commit 1659d129ed014b715b0b2120e6fd929bdd33ed03
+.B PERF_ATTR_SIZE_VER4
+is 104 corresponding to the addition of
+.I sample_regs_intr
+in Linux 3.19.
+.\" commit 60e2364e60e86e81bc6377f49779779e6120977f
 .TP
 .I "config"
 This specifies which event you want, in conjunction with
@@ -752,6 +757,24 @@ event must be measured or no values will be recorded.
 Also note that some perf_event measurements, such as sampled
 cycle counting, may cause extraneous aborts (by causing an
 interrupt during a transaction).
+.TP
+.BR PERF_SAMPLE_REGS_INTR " (since Linux 3.19)"
+.\" commit 60e2364e60e86e81bc6377f49779779e6120977f
+Records a subset of the current CPU register state
+as specified by
+.IR sample_regs_intr .
+Unlike
+.B PERF_SAMPLE_REGS_USER
+the register values will return kernel register
+state if the overflow happened while kernel
+code is running.
+If the CPU supports hardware sampling of
+register state (i.e. PEBS on Intel x86) and
+.I precise_ip
+is set higher than zero then the register
+values returned are those captured by
+hardware at the time of the sampled
+instruction's retirement.
 .RE
 .TP
 .IR "read_format"
@@ -1855,6 +1878,9 @@ struct {
     u64   weight;     /* if PERF_SAMPLE_WEIGHT */
     u64   data_src;   /* if PERF_SAMPLE_DATA_SRC */
     u64   transaction;/* if PERF_SAMPLE_TRANSACTION */
+    u64   abi;        /* if PERF_SAMPLE_REGS_INTR */
+    u64   regs[weight(mask)];
+                      /* if PERF_SAMPLE_REGS_INTR */
 };
 .fi
 .RS 4
@@ -2242,6 +2268,27 @@ the high 32 bits of the field by shifting right by
 .B PERF_TXN_ABORT_SHIFT
 and masking with
 .BR PERF_TXN_ABORT_MASK .
+.TP
+.IR abi ", " regs[weight(mask)]
+If
+.B PERF_SAMPLE_REGS_INTR
+is enabled, then the user CPU registers are recorded.
+
+The
+.I abi
+field is one of
+.BR PERF_SAMPLE_REGS_ABI_NONE ", " PERF_SAMPLE_REGS_ABI_32 " or "
+.BR PERF_SAMPLE_REGS_ABI_64 .
+
+The
+.I regs
+field is an array of the CPU registers that were specified by
+the
+.I sample_regs_intr
+attr field.
+The number of values is the number of bits set in the
+.I sample_regs_intr
+bit mask.
 .RE
 .TP
 .B PERF_RECORD_MMAP2
