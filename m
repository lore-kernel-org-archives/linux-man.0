From: Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH 1/5] userfaultfd.2: describe memory types that can be used from 4.11
Date: Tue, 25 Apr 2017 19:29:04 +0300
Message-ID: <1493137748-32452-2-git-send-email-rppt@linux.vnet.ibm.com>
References: <1493137748-32452-1-git-send-email-rppt@linux.vnet.ibm.com>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1493137748-32452-1-git-send-email-rppt@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-man@vger.kernel.org, Mike Rapoport <rppt@linux.vnet.ibm.com>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
---
 man2/userfaultfd.2 | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/man2/userfaultfd.2 b/man2/userfaultfd.2
index 1603c20..c89484f 100644
--- a/man2/userfaultfd.2
+++ b/man2/userfaultfd.2
@@ -130,8 +130,12 @@ Details of the various
 operations can be found in
 .BR ioctl_userfaultfd (2).
 
-Currently, userfaultfd can be used only with anonymous private memory
-mappings.
+Up to Linux 4.11,
+userfaultfd can be used only with anonymous private memory mappings.
+
+Since Linux 4.11,
+userfaultfd can be also used with hugetlbfs and shared memory mappings.
+
 .\"
 .SS Reading from the userfaultfd structure
 Each
-- 
1.9.1

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
