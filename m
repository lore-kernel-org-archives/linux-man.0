From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [PATCH 3/4] perf_event_open.2 Linux 3.12 PERF_EVENT_IOC_ID
Date: Wed, 6 Nov 2013 13:31:58 -0500 (EST)
Message-ID: <alpine.DEB.2.10.1311061330470.26649@vincent-weaver-1.um.maine.edu>
References: <alpine.DEB.2.10.1311061324070.26649@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.10.1311061324070.26649-6xBS8L8d439fDsnSvq7Uq4Se7xf15W0s1dQoKJhdanU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


A new perf_event related ioctl, PERF_EVENT_IOC_ID, was added
in Linux 3.12.

Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>


diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 4ff9690..a443b6e 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -2000,6 +2160,12 @@ output should be ignored.
 This adds an ftrace filter to this event.
 
 The argument is a pointer to the desired ftrace filter.
+.TP
+.BR PERF_EVENT_IOC_ID " (Since Linux 3.12)"
+Returns the event ID value for the given event fd.
+
+The argument is a pointer to a 64-bit unsigned integer
+to hold the result.
 .SS Using prctl
 A process can enable or disable all the event groups that are
 attached to it using the
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
