From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 2/2] clone.2, confstr.3, hpsa.4, tcp.7: tfix
Date: Tue,  7 Jun 2016 11:19:24 +0200
Message-ID: <1465291164-5486-2-git-send-email-jwilk@jwilk.net>
References: <1465291164-5486-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465291164-5486-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/clone.2   | 2 +-
 man3/confstr.3 | 4 ++--
 man4/hpsa.4    | 2 +-
 man7/tcp.7     | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/man2/clone.2 b/man2/clone.2
index 78f6db3..0318258 100644
--- a/man2/clone.2
+++ b/man2/clone.2
@@ -238,7 +238,7 @@ If this flag is not set, then (as with
 the new process has its own I/O context.
 
 .\" The following based on text from Jens Axboe
-The I/O context is the I/O scope of the disk scheduler (i.e,
+The I/O context is the I/O scope of the disk scheduler (i.e.,
 what the I/O scheduler uses to model scheduling of a process's I/O).
 If processes share the same I/O context,
 they are treated as one by the I/O scheduler.
diff --git a/man3/confstr.3 b/man3/confstr.3
index 6263daf..5bb75f1 100644
--- a/man3/confstr.3
+++ b/man3/confstr.3
@@ -57,11 +57,11 @@ The following variables are supported:
 .TP
 .BR _CS_GNU_LIBC_VERSION " (GNU C library only; since glibc 2.3.2)"
 A string which identifies the GNU C library version on this system
-(e.g, "glibc 2.3.4").
+(e.g., "glibc 2.3.4").
 .TP
 .BR _CS_GNU_LIBPTHREAD_VERSION " (GNU C library only; since glibc 2.3.2)"
 A string which identifies the POSIX implementation supplied by this
-C library (e.g, "NPTL 2.3.4" or "linuxthreads-0.10").
+C library (e.g., "NPTL 2.3.4" or "linuxthreads-0.10").
 .TP
 .B _CS_PATH
 A value for the
diff --git a/man4/hpsa.4 b/man4/hpsa.4
index 6ca1537..5405b0d 100644
--- a/man4/hpsa.4
+++ b/man4/hpsa.4
@@ -80,7 +80,7 @@ respectively.
 .I /sys/class/scsi_host/host*/rescan
 This is a write-only attribute.
 Writing to this attribute will cause the driver to scan for
-new, changed, or removed devices (e.g,. hot-plugged tape drives,
+new, changed, or removed devices (e.g., hot-plugged tape drives,
 or newly configured or deleted logical drives, etc.)
 and notify the SCSI midlayer of any changes detected.
 Normally a rescan is triggered automatically
diff --git a/man7/tcp.7 b/man7/tcp.7
index 56660b0..89f2b22 100644
--- a/man7/tcp.7
+++ b/man7/tcp.7
@@ -478,7 +478,7 @@ supporting just values 0 and 1 above.
 .TP
 .IR tcp_frto_response " (integer; default: 0; since Linux 2.6.22)"
 When F-RTO has detected that a TCP retransmission timeout was spurious
-(i.e, the timeout would have been avoided had TCP set a
+(i.e., the timeout would have been avoided had TCP set a
 longer retransmission timeout),
 TCP has several options concerning what to do next.
 Possible values are:
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
