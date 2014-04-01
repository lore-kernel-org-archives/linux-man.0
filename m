From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [patch v2] perf_event_open.2 : document PERF_FLAG_FD_CLOEXEC flag
Date: Tue, 1 Apr 2014 17:36:23 -0400 (EDT)
Message-ID: <alpine.DEB.2.10.1404011734320.17339@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org


The Linux 3.14 release adds support for the PERF_FLAG_FD_CLOEXEC flag to
perf_event_open.2

This version tries to clarify that the close-on-exec behavior applies to 
the current file descriptor being created.

The wording is based on the description in kernel commit
a21b0b354d4ac39be691f51c53562e2c24443d9e 
by Yann Droneaud <ydroneaud-RlY5vtjFyJ3QT0dZR+AlfA@public.gmane.org>

Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 30a2168..b4a49c4 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -164,6 +164,19 @@ must be passed as the
 parameter.
 cgroup monitoring is available only
 for system-wide events and may therefore require extra permissions.
+.TP
+.BR PERF_FLAG_FD_CLOEXEC " (since Linux 3.14)."
+This flag enables close-on-exec behavior for the created
+event file descriptor, removing it from the list of
+file descriptors inherited across exec.
+Setting this behavior atomically at creation time rather than
+later with
+.BR fctl (2)
+avoids potential race conditions between the current thread and
+another calling
+.BR fork (2)
+then
+.BR execve(2).
 .P
 The
 .I perf_event_attr
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
