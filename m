From: Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH man-pages 2/5] ioctl_userfaultfd.2: UFFDIO_COPY: add ENOENT and ENOSPC description
Date: Mon,  1 May 2017 08:43:16 +0300
Message-ID: <1493617399-20897-3-git-send-email-rppt@linux.vnet.ibm.com>
References: <1493617399-20897-1-git-send-email-rppt@linux.vnet.ibm.com>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1493617399-20897-1-git-send-email-rppt@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-man@vger.kernel.org, Mike Rapoport <rppt@linux.vnet.ibm.com>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
---
 man2/ioctl_userfaultfd.2 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man2/ioctl_userfaultfd.2 b/man2/ioctl_userfaultfd.2
index 6edd396..e12b9de 100644
--- a/man2/ioctl_userfaultfd.2
+++ b/man2/ioctl_userfaultfd.2
@@ -481,6 +481,19 @@ was invalid.
 An invalid bit was specified in the
 .IR mode
 field.
+.TP
+.B ENOENT
+(Since Linux 4.11)
+The faulting process has changed
+its virtual memory layout simultaneously with outstanding
+.I UFFDIO_COPY
+operation.
+.TP
+.B ENOSPC
+(Since Linux 4.11)
+The faulting process has exited at the time of
+.I UFFDIO_COPY
+operation.
 .\"
 .SS UFFDIO_ZEROPAGE
 (Since Linux 4.3.)
-- 
1.9.1

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
