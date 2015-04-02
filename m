From: David Rientjes <rientjes@google.com>
Subject: [patch] madvise.2: specify MADV_REMOVE returns EINVAL for
 hugetlbfs
Date: Thu, 2 Apr 2015 15:21:50 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1504021517540.9951@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <owner-linux-mm@kvack.org>
Sender: owner-linux-mm@kvack.org
To: mtk.manpages@gmail.com
Cc: Andrew Morton <akpm@linux-foundation.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

madvise(2) actually returns with error EINVAL for MADV_REMOVE when used 
for hugetlb vmas, not EOPNOTSUPP, and this has been the case since 
MADV_REMOVE was introduced in commit f6b3ec238d12 ("madvise(MADV_REMOVE): 
remove pages from tmpfs shm backing store").

Specify the exact behavior.

Signed-off-by: David Rientjes <rientjes@google.com>
---
 man2/madvise.2 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man2/madvise.2 b/man2/madvise.2
index a3d93bb..00db39d 100644
--- a/man2/madvise.2
+++ b/man2/madvise.2
@@ -184,7 +184,9 @@ any filesystem which supports the
 .BR FALLOC_FL_PUNCH_HOLE
 mode also supports
 .BR MADV_REMOVE .
-Other filesystems fail with the error
+Hugetlbfs will fail with the error
+.BR EINVAL
+and other filesystems fail with the error
 .BR EOPNOTSUPP .
 .TP
 .BR MADV_DONTFORK " (since Linux 2.6.16)"

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
