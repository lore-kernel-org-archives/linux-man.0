From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: perf_event_open.2: PERF_SAMPLE_BRANCH_STACK updates
Date: Mon, 9 Sep 2013 15:32:33 -0400 (EDT)
Message-ID: <alpine.DEB.2.10.1309091526560.10528@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


This started out as just adding the new perf_event_open features
from Linux 3.11 (which was the addition of transactional memory
defines for PERF_SAMPLE_BRANCH_STACK samples) but turned into a
general cleanup of the PERF_SAMPLE_BRANCH_STACK documentation.

The main clarification is that at least one of the non-privilege values
must be set or else perf_event_open will return an EINVAL error.

Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index f96df8c..b2604c4 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -969,13 +969,12 @@ If
 .B PERF_SAMPLE_BRANCH_STACK
 is enabled, then this specifies what branches to include
 in the branch record.
+
+The first part of the value is the privilege level, which
+is a combination of one of the following values.
 If the user does not set privilege level explicitly, the kernel
 will use the event's privilege level.
 Event and branch privilege levels do not have to match.
-The value is formed by ORing together zero or more of the following values,
-although
-.B PERF_SAMPLE_BRANCH_ANY
-covers all branch types.
 .RS
 .TP
 .B PERF_SAMPLE_BRANCH_USER
@@ -987,8 +986,16 @@ Branch target is in kernel space
 .B PERF_SAMPLE_BRANCH_HV
 Branch target is in hypervisor
 .TP
+.B PERF_SAMPLE_BRANCH_PLM_ALL
+A convenience value that is the three preceding values ORed together.
+
+.P
+In addition to the privilege value, at least one or more of the
+following bits must be set.
+
+.TP
 .B PERF_SAMPLE_BRANCH_ANY
-Any branch type.
+Any branch type
 .TP
 .B PERF_SAMPLE_BRANCH_ANY_CALL
 Any call branch
@@ -996,12 +1003,19 @@ Any call branch
 .B PERF_SAMPLE_BRANCH_ANY_RETURN
 Any return branch
 .TP
-.BR PERF_SAMPLE_BRANCH_IND_CALL
+.B PERF_SAMPLE_BRANCH_IND_CALL
 Indirect calls
 .TP
-.BR PERF_SAMPLE_BRANCH_PLM_ALL
-User, kernel, and hv
+.BR PERF_SAMPLE_BRANCH_ABORT_TX " (Since Linux 3.11)"
+Transactional memory aborts
+.TP
+.BR PERF_SAMPLE_BRANCH_IN_TX " (Since Linux 3.11)"
+Branch in transactional memory transaction
+.TP
+.BR PERF_SAMPLE_BRANCH_NO_TX " (Since Linux 3.11)"
+Branch not in transactional memory transaction
 .RE
+
 .TP
 .IR "sample_regs_user" " (Since Linux 3.7)"
 This bitmask defines the set of user CPU registers to dump on samples.
@@ -1572,8 +1586,15 @@ the branch target
 the branch target was mispredicted
 .TP
 .I predicted
-the branch target was predicted.
-.RE
+the branch target was predicted
+.TP
+.IR in_tx " (Since Linux 3.11)"
+the branch was in a transactional memory transaction
+.TP
+.IR abort " (Since Linux 3.11)"
+the branch was in an aborted transactional memory transaction.
+
+.P
 The entries are from most to least recent, so the first entry
 has the most recent branch.
 
@@ -1584,6 +1605,11 @@ and
 is optional; if not supported, both
 values will be 0.
 
+The type of branches recorded is specified by the
+.I branch_sample_type
+field.
+.RE
+
 .TP
 .IR abi ", " regs[weight(mask)]
 If
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
