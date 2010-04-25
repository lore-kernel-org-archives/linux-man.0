From: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Subject: [PATCH 1/3] getrusage.2: Description of maintained fields
Date: Sun, 25 Apr 2010 21:42:31 +0100
Message-ID: <1272228153-11825-2-git-send-email-mark@pogo.org.uk>
References: <1272228153-11825-1-git-send-email-mark@pogo.org.uk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1272228153-11825-1-git-send-email-mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

These descriptions are taken from NetBSD 5.0's getrusage(2).

Signed-off-by: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
---
 man2/getrusage.2 |   69 +++++++++++++++++++++++++++++++++++++++--------------
 1 files changed, 51 insertions(+), 18 deletions(-)

diff --git a/man2/getrusage.2 b/man2/getrusage.2
index 2771817..6ffdce2 100644
--- a/man2/getrusage.2
+++ b/man2/getrusage.2
@@ -89,6 +89,57 @@ struct rusage {
 };
 .fi
 .in
+.PP
+Not all fields are completed; unmaintained fields are set to zero by
+the kernel. The fields are interpreted as follows:
+.TP
+.I ru_utime
+the total amount of time spent executing in user mode.
+.TP
+.I ru_stime
+the total amount of time spent in the system executing on behalf
+of the process(es).
+.TP
+.IR ru_maxrss " (unmaintained)"
+.TP
+.IR ru_ixrss " (unmaintained)"
+.TP
+.IR ru_idrss " (unmaintained)"
+.TP
+.IR ru_isrss " (unmaintained)"
+.TP
+.I ru_minflt
+the number of page faults serviced without any I/O activity; here
+I/O activity is avoided by \*(lqreclaiming\*(rq a page frame from
+the list of pages awaiting reallocation.
+.TP
+.I ru_majflt
+the number of page faults serviced that required I/O activity.
+.TP
+.IR ru_nswap  " (unmaintained)"
+.TP
+.IR ru_inblock " (since Linux 2.6.22)"
+the number of times the file system had to perform input.
+.TP
+.IR ru_oublock " (since Linux 2.6.22)"
+the number of times the file system had to perform output.
+.TP
+.IR ru_msgsnd " (unmaintained)"
+.TP
+.IR ru_msgrcv " (unmaintained)"
+.TP
+.IR ru_nsignals " (unmaintained)"
+.TP
+.IR ru_nvcsw " (since Linux 2.6)"
+the number of times a context switch resulted due to a process
+voluntarily giving up the processor before its time slice was
+completed (usually to await availability of a resource).
+.TP
+.IR ru_nivcsw " (since Linux 2.6)"
+the number of times a context switch resulted due to a higher
+priority process becoming runnable or because the current process
+exceeded its time slice.
+.PP
 .SH "RETURN VALUE"
 On success, zero is returned.
 On error, \-1 is returned, and
@@ -140,24 +191,6 @@ This nonconformance is rectified in Linux 2.6.9 and later.
 .LP
 The structure definition shown at the start of this page
 was taken from 4.3BSD Reno.
-Not all fields are meaningful under Linux.
-In Linux 2.4 only the fields
-.IR ru_utime ,
-.IR ru_stime ,
-.IR ru_minflt ,
-and
-.I ru_majflt
-are maintained.
-Since Linux 2.6,
-.I ru_nvcsw
-and
-.I ru_nivcsw
-are also maintained.
-Since Linux 2.6.22,
-.I ru_inblock
-and
-.I ru_oublock
-are also maintained.
 
 See also the description of
 .IR /proc/PID/stat
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
