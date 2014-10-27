From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] pid_namespaces(7): minor grammar tweaks
Date: Mon, 27 Oct 2014 16:42:53 -0400
Message-ID: <1414442573-19334-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man7/pid_namespaces.7 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man7/pid_namespaces.7 b/man7/pid_namespaces.7
index db6618a..2090101 100644
--- a/man7/pid_namespaces.7
+++ b/man7/pid_namespaces.7
@@ -128,7 +128,7 @@ and so will result in the usual actions associated with those signals
 
 Starting with Linux 3.4, the
 .BR reboot (2)
-system causes a signal to be sent to the namespace "init" process.
+system call causes a signal to be sent to the namespace "init" process.
 See
 .BR reboot (2)
 for more details.
@@ -154,7 +154,7 @@ In this context, "visible" means that one process
 can be the target of operations by another process using
 system calls that specify a process ID.
 Conversely, the processes in a child PID namespace can't see
-processes in the parent and further removed ancestor namespace.
+processes in the parent and further removed ancestor namespaces.
 More succinctly: a process can see (e.g., send signals with
 .BR kill (2),
 set nice values with
@@ -243,7 +243,7 @@ will defeat that.
 .BR CLONE_VM
 requires all of the threads to be in the same PID namespace,
 because, from the point of view of a core dump,
-if two processes share the same address space they are threads and will
+if two processes share the same address space then they are threads and will
 be core dumped together.
 When a core dump is written, the PID of each
 thread is written into the core dump.
-- 
2.1.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
