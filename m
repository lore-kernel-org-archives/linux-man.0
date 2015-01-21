From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [patch] perf_event_open.2 remove innaccurate paragaph describing
 attr.config
Date: Tue, 20 Jan 2015 22:04:20 -0500 (EST)
Message-ID: <alpine.DEB.2.11.1501202204120.21805@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org


Remove an inaccurate paragraph about values in the attr.config 
field.  This information was never true in any released kernel; 
it somehow snuck into the manpage because it is still described
this way in tools/perf/design.txt in the kernel source tree.

Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index cccb880..003a8b2 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -352,12 +352,6 @@ fields are also taken into account in cases where 64 bits is not
 enough to fully specify the event.
 The encoding of these fields are event dependent.
 
-The most significant bit (bit 63) of
-.I config
-signifies CPU-specific (raw) counter configuration data;
-if the most significant bit is unset, the next 7 bits are an event
-type and the rest of the bits are the event identifier.
