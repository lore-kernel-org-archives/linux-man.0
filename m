From: Wieland Hoffmann <themineo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] namespaces.7: tfix: CLONE_IPC -> CLONE_NEWIPC
Date: Sun, 21 Sep 2014 22:50:35 +0200
Message-ID: <1411332635-11983-1-git-send-email-themineo@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wieland Hoffmann <themineo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

CLONE_NEWIPC is the correct constant, as can be seen in the detailed
list of namespaces & their corresponding constants, as well as the
clone(2) man page and include/uapi/linux/sched.h in the Linux source tree.
---
 man7/namespaces.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/namespaces.7 b/man7/namespaces.7
index 931d038..d14d258 100644
--- a/man7/namespaces.7
+++ b/man7/namespaces.7
@@ -41,7 +41,7 @@ Linux provides the following namespaces:
 lB lB lB
 l lB l.
 Namespace	Constant	Isolates
-IPC	CLONE_IPC	System V IPC, POSIX message queues
+IPC	CLONE_NEWIPC	System V IPC, POSIX message queues
 Network	CLONE_NEWNET	Network devices, stacks, ports, etc.
 Mount	CLONE_NEWNS	Mount points
 PID	CLONE_NEWPID	Process IDs
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
