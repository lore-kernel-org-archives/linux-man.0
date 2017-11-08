From: Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH] userfaultfd.2: document spurious UFFD_EVENT_FORK
Date: Wed,  8 Nov 2017 08:54:08 +0200
Message-ID: <1510124048-7991-1-git-send-email-rppt@linux.vnet.ibm.com>
Return-path: <owner-linux-mm@kvack.org>
Sender: owner-linux-mm@kvack.org
To: Michael Kerrisk <mtk.manpages@gmail.com>
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-man@vger.kernel.org, linux-mm <linux-mm@kvack.org>, Mike Rapoport <rppt@linux.vnet.ibm.com>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
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
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
