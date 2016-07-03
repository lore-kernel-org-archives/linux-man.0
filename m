From: Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] perf_event_open.2: Add a note that dyn_size is omitted if
 size == 0
Date: Sun, 3 Jul 2016 19:08:33 -0400
Message-ID: <CABV8kRwrvuPsqwep5xJv+G_vN6cK=xqWRHRp0ducR7pZxwfr6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org
List-Id: linux-man@vger.kernel.org

The perf_output_sample_ustack in kernel/events/core.c only writes a
single 64 bit word
if it can't dump the user registers. From the current version of the
man page, I would
have expected two 64 bit words (one for size, one for dyn_size). Change the man
page to make this behavior explicit.

This is my first man-pages patch, please let me know if I should do
anything else.

---
 man2/perf_event_open.2 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 0e42c50..6788154 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -1994,7 +1994,7 @@ struct {
                       /* if PERF_SAMPLE_REGS_USER */
     u64   size;       /* if PERF_SAMPLE_STACK_USER */
     char  data[size]; /* if PERF_SAMPLE_STACK_USER */
-    u64   dyn_size;   /* if PERF_SAMPLE_STACK_USER */
+    u64   dyn_size;   /* if PERF_SAMPLE_STACK_USER && size != 0 */
     u64   weight;     /* if PERF_SAMPLE_WEIGHT */
     u64   data_src;   /* if PERF_SAMPLE_DATA_SRC */
     u64   transaction;/* if PERF_SAMPLE_TRANSACTION */
@@ -2185,6 +2185,11 @@ stack pointer at the time of sampling).
 .I dyn_size
 is the amount of data actually dumped (can be less than
 .IR size ).
+Note that
+.I dyn_size
+is omitted if
+.I size
+is 0.
 .TP
 .I weight
 If
--
2.6.4
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
