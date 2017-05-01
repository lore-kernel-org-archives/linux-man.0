From: Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH man-pages 3/5] ioctl_userfaultfd.2: add BUGS section
Date: Mon,  1 May 2017 08:43:17 +0300
Message-ID: <1493617399-20897-4-git-send-email-rppt@linux.vnet.ibm.com>
References: <1493617399-20897-1-git-send-email-rppt@linux.vnet.ibm.com>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1493617399-20897-1-git-send-email-rppt@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-man@vger.kernel.org, Mike Rapoport <rppt@linux.vnet.ibm.com>
List-Id: linux-man@vger.kernel.org

The features handshake is not quite convenient.
Elaborate about it in the BUGS section.

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
---
 man2/ioctl_userfaultfd.2 | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/man2/ioctl_userfaultfd.2 b/man2/ioctl_userfaultfd.2
index e12b9de..50316de 100644
--- a/man2/ioctl_userfaultfd.2
+++ b/man2/ioctl_userfaultfd.2
@@ -650,6 +650,15 @@ operations are Linux-specific.
 .SH EXAMPLE
 See
 .BR userfaultfd (2).
+.SH BUGS
+In order to detect available userfault features and
+enable certain subset of those features
+the usefault file descriptor must be closed after the first
+.BR UFFDIO_API
+operation that queries features availability and re-opened before
+the second
+.BR UFFDIO_API
+call that actually enables the desired features.
 .SH SEE ALSO
 .BR ioctl (2),
 .BR mmap (2),
-- 
1.9.1

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
