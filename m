From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: minor perf_event_open() clarification
Date: Thu, 30 May 2013 17:22:37 -0400 (EDT)
Message-ID: <alpine.DEB.2.10.1305301720060.13646@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Clarify the perf_event_open() wakeup_events/wakeup_watermark fields a bit,
based on info from kernel commit cfeb1d90a1b1.

Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index f3850f0..14b89ae 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -870,6 +870,16 @@ happen before an overflow signal happens.
 Which one is used is selected by the
 .I watermark
 bitflag.
+
+.I wakeup_events
+only counts
+.B PERF_RECORD_SAMPLE
+record types.  
+To  receive a signal for every incoming
+.B PERF_RECORD
+type set
+.I wakeup_watermark
+to 1.
 .TP
 .IR "bp_type" " (Since Linux 2.6.33)"
 This chooses the breakpoint type.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
