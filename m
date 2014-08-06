From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [PATCH 3/3] perf_event_open.2: document new comm_exec flag
Date: Wed, 6 Aug 2014 14:02:37 -0400 (EDT)
Message-ID: <alpine.DEB.2.11.1408061401400.1325@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org



Linux 3.16 (more specifically, commit 82b897782d10fcc4 )
added support for differentiating between process renames
caused by exec versus those caused by other methods.

Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index d558379..cb15428 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -226,7 +226,8 @@ struct perf_event_attr {
           exclude_callchain_user   : 1,
                                 /* exclude user callchains */
           mmap2          :  1,  /* include mmap with inode data */
-          __reserved_1   : 40;
+          comm_exec      :  1,  /* flag comm events that are due to exec */
+          __reserved_1   : 39;
 
     union {
         __u32 wakeup_events;    /* wakeup every n events */
@@ -861,9 +862,16 @@ bit enables tracking of process command name as modified by the
 .BR exec (2)
 and
 .BR prctl (PR_SET_NAME)
-system calls.
-Unfortunately for tools,
-there is no way to distinguish one system call versus the other.
+system calls as well as writing to
+.IR /proc/self/comm .
+If the additional
+.I comm_exec
+flag can be set (starting with Linux 3.16)
+then the misc flag
+.B PERF_RECORD_MISC_COMM_EXEC
+can be used to differentiate the
+.BR exec (2)
+case from the others.
 .TP
 .IR "freq"
 If this bit is set, then
@@ -988,6 +996,21 @@ The
 .I mmap
 flag must also be set for this to work.
 .TP
+.IR "comm_exec" " (since Linux 3.16)"
+This is purely a feature detection flag, it does not change
+kernel behavior.
+If this flag can successfully be set, then when
+.I comm
+is enabled a
+.B PERF_RECORD_MISC_COMM_EXEC
+flag will be set in the
+.I misc
+field of a comm record header if the rename event being
+reported was caused by a call to
+.BR exec (2).
+This allows tools to distinguish between the various
+types of process renaming.
+.TP
 .IR "wakeup_events" ", " "wakeup_watermark"
 This union sets how many samples
 .RI ( wakeup_events )
@@ -1550,6 +1573,17 @@ In addition, one of the following bits can be set:
 This is set when the mapping is not executable;
 otherwise the mapping is executable.
 .TP
+.B PERF_RECORD_MISC_COMM_EXEC
+This is set for a
+.B PERF_RECORD_COMM
+record on kernels more recent than Linux 3.16
+if a process name change was caused by an
+.BR exec (2)
+system call.
+It is an alias for
+.B PERF_RECORD_MISC_MMAP_DATA
+since the two values would not be set in the same record.
+.TP
 .B PERF_RECORD_MISC_EXACT_IP
 This indicates that the content of
 .B PERF_SAMPLE_IP
@@ -1645,6 +1679,17 @@ struct {
 };
 .fi
 .in
+.RS
+.TP
+.I pid
+is the process id.
+.TP
+.I tid
+is the thread id.
+.TP
+.I comm
+is a string containing the new name of the process.
+.RE
 .TP
 .B PERF_RECORD_EXIT
 This record indicates a process exit event.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
