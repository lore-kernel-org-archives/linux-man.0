From: Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH 3/5] ioctl_userfaultfd.2: update UFFDIO_API description
Date: Tue, 25 Apr 2017 19:29:06 +0300
Message-ID: <1493137748-32452-4-git-send-email-rppt@linux.vnet.ibm.com>
References: <1493137748-32452-1-git-send-email-rppt@linux.vnet.ibm.com>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1493137748-32452-1-git-send-email-rppt@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-man@vger.kernel.org, Mike Rapoport <rppt@linux.vnet.ibm.com>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
---
 man2/ioctl_userfaultfd.2 | 38 ++++++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/man2/ioctl_userfaultfd.2 b/man2/ioctl_userfaultfd.2
index 78abc4d..dade631 100644
--- a/man2/ioctl_userfaultfd.2
+++ b/man2/ioctl_userfaultfd.2
@@ -95,11 +95,6 @@ struct uffdio_api {
 The
 .I api
 field denotes the API version requested by the application.
-Before the call, the
-.I features
-field must be initialized to zero.
-In the future, it is intended that this field can be used to ask
-whether particular features are supported.
 
 The kernel verifies that it can support the requested API version,
 and sets the
@@ -109,9 +104,40 @@ and
 fields to bit masks representing all the available features and the generic
 .BR ioctl (2)
 operations available.
-Currently, zero (i.e., no feature bits) is placed in the
+
+For Linux kernel versions before 4.11, the
+.I features
+field must be initialized to zero before the call to
+.I UFFDIO_API
+, and zero (i.e., no feature bits) is placed in the
+.I features
+field by the kernel upon return from
+.BR ioctl (2).
+
+Starting from Linux 4.11, the
+.I features
+field can be used to to ask whether particular features are supported
+and explicitly enable userfaultfd features that are disabled by default.
+The kernel always reports all the available features in the
 .I features
 field.
+.\" FIXME add more details about feature negotiation and enablement
+
+Since Linux 4.11, the following feature bits may be set:
+.TP
+.B UFFD_FEATURE_EVENT_FORK
+.TP
+.B UFFD_FEATURE_EVENT_REMAP
+.TP
+.B UFFD_FEATURE_EVENT_REMOVE
+.TP
+.B UFFD_FEATURE_EVENT_UNMAP
+.TP
+.B UFFD_FEATURE_MISSING_HUGETLBFS
+.TP
+.B UFFD_FEATURE_MISSING_SHMEM
+.\" FIXME add feature description
+
 The returned
 .I ioctls
 field can contain the following bits:
-- 
1.9.1

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
