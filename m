From: Vince Weaver <vincent.weaver@maine.edu>
Subject: [patch 04/11] perf_event_open.2: 4.1 data_offset and data_size
 fields
Date: Thu, 23 Jul 2015 13:11:10 -0400 (EDT)
Message-ID: <alpine.DEB.2.20.1507231310270.3742@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Stephane Eranian <eranian@google.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Frederic Weisbecker <fweisbec@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Kaixu Xia <kaixu.xia@linaro.org>, Linus Torvalds <torvalds@linux-foundation.org>, Mike Galbraith <efault@gmx.de>, Robert Richter <rric@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, adrian.hunter@intel.com, kan.liang@intel.com, markus.t.metzger@intel.com, mathieu.poirier@linaro.org, Vince Weaver <vincent.weaver@maine.edu>
List-Id: linux-man@vger.kernel.org


This manpage patch relates to the addition of the data_offset
and data_size fields to the perf_event mmap buffer, as added
in the following commit:

	commit e8c6deac69629c0cb97c3d3272f8631ef17f8f0f
	Author: Alexander Shishkin <alexander.shishkin@linux.intel.com>

	perf: Add data_{offset,size} to user_page

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
	Link: http://lkml.kernel.org/r/1421237903-181015-2-git-send-email-alexander.shishkin@linux.intel.com
	Signed-off-by: Ingo Molnar <mingo@kernel.org>


Signed-off-by: Vince Weaver <vincent.weaver@maine.edu>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 09eda9a..a3bebaa 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -1414,6 +1414,9 @@ struct perf_event_mmap_page {
     __u64 __reserved[120];   /* Pad to 1k */
     __u64 data_head;         /* head in the data section */
     __u64 data_tail;         /* user-space written tail */
+    __u64 data_offset;       /* where the buffer starts */
+    __u64 data_size;         /* data buffer size */
+
 }
 .fi
 .in
@@ -1630,6 +1633,16 @@ the
 .I data_tail
 value should be written by user space to reflect the last read data.
 In this case, the kernel will not overwrite unread data.
+.TP
+.IR data_offset " (since Linux 4.1)"
+.\" commit e8c6deac69629c0cb97c3d3272f8631ef17f8f0f
+Contains the offset of the location in the mmap buffer
+where perf sample data begins.
+.TP
+.IR data_size " (since Linux 4.1)"
+.\" commit e8c6deac69629c0cb97c3d3272f8631ef17f8f0f
+Contains the size of the perf sample region within
+the mmap buffer.
 .PP
 The following 2^n ring-buffer pages have the layout described below.
 
