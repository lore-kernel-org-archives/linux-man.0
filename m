From: Wang Nan <wangnan0-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH][manpages 1/2] perf_event_open.2: Document PERF_EVENT_IOC_PAUSE_OUTPUT
Date: Mon, 28 Mar 2016 10:15:47 +0000
Message-ID: <1459160147-240738-1-git-send-email-wangnan0@huawei.com>
References: <1459147292-239310-2-git-send-email-wangnan0@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459147292-239310-2-git-send-email-wangnan0-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, vince-yfjdyHUqu3OsTnJN9+BGXg@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pi3orama-9Onoh4P/yGk@public.gmane.org, lizefan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, Wang Nan <wangnan0-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Wang Nan <wangnan0-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 man2/perf_event_open.2 | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index c90fc51..b232cba 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -2719,6 +2719,17 @@ The argument is a BPF program file descriptor that was created by
 a previous
 .BR bpf (2)
 system call.
+.TP
+.BR PERF_EVENT_IOC_PAUSE_OUTPUT " (since Linux 4.6)"
+.\" commit ? (http://lkml.kernel.org/g/1459147292-239310-2-git-send-email-wangnan0-hv44wF8Li93QT0dZR+AlfA@public.gmane.org)
+This allows pausing and resuming the event's ring-buffer. A
+paused ring-buffer does not prevent samples generation, but simply
+discards them. The discarded samples are considered lost, causes
+.BR PERF_RECORD_LOST
+to be generated when possible.
+
+The argument is an integer. Nonzero value pauses the ring-buffer,
+zero value resumes the ring-buffer.
 .SS Using prctl
 A process can enable or disable all the event groups that are
 attached to it using the
-- 
1.8.3.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
