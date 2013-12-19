From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [patch] perf_event_open.c : clarify issues with the exclusive bit
Date: Thu, 19 Dec 2013 12:09:29 -0500 (EST)
Message-ID: <alpine.DEB.2.10.1312191206260.29792@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org


Warn that using the perf_event_open "exclusive" bit, while it might seem 
like a good idea, might lead to all 0 results in some common usage cases.

Reported-by: Sudhanshu Goswami <Sudhanshu.Goswami-mb1K0bWo544@public.gmane.org>
Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 6d42c41..ebda700 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -775,6 +775,13 @@ it should be the only group using the CPU's counters.
 In the future this may allow monitoring programs to
 support PMU features that need to run alone so that they do not
 disrupt other hardware counters.
+
+Note that many unexpected situations may prevent events with the
+.I exclusive
+bit set from ever running.  
+This includes any users running a system-wide
+measurement as well as any kernel use of the performance counters 
+(including the commonly enabled NMI Watchdog Timer interface).
 .TP
 .IR "exclude_user"
 If this bit is set, the count excludes events that happen in user space.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
