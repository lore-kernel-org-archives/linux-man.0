From: Wang Nan <wangnan0-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] perf_event_open.2: Document write_backward
Date: Fri, 21 Oct 2016 11:38:13 +0000
Message-ID: <1477049893-143199-2-git-send-email-wangnan0@huawei.com>
References: <1477049893-143199-1-git-send-email-wangnan0@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477049893-143199-1-git-send-email-wangnan0-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: wangnan0-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, pi3orama-9Onoh4P/yGk@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lizefan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org
List-Id: linux-man@vger.kernel.org

Linux 4.7 (9ecda41acb971ebd07c8fb35faf24005c0baea12) introduces write_backward
attribute to perf_event_attr. Document this feature.

Signed-off-by: Wang Nan <wangnan0-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man2/perf_event_open.2 | 56 +++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 53 insertions(+), 3 deletions(-)

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 2d3acad..e5fdfec 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -244,8 +244,8 @@ struct perf_event_attr {
                                    due to exec */
           use_clockid    :  1,  /* use clockid for time fields */
           context_switch :  1,  /* context switch data */
-
-          __reserved_1   : 37;
+          write_backward :  1,  /* Write ring buffer from end to beginning */
+          __reserved_1   : 36;
 
     union {
         __u32 wakeup_events;    /* wakeup every n events */
@@ -1127,6 +1127,29 @@ The advantage of this method is that it will give full
 information even with strict
 .I perf_event_paranoid
 settings.
+.IR "write_backward" " (since Linux 4.6)"
+.\" commit 9ecda41acb971ebd07c8fb35faf24005c0baea12
+This makes the resuling event use a backward ring-buffer, which
+writes samples from the end of the ring-buffer.
+
+It is not allowed to connect events with backward and forward
+ring-buffer settings together using
+.B PERF_EVENT_IOC_SET_OUTPUT.
+
+Backward ring-buffer is useful when the ring-buffer is overwritable
+(created by readonly
+.BR mmap (2)
+). In this case,
+.IR data_tail
+is useless,
+.IR data_head
+points to the head of the most recent sample in a backward
+ring-buffer. It is easy to iterate over the whole ring-buffer by reading
+samples one by one because size of a sample can be found from decoding
+its header. In contract, in a forward overwritable ring-buffer, the only
+information is the end of the most recent sample which is pointed by
+.IR data_head,
+but the size of a sample can't be determined from the end of it.
 .TP
 .IR "wakeup_events" ", " "wakeup_watermark"
 This union sets how many samples
@@ -1671,7 +1694,9 @@ And vice versa:
 .TP
 .I data_head
 This points to the head of the data section.
-The value continuously increases, it does not wrap.
+The value continuously increases (or decrease if
+.IR write_backward
+is set), it does not wrap.
 The value needs to be manually wrapped by the size of the mmap buffer
 before accessing the samples.
 
@@ -2727,6 +2752,24 @@ Starting with Linux 3.18,
 .B POLL_HUP
 is indicated if the event being monitored is attached to a different
 process and that process exits.
+.SS Reading from overwritable ring-buffer
+Reader is unable to update
+.IR data_tail
+if the mapping is not
+.BR PROT_WRITE .
+In this case, kernel will overwrite data without considering whether
+they are read or not, so ring-buffer is overwritable and
+behaves like a flight recorder. To read from an overwritable
+ring-buffer, setting
+.IR write_backward
+is suggested, or it would be hard to find a proper position to start
+decoding. In addition, ring-buffer should be paused before reading
+through
+.BR ioctl (2)
+with
+.B PERF_EVENT_IOC_PAUSE_OUTPUT
+to avoid racing between kernel and reader. Ring-buffer should be resumed
+after finish reading.
 .SS rdpmc instruction
 Starting with Linux 3.4 on x86, you can use the
 .\" commit c7206205d00ab375839bd6c7ddb247d600693c09
@@ -2839,6 +2882,13 @@ The file descriptors must all be on the same CPU.
 
 The argument specifies the desired file descriptor, or \-1 if
 output should be ignored.
+
+Two events with different
+.IR write_backward
+settings are not allowed to be connected together using
+.B PERF_EVENT_IOC_SET_OUTPUT.
+.B EINVAL
+is returned in this case.
 .TP
 .BR PERF_EVENT_IOC_SET_FILTER " (since Linux 2.6.33)"
 .\" commit 6fb2915df7f0747d9044da9dbff5b46dc2e20830
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
