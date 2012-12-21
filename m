From: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Subject: [PATCH] Document return of EDQUOT where applicable
Date: Fri, 21 Dec 2012 15:01:53 +0000
Message-ID: <1356102113-2236-1-git-send-email-mark@pogo.org.uk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The return error EDQUOT is not documented in open(2), write(2),
symlink(2) etc..

Whether inodes or disk blocks are required for each function is something
I based on received wisdom and BSD documentation, rather than tracing the
code to the kernel. For symlink(2) this certainly depends on the file
system type.

This patch was previously sent to the linux-man mailing list as an RFC in
September 2010.

Signed-off-by: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
---
 man2/link.2    | 3 +++
 man2/mkdir.2   | 4 ++++
 man2/mknod.2   | 4 ++++
 man2/open.2    | 6 ++++++
 man2/rename.2  | 3 +++
 man2/symlink.2 | 5 +++++
 man2/write.2   | 6 ++++++
 man3/mkfifo.3  | 4 ++++
 8 files changed, 35 insertions(+)

diff --git a/man2/link.2 b/man2/link.2
index 4de8fb5..70ed9df 100644
--- a/man2/link.2
+++ b/man2/link.2
@@ -67,6 +67,9 @@ or
 (See also
 .BR path_resolution (7).)
 .TP
+.B EDQUOT
+The user's quota of disk blocks on the file system has been exhausted.
+.TP
 .B EEXIST
 .I newpath
 already exists.
diff --git a/man2/mkdir.2 b/man2/mkdir.2
index 371f06b..9a1f505 100644
--- a/man2/mkdir.2
+++ b/man2/mkdir.2
@@ -59,6 +59,10 @@ did not allow search permission.
 (See also
 .BR path_resolution (7).)
 .TP
+.B EDQUOT
+The user's quota of disk blocks or inodes on the file system has been
+exhausted.
+.TP
 .B EEXIST
 .I pathname
 already exists (not necessarily as a directory).
diff --git a/man2/mknod.2 b/man2/mknod.2
index ff55813..98d00ab 100644
--- a/man2/mknod.2
+++ b/man2/mknod.2
@@ -112,6 +112,10 @@ did not allow search permission.
 (See also
 .BR path_resolution (7).)
 .TP
+.B EDQUOT
+The user's quota of disk blocks or inodes on the file system has been
+exhausted.
+.TP
 .B EEXIST
 .I pathname
 already exists.
diff --git a/man2/open.2 b/man2/open.2
index f9a63e9..ae87566 100644
--- a/man2/open.2
+++ b/man2/open.2
@@ -480,6 +480,12 @@ is not allowed.
 (See also
 .BR path_resolution (7).)
 .TP
+.B EDQUOT
+Where
+.B O_CREAT
+is specified, the file does not exist, and the user's quota of disk
+blocks or inodes on the file system has been exhausted.
+.TP
 .B EEXIST
 .I pathname
 already exists and
diff --git a/man2/rename.2 b/man2/rename.2
index 917050d..2c7a251 100644
--- a/man2/rename.2
+++ b/man2/rename.2
@@ -131,6 +131,9 @@ it is allowed to return
 if the system cannot otherwise
 handle such situations.)
 .TP
+.B EDQUOT
+The user's quota of disk blocks on the file system has been exhausted.
+.TP
 .B EFAULT
 .IR oldpath " or " newpath " points outside your accessible address space."
 .TP
diff --git a/man2/symlink.2 b/man2/symlink.2
index 93f2871..ac4e646 100644
--- a/man2/symlink.2
+++ b/man2/symlink.2
@@ -97,6 +97,11 @@ did not allow search permission.
 (See also
 .BR path_resolution (7).)
 .TP
+.B EDQUOT
+The user's quota of resources on the file system has been exhausted.
+The resources could be inodes or disk blocks, dependending on the file
+system implementation.
+.TP
 .B EEXIST
 .I newpath
 already exists.
diff --git a/man2/write.2 b/man2/write.2
index 8abcc57..bde6c4b 100644
--- a/man2/write.2
+++ b/man2/write.2
@@ -133,6 +133,12 @@ is not a valid file descriptor or is not open for writing.
 refers to a datagram socket for which a peer address has not been set using
 .BR connect (2).
 .TP
+.B EDQUOT
+The user's quota of disk blocks on the file system containing the file
+referred to by
+.I fd
+has been exhausted.
+.TP
 .B EFAULT
 .I buf
 is outside your accessible address space.
diff --git a/man3/mkfifo.3 b/man3/mkfifo.3
index 35b46b5..5584ab5 100644
--- a/man3/mkfifo.3
+++ b/man3/mkfifo.3
@@ -70,6 +70,10 @@ is set appropriately).
 One of the directories in \fIpathname\fP did not allow search
 (execute) permission.
 .TP
+.B EDQUOT
+The user's quota of disk blocks or inodes on the file system has been
+exhausted.
+.TP
 .B EEXIST
 \fIpathname\fP already exists.
 This includes the case where
-- 
1.7.12.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
