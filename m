From: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] userfaultfd.2: document spurious UFFD_EVENT_FORK
Date: Thu, 26 Oct 2017 16:04:03 +0300
Message-ID: <1509023043-19872-1-git-send-email-rppt@linux.vnet.ibm.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-mm <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
---
 man2/userfaultfd.2 | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/man2/userfaultfd.2 b/man2/userfaultfd.2
index 1c9e64b..08c41e1 100644
--- a/man2/userfaultfd.2
+++ b/man2/userfaultfd.2
@@ -465,6 +465,16 @@ for checkpoint/restore mechanisms,
 as well as post-copy migration to allow (nearly) uninterrupted execution
 when transferring virtual machines and Linux containers
 from one host to another.
+.SH BUGS
+If the
+.B UFFD_FEATURE_EVENT_FORK
+is enabled and a system call from the
+.BR fork (2)
+family is interrupted by a signal or failed,q a stale userfaultfd descriptor
+might be created.
+In this case a spurious
+.B UFFD_EVENT_FORK
+will be delivered to the userfaultfd monitor.
 .SH EXAMPLE
 The program below demonstrates the use of the userfaultfd mechanism.
 The program creates two threads, one of which acts as the
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
