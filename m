From: Alex Thorlton <athorlton-sJ/iWh9BUns@public.gmane.org>
Subject: [PATCH] prctl.2: Add PR_GET/SET_THP_DISABLED information
Date: Tue, 25 Feb 2014 15:20:33 -0600
Message-ID: <64a0db7fc5c6250a01878c6d3b3dee4a2430e687.1393354819.git.athorlton@sgi.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alex Thorlton <athorlton-sJ/iWh9BUns@public.gmane.org>, Gerald Schaefer <gerald.schaefer-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, Martin Schwidefsky <schwidefsky-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, Heiko Carstens <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, Christian Borntraeger <borntraeger-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Paolo Bonzini <pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Kirill A. Shutemov" <kirill.shutemov-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mel Gorman <mgorman-l3A5Bk7waGM@public.gmane.org>, Rik van Riel <riel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Alexander Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This patch adds documentation for the new prctl option to disable
transparent hugepages on a per-mm_struct basis.  The patch that
implements this functionality can be found here:

http://www.mail-archive.com/linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg595756.html

(Note that the patch hasn't made it through into the community
 kernel, yet.  I'm submitting the documentation ahead of time
 to make sure that everything is in order if/when the patch
 makes it into the kernel.)

Please let me know if you notice anything that should be changed
or added.  Thanks!

Signed-off-by: Alex Thorlton <athorlton-sJ/iWh9BUns@public.gmane.org>
Cc: Gerald Schaefer <gerald.schaefer-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
Cc: Martin Schwidefsky <schwidefsky-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
Cc: Heiko Carstens <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
Cc: Christian Borntraeger <borntraeger-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Paolo Bonzini <pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Kirill A. Shutemov" <kirill.shutemov-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Mel Gorman <mgorman-l3A5Bk7waGM@public.gmane.org>
Cc: Rik van Riel <riel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
Cc: Alexander Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

---
 man2/prctl.2 | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/man2/prctl.2 b/man2/prctl.2
index 70636e5..1588064 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -773,6 +773,23 @@ option.
 .\" symbolic-link transitions over all process running in a system.
 .\" ========== END FIXME
 .RE
+.TP
+.BR PR_SET_THP_DISABLED " (since Linux 3.14)"
+If 
+.IR arg2
+is nonzero, set the "disable transparent hugepages" attribute of the calling process.
+Hugepages are disabled by manipulating the
+.BR VM_NOHUGEPAGE
+flag in
+.I def_flags
+of a process's
+.IR mm_struct .
+This flag is carried down from the parent's
+.IR mm_struct
+on fork.
+.TP
+.BR PR_GET_THP_DISABLED " (since Linux 3.14)"
+Returns (as the function result) the state of the "disable transparent hugepages" attribute of the calling process.  The result will be 1 if the attribute is set and 0 otherwise.
 .\"
 .SH RETURN VALUE
 On success,
@@ -783,6 +800,7 @@ On success,
 .BR PR_GET_TIMING ,
 .BR PR_GET_SECUREBITS ,
 .BR PR_MCE_KILL_GET ,
+.BR PR_GET_THP_DISABLED ,
 and (if it returns)
 .BR PR_GET_SECCOMP
 return the nonnegative values described above.
@@ -806,11 +824,12 @@ is not recognized.
 .B EINVAL
 .I option
 is
-.BR PR_MCE_KILL
-or
-.BR PR_MCE_KILL_GET
-or
+.BR PR_MCE_KILL ,
+.BR PR_MCE_KILL_GET ,
 .BR PR_SET_MM ,
+.BR PR_SET_THP_DISABLE
+or
+.BR PR_GET_THP_DISABLE ,
 and unused
 .BR prctl ()
 arguments were not specified as zero.
-- 
1.7.12.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
