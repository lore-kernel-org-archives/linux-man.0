From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [patch] small flags clarficiation in perf_event_open()
Date: Mon, 20 May 2013 13:11:02 -0400 (EDT)
Message-ID: <alpine.DEB.2.02.1305201309150.29892@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


While using the perf_event_open() manpage to enhance the trinity fuzzer
I noticed the statement about the "flags" argument was misleading.

Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index f3850f0..14fb854 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -148,7 +148,9 @@ instructions.
 .P
 The
 .I flags
-argument takes one of the following values:
+argument takes a 
+.RI bitwise- or 'd
+combination of zero or more of the following values:
 .TP
 .BR PERF_FLAG_FD_NO_GROUP
 .\" FIXME The following sentence is unclear
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
