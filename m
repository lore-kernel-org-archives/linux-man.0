From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [patch] perf_event_open.2 : PERF_EVENT_IOC_PERIOD behavior change
Date: Mon, 31 Mar 2014 15:51:16 -0400 (EDT)
Message-ID: <alpine.DEB.2.10.1403311548090.10482@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org


Linux 3.14 (in commit bad7192b842c83e580747ca57104dd51fe08c223)
changes the perf_event PERF_EVENT_IOC_PERIOD ioctl() behavior
on all architectures to update immediately, to match the behavior
found on ARM.

Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 30a2168..fa99d25 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -2191,9 +2191,11 @@ reset, even if the event specified is not the group leader
 .TP
 .B PERF_EVENT_IOC_PERIOD
 This updates the overflow period for the event.
-On most architectures the new period does not take effect until
-after the next overflow happens;
-on ARM since Linux 3.7 the period is updated immediately.
+
+Since Linux 3.7 (on ARM) and Linux 3.14 (all other architectures)
+the new period takes effect immediately.
+On older kernels the new period did not take effect until
+after the next overflow.
 
 The argument is a pointer to a 64-bit value containing the
 desired new period.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
