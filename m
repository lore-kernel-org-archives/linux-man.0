From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] behaviour: use American spelling behavior instead
Date: Mon, 16 Jun 2014 22:25:04 +0200
Message-ID: <1402950304-26033-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/eventfd.2   | 2 +-
 man2/fallocate.2 | 2 +-
 man2/open.2      | 2 +-
 man2/sendmmsg.2  | 2 +-
 man2/signalfd.2  | 2 +-
 man5/proc.5      | 4 ++--
 man7/sched.7     | 2 +-
 man7/socket.7    | 2 +-
 man7/udplite.7   | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/man2/eventfd.2 b/man2/eventfd.2
index e4fb639..6a251fa 100644
--- a/man2/eventfd.2
+++ b/man2/eventfd.2
@@ -39,7 +39,7 @@ This counter is initialized with the value specified in the argument
 
 The following values may be bitwise ORed in
 .IR flags
-to change the behaviour of
+to change the behavior of
 .BR eventfd ():
 .TP
 .BR EFD_CLOEXEC " (since Linux 2.6.27)"
diff --git a/man2/fallocate.2 b/man2/fallocate.2
index fa2703c..d716db9 100644
--- a/man2/fallocate.2
+++ b/man2/fallocate.2
@@ -211,7 +211,7 @@ the behavior of the call is similar,
 but the file size will not be changed even if
 .IR offset + len
 is greater than the file size.
-This behaviour is the same as when preallocating space with
+This behavior is the same as when preallocating space with
 .B FALLOC_FL_KEEP_SIZE
 specified.
 
diff --git a/man2/open.2 b/man2/open.2
index 475d9e4..9d2bc87 100644
--- a/man2/open.2
+++ b/man2/open.2
@@ -1424,7 +1424,7 @@ Likewise, applications should avoid mixing
 .BR mmap (2)
 of files with direct I/O to the same files.
 .LP
-The behaviour of
+The behavior of
 .B O_DIRECT
 with NFS will differ from local filesystems.
 Older kernels, or
diff --git a/man2/sendmmsg.2 b/man2/sendmmsg.2
index 2e88683..e3a6214 100644
--- a/man2/sendmmsg.2
+++ b/man2/sendmmsg.2
@@ -140,7 +140,7 @@ An error is returned only if no datagrams could be sent.
 .\"     must retry starting at the first failed one and if the problem is
 .\"     persistent the error will be returned.
 .\"
-.\"     This matches the behaviour of other syscalls like read/write - it
+.\"     This matches the behavior of other syscalls like read/write - it
 .\"     is not an error if less than the requested number of elements are sent.
 .SH VERSIONS
 The
diff --git a/man2/signalfd.2 b/man2/signalfd.2
index 6102a98..b48a7ee 100644
--- a/man2/signalfd.2
+++ b/man2/signalfd.2
@@ -72,7 +72,7 @@ is used to replace the signal set associated with that descriptor.
 
 Starting with Linux 2.6.27, the following values may be bitwise ORed in
 .IR flags
-to change the behaviour of
+to change the behavior of
 .BR signalfd ():
 .TP 14
 .B SFD_NONBLOCK
diff --git a/man5/proc.5 b/man5/proc.5
index 1a91c21..2e4fae0 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -2844,7 +2844,7 @@ The minimum value that can be assigned to this file is the system page size.
 .\" commit 800179c9b8a1e796e441674776d11cd4c05d61d7
 When the value in this file is 0,
 no restrictions are placed on the creation of hard links
-(i.e., this is the historical behaviour before Linux 3.6).
+(i.e., this is the historical behavior before Linux 3.6).
 When the value in this file is 1,
 a hard link can be created to a target file
 only if one of the following conditions is true:
@@ -2894,7 +2894,7 @@ the administrator, or linking to special files.
 .\" commit 800179c9b8a1e796e441674776d11cd4c05d61d7
 When the value in this file is 0,
 no restrictions are placed on following symbolic links
-(i.e., this is the historical behaviour before Linux 3.6).
+(i.e., this is the historical behavior before Linux 3.6).
 When the value in this file is 1, symbolic links are followed only
 in the following circumstances:
 .RS
diff --git a/man7/sched.7 b/man7/sched.7
index 8eeecd9..bb9382d 100644
--- a/man7/sched.7
+++ b/man7/sched.7
@@ -380,7 +380,7 @@ The difference is that this policy
 will cause the scheduler to always assume
 that the thread is CPU-intensive.
 Consequently, the scheduler will apply a small scheduling
-penalty with respect to wakeup behaviour,
+penalty with respect to wakeup behavior,
 so that this thread is mildly disfavored in scheduling decisions.
 
 .\" The following paragraph is drawn largely from the text that
diff --git a/man7/socket.7 b/man7/socket.7
index 36ff715..c21d331 100644
--- a/man7/socket.7
+++ b/man7/socket.7
@@ -562,7 +562,7 @@ when it is set using
 and this doubled value is returned by
 .BR getsockopt (2).
 .\" The following thread on LMKL is quite informative:
-.\" getsockopt/setsockopt with SO_RCVBUF and SO_SNDBUF "non-standard" behaviour
+.\" getsockopt/setsockopt with SO_RCVBUF and SO_SNDBUF "non-standard" behavior
 .\" 17 July 2012
 .\" http://thread.gmane.org/gmane.linux.kernel/1328935
 The default value is set by the
diff --git a/man7/udplite.7 b/man7/udplite.7
index b951c10..1e279e2 100644
--- a/man7/udplite.7
+++ b/man7/udplite.7
@@ -53,7 +53,7 @@ in using a different IP protocol identifier (IANA number 136).
 
 The UDP-Lite implementation is a full extension of
 .BR udp (7)\(emthat
-is, it shares the same API and API behaviour, and in addition
+is, it shares the same API and API behavior, and in addition
 offers two socket options to control the checksum coverage.
 .SS Address format
 UDP-Litev4 uses the
-- 
2.0.0.rc2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
