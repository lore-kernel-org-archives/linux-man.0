From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/2] proc.5: ffix
Date: Mon,  5 Nov 2012 00:08:01 -0400
Message-ID: <1352088481-22926-1-git-send-email-taffit@debian.org>
References: <1352084275-1568-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352084275-1568-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man5/proc.5 |   15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 0164ba6..ca94657 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -1417,7 +1417,8 @@ Total usable RAM (i.e. physical RAM minus a few reserved
 bits and the kernel binary code).
 .TP
 .IR MemFree " %lu"
-The sum of LowFree+HighFree.
+The sum of 
+.IR LowFree + HighFree.
 .TP
 .IR Buffers " %lu"
 Relatively temporary storage for raw disk blocks that
@@ -1486,7 +1487,9 @@ Lowmem is memory which can be used for everything that
 highmem can be used for, but it is also available for the
 kernel's use for its own data structures.
 Among many other things,
-it is where everything from Slab is allocated.
+it is where everything from
+.I Slab
+is allocated.
 Bad things happen when you're out of lowmem.
 .TP
 .IR LowFree " %lu
@@ -1524,10 +1527,14 @@ Files which have been mmaped, such as libraries.
 In-kernel data structures cache.
 .TP
 .IR SReclaimable " %lu (since Linux 2.6.19)"
-Part of Slab, that might be reclaimed, such as caches.
+Part of
+.IR Slab ,
+that might be reclaimed, such as caches.
 .TP
 .IR SUnreclaim " %lu (since Linux 2.6.19)"
-Part of Slab, that cannot be reclaimed on memory pressure.
+Part of
+.IR Slab ,
+that cannot be reclaimed on memory pressure.
 .TP
 .IR KernelStack " %lu (since Linux 2.6.32)"
 Amount of memory allocated to kernel stacks.
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
