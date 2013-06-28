From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: perf_event_open() - add PERF_IOC_FLAG_GROUP documentation
Date: Fri, 28 Jun 2013 16:55:12 -0400 (EDT)
Message-ID: <alpine.DEB.2.10.1306281651100.10799@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


The perf_event_open() ENABLE/DISABLE/RESET ioctls can take an argument,
PERF_IOC_FLAG_GROUP.  This wasn't documented at all until about a year
ago (despite the support being there from the beginning) so I missed
this when initially writing the manpage.

Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 5b8e769..5900b1c 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -1664,7 +1664,10 @@ file descriptors
 Enables the individual event or event group specified by the
 file descriptor argument.
 
-The ioctl argument is ignored.
+If the 
+.B PERF_IOC_FLAG_GROUP
+bit is set in the ioctl argument then all events in a group are 
+enabled, even if the event specified is not the group leader.
 .TP
 .B PERF_EVENT_IOC_DISABLE
 Disables the individual counter or event group specified by the
@@ -1677,7 +1680,10 @@ Enabling or disabling a member of a group other than the leader
 affects only that counter; disabling a non-leader
 stops that counter from counting but doesn't affect any other counter.
 
-The ioctl argument is ignored.
+If the 
+.B PERF_IOC_FLAG_GROUP
+bit is set in the ioctl argument then all events in a group are 
+disabled, even if the event specified is not the group leader.
 .TP
 .B PERF_EVENT_IOC_REFRESH
 Non-inherited overflow counters can use this
@@ -1702,10 +1708,18 @@ multiplexing
 or
 .I time_running
 values.
-When sent to a group leader, only
-the leader is reset (child events are not).
 
-The ioctl argument is ignored.
+If the 
+.B PERF_IOC_FLAG_GROUP
+bit is set in the ioctl argument then all events in a group are 
+reset, even if the event specified is not the group leader.
+
+If the
+.B PERF_IOC_FLAG_GROUP
+bit is not set then the behavior is somwhat unexpected:
+when sent to a group leader only the leader is reset 
+(children are left alone); 
+when sent to a child all events in a group are reset.
 .TP
 .B PERF_EVENT_IOC_PERIOD
 IOC_PERIOD is the command to update the period; it
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
