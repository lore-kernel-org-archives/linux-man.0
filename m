From: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] proc.5: document /proc/[pid]/task/[tid]/children
Date: Tue,  2 Aug 2016 02:25:36 +0200
Message-ID: <1470097536-17377-1-git-send-email-jann@thejh.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Document the /proc/[pid]/task/[tid]/children interface from CRIU, and more
importantly, document why it's usually not a good interface.
---
 man5/proc.5 | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 0970c72..ddb14cc 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -2325,14 +2325,33 @@ the corresponding files under
 .I task/[tid]
 may have different values (e.g., various fields in each of the
 .I task/[tid]/status
-files may be different for each thread).
-
+files may be different for each thread),
+.\" in particular: "children" :/
+or they might not exist in
+.I /proc/[pid]
+at all.
 .\" The following was still true as at kernel 2.6.13
 In a multithreaded process, the contents of the
 .I /proc/[pid]/task
 directory are not available if the main thread has already terminated
 (typically by calling
 .BR pthread_exit (3)).
+
+.TP
+.IR /proc/[pid]/task/[tid]/children " (since Linux 3.5)"
+.\" commit 818411616baf46ceba0cff6f05af3a9b294734f7
+A space-separated list of child tasks of this task.
+Each child task is represented by its TID.
+
+.\" see comments in get_children_pid() in fs/proc/array.c
+This does not work properly if children of the target task exit while
+the file is being read!
+Exiting children may cause non-exiting children to be omitted from
+the list.
+This makes this interface even more unreliable than classic PID-based
+approaches if the inspected task and its children aren't frozen, and
+most code should probably not use this interface.
+
 .TP
 .IR /proc/[pid]/timers " (since Linux 3.10)"
 .\" commit 5ed67f05f66c41e39880a6d61358438a25f9fee5
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
