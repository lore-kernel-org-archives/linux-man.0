From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [patch] perf_event_open.2 PERF_EVENT_IOC_PERIOD update
Date: Mon, 28 Oct 2013 09:33:04 -0400 (EDT)
Message-ID: <alpine.DEB.2.10.1310280927280.22634@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


The PERF_EVENT_IOC_PERIOD ioctl was broken until 2.6.36, and it turns out 
that the ARM architecture has some differing behavior too.

Reported-by: Andreas Sandberg <andreas.sandberg-1zs4UD6AkMk@public.gmane.org>
Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index f4cb5bd..f337a27 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -1976,11 +1976,17 @@ reset, even if the event specified is not the group leader
 (but see BUGS).
 .TP
 .B PERF_EVENT_IOC_PERIOD
-IOC_PERIOD is the command to update the period; it
-does not update the current period but instead defers until next.
+This updates the overflow period for the event.
+On most architectures the new period does not take effect until 
+after the next overflow happens;
+on ARM since Linux 3.7 the period is updated immediately.
 
 The argument is a pointer to a 64-bit value containing the
 desired new period.
+
+Prior to Linux 2.6.36 this ioctl always failed due to a bug
+in the kernel.
+
 .TP
 .B PERF_EVENT_IOC_SET_OUTPUT
 This tells the kernel to report event notifications to the specified
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
