From: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Subject: EDQUOT and disk quotas
Date: Wed, 15 Sep 2010 22:39:06 +0100 (BST)
Message-ID: <alpine.LNX.2.01.1009152216280.4667@fgnk.ybpnyqbznva>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

I noticed that the return error EDQUOT is not documented in open(2), 
write(2), symlink(2) etc.. Here's a patch for review.

Whether inodes or disk blocks are required for each function is something 
I based on received wisdom, rather than tracing the code to the kernel. 
For symlink(2) this certainly depends on the file system type.

I'm no filesystem expert; perhaps it would be better to avoid the detail 
and use "the user's quota of resources on the file system has been 
exhausted"?

Documentation for ENOSPC tends to be vague, along the lines of "no room 
for the data". Including detail for EDQUOT probably means it should be 
also included there.

-- 
Mark

---
 man2/link.2    |    3 +++
 man2/mkdir.2   |    4 ++++
 man2/mknod.2   |    4 ++++
 man2/open.2    |    5 +++++
 man2/rename.2  |    3 +++
 man2/symlink.2 |    5 +++++
 man2/write.2   |    6 ++++++
 man3/mkfifo.3  |    4 ++++
 8 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/man2/link.2 b/man2/link.2
index 0f17c3d..2395a83 100644
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
index 43accb5..d161b57 100644
--- a/man2/mknod.2
+++ b/man2/mknod.2
@@ -107,6 +107,10 @@ did not allow search permission.
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
index a2fef47..76c547a 100644
--- a/man2/open.2
+++ b/man2/open.2
@@ -466,6 +466,11 @@ is not allowed.
 (See also
 .BR path_resolution (7).)
 .TP
+.B EDQUOT
+.B O_CREAT
+is specified, the file does not exist, and the user's quota of disk
+blocks or inodes on the file system has been exhausted.
+.TP
 .B EEXIST
 .I pathname
 already exists and
diff --git a/man2/rename.2 b/man2/rename.2
index c88ca69..de1b073 100644
--- a/man2/rename.2
+++ b/man2/rename.2
@@ -131,6 +131,9 @@ but it is allowed to return
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
index 935ef86..a2e4b80 100644
--- a/man2/symlink.2
+++ b/man2/symlink.2
@@ -94,6 +94,11 @@ did not allow search permission.
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
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
