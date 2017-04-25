From: Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH 5/5] usefaultfd.2: add brief description of "non-cooperative" mode
Date: Tue, 25 Apr 2017 19:29:08 +0300
Message-ID: <1493137748-32452-6-git-send-email-rppt@linux.vnet.ibm.com>
References: <1493137748-32452-1-git-send-email-rppt@linux.vnet.ibm.com>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1493137748-32452-1-git-send-email-rppt@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-man@vger.kernel.org, Mike Rapoport <rppt@linux.vnet.ibm.com>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
---
 man2/userfaultfd.2 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man2/userfaultfd.2 b/man2/userfaultfd.2
index dc37319..291dd10 100644
--- a/man2/userfaultfd.2
+++ b/man2/userfaultfd.2
@@ -89,6 +89,20 @@ them using the operations described in
 .BR ioctl_userfaultfd (2).
 When servicing the page fault events,
 the fault-handling thread can trigger a wake-up for the sleeping thread.
+
+It is possible for the faulting threads and the fault-handling threads
+to run in the context of different processes.
+In this case, these threads may belong to different programs,
+and the program that executes the faulting threads
+will not necessarily cooperate with the program that handles the page faults.
+In such non-cooperative mode,
+the process that monitors userfaultfd and handles page faults,
+needs to be aware of the changes in the virtual memory layout
+of the faulting process to avoid memory corruption.
+.\" FIXME elaborate about non-cooperating mode, describe its limitations
+.\" for kerneles before 4.11, features added in 4.11
+.\" and limitations remaining in 4.11
+.\" Maybe it's worth adding a dedicated sub-section...
 .\"
 .SS Userfaultfd operation
 After the userfaultfd object is created with
-- 
1.9.1

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
