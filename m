From: Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH man-pages 2/2] ioctl_userfaultfd.2: start adding details about userfaultfd features
Date: Thu, 27 Apr 2017 17:14:34 +0300
Message-ID: <1493302474-4701-3-git-send-email-rppt@linux.vnet.ibm.com>
References: <1493302474-4701-1-git-send-email-rppt@linux.vnet.ibm.com>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1493302474-4701-1-git-send-email-rppt@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-man@vger.kernel.org, Mike Rapoport <rppt@linux.vnet.ibm.com>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
---
 man2/ioctl_userfaultfd.2 | 53 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/man2/ioctl_userfaultfd.2 b/man2/ioctl_userfaultfd.2
index 42bf7a7..cdc07e0 100644
--- a/man2/ioctl_userfaultfd.2
+++ b/man2/ioctl_userfaultfd.2
@@ -121,22 +121,70 @@ and explicitly enable userfaultfd features that are disabled by default.
 The kernel always reports all the available features in the
 .I features
 field.
+
+To enable userfaultfd features the application should set
+a bit corresponding to each feature it wants to enable in the
+.I features
+field.
+If the kernel supports all the requested features it will enable them.
+Otherwise it will zero out the returned
+.I uffdio_api
+structure and return
+.BR EINVAL .
 .\" FIXME add more details about feature negotiation and enablement
 
 Since Linux 4.11, the following feature bits may be set:
 .TP
 .B UFFD_FEATURE_EVENT_FORK
+When this feature is enabled,
+the userfaultfd objects associated with a parent process are duplicated
+into the child process during
+.BR fork (2)
+system call and the
+.I UFFD_EVENT_FORK
+is delivered to the userfaultfd monitor
 .TP
 .B UFFD_FEATURE_EVENT_REMAP
+If this feature is enabled,
+when the faulting process invokes
+.BR mremap (2)
+system call
+the userfaultfd monitor will receive an event of type
+.I UFFD_EVENT_REMAP.
 .TP
 .B UFFD_FEATURE_EVENT_REMOVE
+If this feature is enabled,
+when the faulting process calls
+.BR madvise(2)
+system call with
+.I MADV_DONTNEED
+or
+.I MADV_REMOVE
+advice to free a virtual memory area
+the userfaultfd monitor will receive an event of type
+.I UFFD_EVENT_REMOVE.
 .TP
 .B UFFD_FEATURE_EVENT_UNMAP
+If this feature is enabled,
+when the faulting process unmaps virtual memory either explicitly with
+.BR munmap (2)
+system call, or implicitly either during
+.BR mmap (2)
+or
+.BR mremap (2)
+system call,
+the userfaultfd monitor will receive an event of type
+.I UFFD_EVENT_UNMAP
 .TP
 .B UFFD_FEATURE_MISSING_HUGETLBFS
+If this feature bit is set,
+the kernel supports registering userfaultfd ranges on hugetlbfs
+virtual memory areas
 .TP
 .B UFFD_FEATURE_MISSING_SHMEM
-.\" FIXME add feature description
+If this feature bit is set,
+the kernel supports registering userfaultfd ranges on tmpfs
+virtual memory areas
 
 The returned
 .I ioctls
@@ -182,7 +230,8 @@ The API version requested in the
 .I api
 field is not supported by this kernel, or the
 .I features
-field was not zero.
+field passed to the kernel includes feature bits that are not supported
+by the current kernel version.
 .\" FIXME In the above error case, the returned 'uffdio_api' structure is
 .\" zeroed out. Why is this done? This should be explained in the manual page.
 .\"
-- 
1.9.1

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
