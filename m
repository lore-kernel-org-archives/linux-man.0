From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: perf_event_open.2 : fix indentation of the MMAP layout section
Date: Thu, 25 Jul 2013 22:38:35 -0400 (EDT)
Message-ID: <alpine.DEB.2.10.1307252238220.27580@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


The indentation of the MMAP layout section wasn't quite right.
I think this improves things but I admit I'm not an expert at the
low-level indentation directives.

Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index b1a7114..20e2d71 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -1749,8 +1749,8 @@ Sample happened in the guest kernel.
 Sample happened in guest user code.
 .RE
 
-In addition, one of the following bits can be set:
 .RS
+In addition, one of the following bits can be set:
 .TP
 .B PERF_RECORD_MISC_MMAP_DATA
 This is set when the mapping is not executable;
@@ -1766,6 +1766,7 @@ See also
 .TP
 .B PERF_RECORD_MISC_EXT_RESERVED
 This indicates there is extended data available (currently not used).
+.RE
 .TP
 .I size
 This indicates the size of the record.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
