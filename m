From: Waiman Long <Waiman.Long-ZPxbGqLxI0U@public.gmane.org>
Subject: [PATCH 2/2] futex.7: Add description about the FUTEX_LOCK/FUTEX_UNLOCK operations
Date: Fri, 30 Sep 2016 17:27:44 -0400
Message-ID: <1475270864-51787-3-git-send-email-Waiman.Long@hpe.com>
References: <1475270864-51787-1-git-send-email-Waiman.Long@hpe.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475270864-51787-1-git-send-email-Waiman.Long-ZPxbGqLxI0U@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Davidlohr Bueso <dave-h16yJtLeMjHk1uMJSBkQmQ@public.gmane.org>, Mike Galbraith <umgwanakikbuti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Low <jason.low2-ZPxbGqLxI0U@public.gmane.org>, Scott J Norton <scott.norton-ZPxbGqLxI0U@public.gmane.org>, Douglas Hatch <doug.hatch-ZPxbGqLxI0U@public.gmane.org>, Waiman Long <Waiman.Long-ZPxbGqLxI0U@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The FUTEX_LOCK and FUTEX_UNLOCK operation pair is for supporting the
new throughput-optimized futexes. The futex(7) manpage is extended
to include description about the operations.

Signed-off-by: Waiman Long <Waiman.Long-ZPxbGqLxI0U@public.gmane.org>
---
 man7/futex.7 |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/man7/futex.7 b/man7/futex.7
index 8312c6b..6adf3a2 100644
--- a/man7/futex.7
+++ b/man7/futex.7
@@ -78,6 +78,22 @@ This is done using the
 .B FUTEX_WAIT
 operation.
 .PP
+For implementing just userspace mutexes, a faster
+.B FUTEX_LOCK
+and
+.B FUTEX_UNLOCK
+operation pair can be used instead for SMP systems that support atomic
+compare and exchange instruction.
+To acquire a mutex, atomically compare and exchange the futex from 0 to
+the task's thread ID as returned by the
+.BR gettid (2)
+system call. If that fails, call into kernel using the
+.B FUTEX_LOCK
+operation. To release a mutex, atomically compare and exchange the futex
+from the thread ID to 0. If that fails, call into kernel using the
+.B FUTEX_UNLOCK
+operation.
+.PP
 The
 .BR futex (2)
 system call can optionally be passed a timeout specifying how long
@@ -94,6 +110,11 @@ The same holds for asynchronous futex waiting.
 Initial futex support was merged in Linux 2.5.7
 but with different semantics from those described above.
 Current semantics are available from Linux 2.5.40 onward.
+The
+.B FUTEX_LOCK
+and
+.B FUTEX_UNLOCK
+operation pair support was merged in Linux 4.X.
 .SH NOTES
 .PP
 To reiterate, bare futexes are not intended as an easy-to-use
@@ -116,6 +137,7 @@ primitives; it is by no means the only one.
 .BR clone (2),
 .BR futex (2),
 .BR get_robust_list (2),
+.BR gettid (2),
 .BR set_robust_list (2),
 .BR set_tid_address (2),
 .BR pthreads (7)
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
