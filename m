From: Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH 4/5] userfaultfd.2: add Linux container migration use-case to NOTES
Date: Tue, 25 Apr 2017 19:29:07 +0300
Message-ID: <1493137748-32452-5-git-send-email-rppt@linux.vnet.ibm.com>
References: <1493137748-32452-1-git-send-email-rppt@linux.vnet.ibm.com>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1493137748-32452-1-git-send-email-rppt@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-man@vger.kernel.org, Mike Rapoport <rppt@linux.vnet.ibm.com>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
---
 man2/userfaultfd.2 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/man2/userfaultfd.2 b/man2/userfaultfd.2
index c89484f..dc37319 100644
--- a/man2/userfaultfd.2
+++ b/man2/userfaultfd.2
@@ -279,7 +279,8 @@ signal and
 It can also be used to implement lazy restore
 for checkpoint/restore mechanisms,
 as well as post-copy migration to allow (nearly) uninterrupted execution
-when transferring virtual machines from one host to another.
+when transferring virtual machines and Linux containers
+from one host to another.
 .SH EXAMPLE
 The program below demonstrates the use of the userfaultfd mechanism.
 The program creates two threads, one of which acts as the
-- 
1.9.1

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
