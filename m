From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] futex.2: explanation of blocking behavior
Date: Sun, 29 Mar 2015 20:48:20 +0200
Message-ID: <1427654900-30075-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Shorten overlong sentence.
Highlight futex().
Tfix.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man2/futex.2 | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/man2/futex.2 b/man2/futex.2
index 0644fc6..dea50ea 100644
--- a/man2/futex.2
+++ b/man2/futex.2
@@ -59,16 +59,18 @@ in separate processes may be different,
 the same physical address may be shared by the processes using
 .BR mmap (2).)
 
-When executing a futex operation that requests to block a thread,
+When executing a
+.BR futex ()
+operation that requests to block a thread,
 the kernel will only block if the futex word has the value that the
 calling thread supplied as expected value.
 The load from the futex word, the comparison with
 the expected value,
 and the actual blocking will happen atomically and totally
-ordered with respect to concurrently executing futex operations
-on the same futex word,
-such as operations that wake threads blocked on this futex word.
-Thus, the futex word is used to connect the synchronization in user spac
+ordered with respect to concurrently executing
+.BR futex ()
+operations on the same futex word.
+Thus, the futex word is used to connect the synchronization in user space
 with the implementation of blocking by the kernel; similar to an atomic
 compare-and-exchange operation that potentially changes shared memory,
 blocking via a futex is an atomic compare-and-block operation.
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
