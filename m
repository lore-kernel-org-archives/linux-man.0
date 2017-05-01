From: Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH man-pages 1/5] ioctl_userfaultfd.2: update description of shared memory areas
Date: Mon,  1 May 2017 08:43:15 +0300
Message-ID: <1493617399-20897-2-git-send-email-rppt@linux.vnet.ibm.com>
References: <1493617399-20897-1-git-send-email-rppt@linux.vnet.ibm.com>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1493617399-20897-1-git-send-email-rppt@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-man@vger.kernel.org, Mike Rapoport <rppt@linux.vnet.ibm.com>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
---
 man2/ioctl_userfaultfd.2 | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/man2/ioctl_userfaultfd.2 b/man2/ioctl_userfaultfd.2
index 889feb9..6edd396 100644
--- a/man2/ioctl_userfaultfd.2
+++ b/man2/ioctl_userfaultfd.2
@@ -181,8 +181,17 @@ virtual memory areas
 .TP
 .B UFFD_FEATURE_MISSING_SHMEM
 If this feature bit is set,
-the kernel supports registering userfaultfd ranges on tmpfs
-virtual memory areas
+the kernel supports registering userfaultfd ranges on shared memory areas.
+This includes all kernel shared memory APIs:
+System V shared memory,
+tmpfs,
+/dev/zero,
+.BR mmap(2)
+with
+.I MAP_SHARED
+flag set,
+.BR memfd_create (2),
+etc.
 
 The returned
 .I ioctls
-- 
1.9.1

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
