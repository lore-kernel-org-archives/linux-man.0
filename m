From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: perf_event_open() -- fix a few typos
Date: Mon, 8 Jul 2013 15:49:14 -0400 (EDT)
Message-ID: <alpine.DEB.2.10.1307081547210.10386@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


I sent this earlier but it might have gotten lost because it was inside of 
a longer discussion thread.

This fixes some typos that have crept into the perf_event_open() manpage.

Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 504e801..b64ad90 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -1588,7 +1588,7 @@ is the amount of data actually dumped (can be less than
 .I weight
 If
 .B PERF_SAMPLE_WEIGHT
-is enabled, then a 64 bit value provided by the hardwre
+is enabled, then a 64 bit value provided by the hardware
 is recorded that indicates how costly the event was.
 This allows expensive events to stand out more clearly
 in profiles.
@@ -1837,7 +1837,7 @@ Using an argument of 0 is considered undefined behavior.
 .TP
 .B PERF_EVENT_IOC_RESET
 Reset the event count specified by the
-file descriptor argumentto zero.
+file descriptor argument to zero.
 This resets only the counts; there is no way to reset the
 multiplexing
 .I time_enabled
@@ -1852,7 +1852,7 @@ reset, even if the event specified is not the group leader.
 
 If the
 .B PERF_IOC_FLAG_GROUP
-bit is not set, then the behavior is somwhat unexpected:
+bit is not set, then the behavior is somewhat unexpected:
 when sent to a group leader only the leader is reset
 (children are left alone);
 when sent to a child all events in a group are reset.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
