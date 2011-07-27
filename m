From: Doug Goldstein <cardoe-VPKZcK2rSRzQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] madvise.2: add MADV_HUGEPAGE and MADV_NOHUGEPAGE
Date: Wed, 27 Jul 2011 15:14:03 -0500
Message-ID: <CAFWqQMRFHJ2kWkJWB2dAg-Od9MzqL7LeC=CQvzy6t5aNqVY_zQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Document the MADV_HUGEPAGE and MADV_NOHUGEPAGE flags added to the
madvise() syscall in Linux kernels 2.6.38 and newer.

Signed-off-by: Doug Goldstein <cardoe-VPKZcK2rSRzQT0dZR+AlfA@public.gmane.org>
---
 man2/madvise.2 |   34 ++++++++++++++++++++++++++++++++++
 1 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/man2/madvise.2 b/man2/madvise.2
index 6a449c5..e099e94 100644
--- a/man2/madvise.2
+++ b/man2/madvise.2
@@ -209,6 +209,40 @@ KSM unmerges whatever pages it had merged in the
address range specified by
 .IR addr
 and
 .IR length .
+.TP
+.BR MADV_HUGEPAGE " (since Linux 2.6.38)"
+Enables Transparent Huge Pages (THP) for pages in the range specified by
+.I addr
+and
+.IR length .
+Currently Transparent Huge Pages only work with private anonymous pages (see
+.BR mmap (2)).
+The kernel will regularly scan the areas marked as huge page candidates
+to replace them with huge pages.
+The kernel will also allocate huge pages directly when the region is
+naturally aligned to the huge page size. (see
+.BR posix_memalign (2)).
+This feature is primarily aimmed at applications that use large mappings of
+data and access large regions of that memory at a time (e.g. virtualization
+systems such as qemu).
+It can very easily waste memory (e.g. a 2MB mapping that only ever accesses
+1 byte will result in 2MB of wired memory instead of one 4KB page).
+See the kernel source file
+.I Documentation/vm/transhuge.txt
+for more details.
+The
+.BR MADV_HUGEPAGE
+and
+.BR MADV_NOHUGEPAGE
+operations are only available if the kernel was configured with
+.BR CONFIG_TRANSPARENT_HUGEPAGE.
+.TP
+.BR MADV_NOHUGEPAGE " (since Linux 2.6.38)"
+Ensures that memory in the address range specified by
+.IR addr
+and
+.IR length
+will not be collapsed into huge pages.
 .SH "RETURN VALUE"
 On success
 .BR madvise ()
-- 
1.7.6
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
