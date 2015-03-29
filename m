From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH] futex.2: clarify address mapping
Date: Sun, 29 Mar 2015 20:38:13 +0200
Message-ID: <1427654293-19851-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Using the word "physical" address should make the text easier to
make.

Avoid negations like "may not be equal".

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man2/futex.2 | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/man2/futex.2 b/man2/futex.2
index b4a52b1..0644fc6 100644
--- a/man2/futex.2
+++ b/man2/futex.2
@@ -54,12 +54,10 @@ The condition is represented by the futex word, which is an address
 in memory supplied to the
 .BR futex ()
 system call, and the value at this memory location.
-(While the virtual addresses for the same memory in separate
-processes may not be equal,
-the kernel maps them internally so that the same memory mapped
-in different locations will correspond for
-.BR futex ()
-calls.)
+(While the virtual addresses for the same physical memory address
+in separate processes may be different,
+the same physical address may be shared by the processes using
+.BR mmap (2).)
 
 When executing a futex operation that requests to block a thread,
 the kernel will only block if the futex word has the value that the
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
