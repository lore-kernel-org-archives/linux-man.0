From: Sven Hoexter <sven-jJOYKVDXsn5H4x6Dk/4f9A@public.gmane.org>
Subject: [PATCH] proc.5: Add "VmSwap" to /proc/[pid]/status
Date: Sun, 14 Dec 2014 15:20:52 +0100
Message-ID: <E1Y0APl-0002WV-Ai@garkbit.lan>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Documented as is in Documentation/filesystems/proc.txt of Linux 3.18.

Signed-off-by: Sven Hoexter <sven-jJOYKVDXsn5H4x6Dk/4f9A@public.gmane.org>
---
 man5/proc.5 | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/man5/proc.5 b/man5/proc.5
index 96077d0..b16f2a7 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -1587,6 +1587,7 @@ VmStk:        88 kB
 VmExe:       572 kB
 VmLib:      1708 kB
 VmPTE:        20 kB
+VmSwap:        0 kB
 Threads:        1
 SigQ:   0/3067
 SigPnd: 0000000000000000
@@ -1672,6 +1673,9 @@ Shared library code size.
 .IR VmPTE :
 Page table entries size (since Linux 2.6.10).
 .IP *
+.IR VmSwap :
+Size of swap usage (the number of referred swapents).
+.IP *
 .IR Threads :
 Number of threads in process containing this thread.
 .IP *
-- 
2.1.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
