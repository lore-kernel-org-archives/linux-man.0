From: Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 2/2] perf_event_open.2: Document the interaction of perf
 counters and execve
Date: Tue, 27 Dec 2016 16:52:41 -0500
Message-ID: <20161227215241.GA1214@juliacomputing.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man2/perf_event_open.2 | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 65239e6..ad2c596 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -1338,6 +1338,43 @@ includes
 .BR PERF_SAMPLE_CALLCHAIN ,
 this field specifies how many stack frames to report when
 generating the callchain.
+.SS Interaction with execve(2)
+It is important to separate the consideration of a file descriptor obtained
+from
+.BR perf_event_open
+and that of the underlying performance counters. The two may be, but often
+aren't, associated with the same task. With the exception of the
+.BR PERF_FLAG_FD_CLOEXEC
+flag (see above) there is nothing special about the file descriptors, so this
+section will discuss the underlying performance counters.
+
+When
+.BR perf_event_open
+is called, in addition to the file descriptor, the underlying performance counters
+are created and associated with each thread in the specified process's thread group.
+This association ends whenever the task exits, but generally persists across
+.BR execve(2)
+(unless of course, the execve causes the last file descriptor referencing these counters
+to close). However, for security reasons, the association is broken if the
+.BR execve(2)
+causes the task's "dumpable", flag to be reset (see
+.BR prctl(2)
+).
+
+If the
+.IR inherit
+option is specified, new children of any task already associated with these performance counters,
+will inherit this association.
+
+Once all associations are broken, no further events are counted. However, the file descriptor
+will not indicate this condition through an error return
+(i.e.
+.BR read(2)
+and
+.BR mmap(2)
+will still succeed
+).
+
 .SS Reading results
 Once a
 .BR perf_event_open ()
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
