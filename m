From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] futex.7: remove commonplace
Date: Tue, 17 Feb 2015 10:44:07 +0100
Message-ID: <1424166247-6446-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The sentence is true for all man-pages. Remove it.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man7/futex.7 | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/man7/futex.7 b/man7/futex.7
index c3c57f0..c829886 100644
--- a/man7/futex.7
+++ b/man7/futex.7
@@ -24,9 +24,6 @@ Futexes are very basic and lend themselves well for building higher-level
 locking abstractions such as
 mutexes, condition variables, read-write locks, barriers, and semaphores.
 .PP
-This page does not set out to document all design decisions
-but restricts itself to issues relevant for
-application and library development.
 Most programmers will in fact not be using futexes directly but will
 instead rely on system libraries built on them,
 such as the Native POSIX Thread Library (NPTL) (see
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
