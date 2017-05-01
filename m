From: Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH man-pages 5/5] userfaultfd.2: update VERSIONS section with 4.11 chanegs
Date: Mon,  1 May 2017 08:43:19 +0300
Message-ID: <1493617399-20897-6-git-send-email-rppt@linux.vnet.ibm.com>
References: <1493617399-20897-1-git-send-email-rppt@linux.vnet.ibm.com>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1493617399-20897-1-git-send-email-rppt@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-man@vger.kernel.org, Mike Rapoport <rppt@linux.vnet.ibm.com>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
---
 man2/userfaultfd.2 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/man2/userfaultfd.2 b/man2/userfaultfd.2
index f177bba..07a69f1 100644
--- a/man2/userfaultfd.2
+++ b/man2/userfaultfd.2
@@ -404,6 +404,9 @@ Insufficient kernel memory was available.
 The
 .BR userfaultfd ()
 system call first appeared in Linux 4.3.
+
+The support for hugetlbfs and shared memory areas and
+non-page-fault events was added in Linux 4.11
 .SH CONFORMING TO
 .BR userfaultfd ()
 is Linux-specific and should not be used in programs intended to be
-- 
1.9.1

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
