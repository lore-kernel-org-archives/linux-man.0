From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [patch] perf_event_open.c : clarify issues with the disabled bit
Date: Thu, 19 Dec 2013 17:04:39 -0500 (EST)
Message-ID: <alpine.DEB.2.10.1312191703290.32451@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org


Clarify the perf_event_open behavior with respect to the disabled
bit and creating event groups.

Reported-by: Sudhanshu Goswami <Sudhanshu.Goswami-mb1K0bWo544@public.gmane.org>
Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 6d42c41..f5de495 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -739,6 +739,17 @@ If disabled, the event can later be enabled by
 .BR prctl (2),
 or
 .IR enable_on_exec .
+
+When creating an event group, typically the group leader is initialized
+with
+.I disabled
+set to 1 and any child events are initialized with
+.I disabled
+set to 0.
+Despite
+.I disabled
+being 0, the child events will not start until the group leader
+is enabled.
 .TP
 .IR "inherit"
 The
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
