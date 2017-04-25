From: Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH 2/5] ioctl_userfaultfd.2: describe memory types that can be used from 4.11
Date: Tue, 25 Apr 2017 19:29:05 +0300
Message-ID: <1493137748-32452-3-git-send-email-rppt@linux.vnet.ibm.com>
References: <1493137748-32452-1-git-send-email-rppt@linux.vnet.ibm.com>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1493137748-32452-1-git-send-email-rppt@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-man@vger.kernel.org, Mike Rapoport <rppt@linux.vnet.ibm.com>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
---
 man2/ioctl_userfaultfd.2 | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/man2/ioctl_userfaultfd.2 b/man2/ioctl_userfaultfd.2
index 66fbfdc..78abc4d 100644
--- a/man2/ioctl_userfaultfd.2
+++ b/man2/ioctl_userfaultfd.2
@@ -169,11 +169,15 @@ field was not zero.
 (Since Linux 4.3.)
 Register a memory address range with the userfaultfd object.
 The pages in the range must be "compatible".
-In the current implementation,
-.\" According to Mike Rapoport, this will change in Linux 4.11.
+
+Up to Linux kernel 4.11,
 only private anonymous ranges are compatible for registering with
 .BR UFFDIO_REGISTER .
 
+Since Linux 4.11,
+hugetlbfs and shared memory ranges are also compatible with
+.BR UFFDIO_REGISTER .
+
 The
 .I argp
 argument is a pointer to a
-- 
1.9.1

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
