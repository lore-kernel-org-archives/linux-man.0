From: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Subject: [PATCH] Document new hugetlb page size extensions for mmap/shmget
Date: Thu, 11 Oct 2012 16:59:03 -0700
Message-ID: <1349999943-8800-1-git-send-email-andi@firstfloor.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andi Kleen <ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

From: Andi Kleen <ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

The patch is still pending. I'm assuming it'll get into 3.8.
If not please adjust the version number

Signed-off-by: Andi Kleen <ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 man2/mmap.2   |    6 ++++++
 man2/shmget.2 |    6 ++++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/man2/mmap.2 b/man2/mmap.2
index af539b6..f92ab90 100644
--- a/man2/mmap.2
+++ b/man2/mmap.2
@@ -295,6 +295,12 @@ support can later be transparently implemented for glibc.
 .\" http://thread.gmane.org/gmane.linux.kernel/720412
 .\" "pthread_create() slow for many threads; also time to revisit 64b
 .\"  context switch optimization?"
+.TP
+.BR "MAP_HUGE_2MB, MAP_HUGE_1GB" " (Since Linux 3.8)"
+on x86 systems select alternative hugetlb page sizes when configured.
+More generally 6bits of the log2 of the huge page size can be put at the
+.BR MAP_HUGE_SHIFT 
+bit offset to select that page size.
 .LP
 Some systems document the additional flags
 .BR MAP_AUTOGROW ,
diff --git a/man2/shmget.2 b/man2/shmget.2
index 9e479b6..8681995 100644
--- a/man2/shmget.2
+++ b/man2/shmget.2
@@ -133,6 +133,12 @@ See also the discussion of the file
 .I /proc/sys/vm/overcommit_memory
 in
 .BR proc (5).
+.TP 
+.BR "SHM_HUGE_2MB, SHM_HUGE_1GB" " (Since Linux 3.8)"
+on x86 systems select alternative hugetlb page sizes when configured.
+More general 6bits of the log2 of the huge page size can be put at the
+.BR SHM_HUGE_SHIFT
+bit offset.
 .\" As at 2.6.17-rc2, this flag has no effect if SHM_HUGETLB was also
 .\" specified.
 .PP
-- 
1.7.7.6

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
