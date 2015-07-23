From: Vince Weaver <vincent.weaver@maine.edu>
Subject: [patch 09/11] perf_event_open.2: 4.1 add PERF_RECORD_ITRACE_START
Date: Thu, 23 Jul 2015 13:15:18 -0400 (EDT)
Message-ID: <alpine.DEB.2.20.1507231314400.3742@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Stephane Eranian <eranian@google.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Frederic Weisbecker <fweisbec@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Kaixu Xia <kaixu.xia@linaro.org>, Linus Torvalds <torvalds@linux-foundation.org>, Mike Galbraith <efault@gmx.de>, Robert Richter <rric@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, adrian.hunter@intel.com, kan.liang@intel.com, markus.t.metzger@intel.com, mathieu.poirier@linaro.org, Vince Weaver <vincent.weaver@maine.edu>
List-Id: linux-man@vger.kernel.org



This manpage patch relates to the addition of the PERF_RECORD_ITRACE_START
record type in the following commit:

	commit ec0d7729bbaed4b9d2d3fada693278e13a3d1368
	Author: Alexander Shishkin <alexander.shishkin@linux.intel.com>

	perf: Add ITRACE_START record to indicate that tracing has started

	Signed-off-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>
	Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
	Cc: Borislav Petkov <bp@alien8.de>
	Cc: Frederic Weisbecker <fweisbec@gmail.com>
	Cc: H. Peter Anvin <hpa@zytor.com>
	Cc: Kaixu Xia <kaixu.xia@linaro.org>
	Cc: Linus Torvalds <torvalds@linux-foundation.org>
	Cc: Mike Galbraith <efault@gmx.de>
	Cc: Paul Mackerras <paulus@samba.org>
	Cc: Robert Richter <rric@kernel.org>
	Cc: Stephane Eranian <eranian@google.com>
	Cc: Thomas Gleixner <tglx@linutronix.de>
	Cc: acme@infradead.org
	Cc: adrian.hunter@intel.com
	Cc: kan.liang@intel.com
	Cc: markus.t.metzger@intel.com
	Cc: mathieu.poirier@linaro.org
	Link: http://lkml.kernel.org/r/1421237903-181015-15-git-send-email-alexander.shishkin@linux.intel.com
	Signed-off-by: Ingo Molnar <mingo@kernel.org>


Signed-off-by: Vince Weaver <vincent.weaver@maine.edu>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 19c5c23..8ef9ec6 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -2505,6 +2505,29 @@ buffer size.
 if set then the data returned has overwritten previous data.
 .RE
 .RE
+.TP
+.BR PERF_RECORD_ITRACE_START " (since Linux 4.1)"
+\" ec0d7729bbaed4b9d2d3fada693278e13a3d1368
+This record indicates which process has initiated an instruction
+trace event, allowing tools to properly correlate the instruction
+addresses in the AUX buffer with the proper executable.
+
+.in +4n
+.nf
+struct {
+    struct perf_event_header header;
+    u32 pid;
+    u32 tid;
+};
+.fi
+.RS
+.TP
+.I pid
+process id of the thread starting an instruction trace.
+.TP
+.I tid
+thread id of the thread starting an instruction trace.
+.RE
 .RE
 .SS Overflow handling
 Events can be set to notify when a threshold is crossed,
