From: Vince Weaver <vincent.weaver@maine.edu>
Subject: [patch] perf_event_open.2 clarify the PERF_FLAG_FD_* flags
Date: Thu, 8 Jan 2015 12:04:30 -0500 (EST)
Message-ID: <alpine.DEB.2.11.1501081201020.25399@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: xmtk.manpages@gmail.com, linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>
List-Id: linux-man@vger.kernel.org


This change clarifies the behavior of the PERF_FLAG_FD_OUTPUT and
PERF_FLAG_FD_NO_GROUP flags to perf_event_open(), and removes
the related FIXME comments.

While writing tests to validate the behavior of these flags I
discovered that PERF_FLAG_FD_OUTPUT has been broken since the
2.6.35 kernel release.

Signed-off-by: Vince Weaver <vincent.weaver@maine.edu>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 8bde791..7181c29 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -149,14 +149,17 @@ then
 .BR execve (2).
 .TP
 .BR PERF_FLAG_FD_NO_GROUP
-.\" FIXME . The following sentence is unclear
-This flag allows creating an event as part of an event group but
-having no group leader.
-It is unclear why this is useful.
-.\" FIXME . So, why is it useful?
-.TP
-.BR PERF_FLAG_FD_OUTPUT
-This flag reroutes the output from an event to the group leader.
+This flag tells the event to ignore the
+.IR group_fd
+parameter except for the purpose of setting up output redirection
+using the
+.B PERF_FLAG_FD_OUTPUT
+flag.
+.TP
+.BR PERF_FLAG_FD_OUTPUT " (broken since Linux 2.6.35)."
+This flag re-routes the event's sampled output to instead
+be included in the mmap buffer of the event specified by
+.IR group_fd .
 .TP
 .BR PERF_FLAG_PID_CGROUP " (since Linux 2.6.39)."
 This flag activates per-container system-wide monitoring.
