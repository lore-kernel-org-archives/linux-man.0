From: Bernhard Walle <bernhard-X9USDgGjgfuzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] proc.5: Document /proc/thread-self
Date: Sun,  2 Nov 2014 22:08:40 +0100
Message-ID: <1414962520-5480-1-git-send-email-bernhard@bwalle.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Add some words about /proc/thread-self that has been introduced in Linux
3.17 with commit 0097875bd41528922fb3bb5f348c53f17e00e2fd.

Signed-off-by: Bernhard Walle <bernhard-X9USDgGjgfuzQB+pC5nmwQ@public.gmane.org>
---
 man5/proc.5 | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/man5/proc.5 b/man5/proc.5
index da4b5b6..e5b090d 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -4217,6 +4217,16 @@ for easy understanding.
 .BR svipc (7)
 provides further background on the information shown by these files.
 .TP
+.IR /proc/thread-self " (since Linux 3.17)"
+This directory refers to the thread accessing the
+.I /proc
+filesystem,
+and is identical to the
+.I /proc/self/task/[tid]
+directory named by the process thread ID
+.RI ( [tid] )
+of the same thread.
+.TP
 .IR /proc/timer_list " (since Linux 2.6.21)"
 .\" commit 289f480af87e45f7a6de6ba9b4c061c2e259fe98
 This read-only file exposes a list of all currently pending
-- 
2.1.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
