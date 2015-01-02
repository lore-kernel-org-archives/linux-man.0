From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] setns/pid_namespaces: mention the pid ns descendant limitation more
Date: Fri,  2 Jan 2015 13:04:42 -0500
Message-ID: <1420221882-12614-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The setns(2) man page already mentions that CLONE_NEWPID may only be
used with descendant namespaces, but this nuance could be listed in
a few more places so it is not missed.

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man2/setns.2          |  7 ++++++-
 man7/pid_namespaces.7 | 10 ++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/man2/setns.2 b/man2/setns.2
index 926842b..3e6c4a5 100644
--- a/man2/setns.2
+++ b/man2/setns.2
@@ -55,7 +55,7 @@ must refer to a mount namespace.
 .TP
 .BR CLONE_NEWPID " (since Linux 3.8)"
 .I fd
-must refer to a PID namespace.
+must refer to a descendant PID namespace.
 .TP
 .BR CLONE_NEWUSER " (since Linux 3.8)"
 .I fd
@@ -157,6 +157,11 @@ refers to a namespace whose type does not match that specified in
 There is problem with reassociating
 the thread with the specified namespace.
 .TP
+.\" See kernel/pid_namespace.c::pidns_install() [kernel 3.18 sources]
+.B EINVAL
+The caller tried to join an ancestor (parent, grandparent, etc...)
+pid namespace.
+.TP
 .B EINVAL
 The caller attempted to join the user namespace
 in which it is already a member.
diff --git a/man7/pid_namespaces.7 b/man7/pid_namespaces.7
index 8582da3..89c606b 100644
--- a/man7/pid_namespaces.7
+++ b/man7/pid_namespaces.7
@@ -188,6 +188,16 @@ PID namespace from the caller of
 Calls to
 .BR getppid (2)
 for such processes return 0.
+
+While processes may freely descend into children PID namespaces
+(e.g. using
+.BR setns (2)
+with
+.BR CLONE_NEWPID ),
+they may not move in the other direction.
+That is to say, processes may not enter any ancestor namespaces
+(parent, grandparent, etc.).
+Changing PID namespaces is a one way operation.
 .\"
 .\" ============================================================
 .\"
-- 
2.2.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
