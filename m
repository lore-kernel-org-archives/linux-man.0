From: Vince Weaver <vincent.weaver@maine.edu>
Subject: [patch] perf_event_open.2: add cycles field in LBR records
Date: Wed, 19 Oct 2016 11:10:53 -0400 (EDT)
Message-ID: <alpine.DEB.2.20.1610191108080.16261@macbook-air>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>
List-Id: linux-man@vger.kernel.org


Linux 4.3 (71ef3c6b9d4665ee7afbbe4c208a98917dcfc32f)
added a cycles field to the PERF_SAMPLE_BRANCH_STACK
last branch records.

The kernel commit was a bit vague on this, but you can find
a few more details on this in the Intel Architectural Manual
vol3B.  The field indicates the number of core cycles elapsed
since the previous update to the LBR stack.

This feature is only found on Skylake and newer Intel chips,
as well as Intel Atom Goldmont chips.  I'm not sure if it's
worth adding this info to the manpage, as it seems a bit
specific and will probably get rapidly out of date.

I'm also not sure about the manpage project's opinion on
Oxford commas.

Signed-off-by: Vince Weaver <vincent.weaver@maine.edu>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index d64adaf..c9555c6 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -2183,15 +2183,18 @@ The branch was in a transactional memory transaction.
 .IR abort " (since Linux 3.11)"
 .\" commit 135c5612c460f89657c4698fe2ea753f6f667963
 The branch was in an aborted transactional memory transaction.
+.TP
+.IR cycles " (since Linux 4.3)"
+.\" commit 71ef3c6b9d4665ee7afbbe4c208a98917dcfc32f
+This reports the number of cycles elapsed since the
+previous branch stack update.
 .P
 The entries are from most to least recent, so the first entry
 has the most recent branch.
 
 Support for
-.I mispred
-and
-.I predicted
-is optional; if not supported, both
+.IR mispred ", " predicted " and " cycles
+is optional; if not supported, those
 values will be 0.
 
 The type of branches recorded is specified by the
