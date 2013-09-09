From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] cpuset.7, initrd.7, pipe.7, symlink.2: filesystem in one word
Date: Tue, 10 Sep 2013 01:14:19 +0200
Message-ID: <1378768459-6143-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

More s/file system/filesystem/ but multiligne (see 9ee4a2b6)
---
 man2/symlink.2 |    4 ++--
 man4/initrd.4  |    4 ++--
 man7/cpuset.7  |    4 ++--
 man7/pipe.7    |    4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/man2/symlink.2 b/man2/symlink.2
index 8f43cbf..ffebf14 100644
--- a/man2/symlink.2
+++ b/man2/symlink.2
@@ -99,8 +99,8 @@ did not allow search permission.
 .TP
 .B EDQUOT
 The user's quota of resources on the filesystem has been exhausted.
-The resources could be inodes or disk blocks, depending on the file
-system implementation.
+The resources could be inodes or disk blocks, depending on the filesystem
+implementation.
 .TP
 .B EEXIST
 .I newpath
diff --git a/man4/initrd.4 b/man4/initrd.4
index 03b91b2..6d0f058 100644
--- a/man4/initrd.4
+++ b/man4/initrd.4
@@ -353,8 +353,8 @@ sets
 .IR /proc/sys/kernel/real-root-dev ,
 unmount
 .IR /proc ,
-the normal root filesystem and any other file
-systems it has mounted, and then terminates.
+the normal root filesystem and any other filesystems
+it has mounted, and then terminates.
 .IP 6.
 The kernel then mounts the normal root filesystem.
 .IP 7.
diff --git a/man7/cpuset.7 b/man7/cpuset.7
index e3c63df..c16a72d 100644
--- a/man7/cpuset.7
+++ b/man7/cpuset.7
@@ -46,8 +46,8 @@ the administrator can configure the cpusets on a system
 to control the processor and memory placement of processes
 on that system.
 By default, if the cpuset configuration
-on a system is not modified or if the cpuset file
-system is not even mounted, then the cpuset mechanism,
+on a system is not modified or if the cpuset filesystem
+is not even mounted, then the cpuset mechanism,
 though present, has no affect on the system's behavior.
 .PP
 A cpuset defines a list of CPUs and memory nodes.
diff --git a/man7/pipe.7 b/man7/pipe.7
index 5cce716..78d1cea 100644
--- a/man7/pipe.7
+++ b/man7/pipe.7
@@ -45,8 +45,8 @@ processes; see
 .BR pipe (2)
 for an example.
 
-A FIFO (short for First In First Out) has a name within the file
-system (created using
+A FIFO (short for First In First Out) has a name within the filesystem
+(created using
 .BR mkfifo (3)),
 and is opened using
 .BR open (2).
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
