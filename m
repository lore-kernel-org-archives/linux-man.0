From: Wang Nan <wangnan0@huawei.com>
Subject: [PATCH 1/2] perf_event_open.2: Document PERF_EVENT_IOC_PAUSE_OUTPUT
Date: Fri, 21 Oct 2016 11:38:12 +0000
Message-ID: <1477049893-143199-1-git-send-email-wangnan0@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mtk.manpages@gmail.com
Cc: wangnan0@huawei.com, pi3orama@163.com, linux-kernel@vger.kernel.org, linux-man@vger.kernel.org, lizefan@huawei.com, vincent.weaver@maine.edu
List-Id: linux-man@vger.kernel.org

Linux 4.7 (86e7972f690c1017fd086cdfe53d8524e68c661c) introduces
PERF_EVENT_IOC_PAUSE_OUTPUT feature. Document it.

Signed-off-by: Wang Nan <wangnan0@huawei.com>
Cc: Michael Kerrisk <mtk.manpages@gmail.com>
---
 man2/perf_event_open.2 | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index fade28c..2d3acad 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -2865,7 +2865,18 @@ The argument is a BPF program file descriptor that was created by
 a previous
 .BR bpf (2)
 system call.
-.SS Using prctl(2)
+.TP
+.BR PERF_EVENT_IOC_PAUSE_OUTPUT " (since Linux 4.7)"
+.\" commit 86e7972f690c1017fd086cdfe53d8524e68c661c
+This allows pausing and resuming the event's ring-buffer. A
+paused ring-buffer does not prevent samples generation, but simply
+discards them. The discarded samples are considered lost, causes
+.BR PERF_RECORD_LOST
+to be generated when possible.
+
+The argument is an integer. Nonzero value pauses the ring-buffer,
+zero value resumes the ring-buffer.
+.SS Using prctl
 A process can enable or disable all the event groups that are
 attached to it using the
 .BR prctl (2)
-- 
2.10.1
