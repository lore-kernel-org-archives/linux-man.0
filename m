From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] vdso.7: update for MIPS
Date: Tue, 5 Apr 2016 16:24:34 +0100
Message-ID: <1459869874-61625-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Document the symbols exported by the MIPS VDSO.
VDSO support was added from kernel 4.4 onwards.

See https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/log/arch/mips/vdso

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
---
 man7/vdso.7 | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/man7/vdso.7 b/man7/vdso.7
index 5eb885f..3c5f1a4 100644
--- a/man7/vdso.7
+++ b/man7/vdso.7
@@ -150,6 +150,7 @@ _
 aarch64	linux-vdso.so.1
 arm	linux-vdso.so.1
 ia64	linux-gate.so.1
+mips	linux-vdso.so.1
 ppc/32	linux-vdso32.so.1
 ppc/64	linux-vdso64.so.1
 s390	linux-vdso32.so.1
@@ -247,6 +248,27 @@ For information on this code page,
 it's best to refer to the public documentation:
 .br
 http://docs.blackfin.uclinux.org/doku.php?id=linux-kernel:fixed-code
+.SS mips functions
+.\" See linux/arch/mips/vdso/vdso.ld.S
+
+The table below lists the symbols exported by the vDSO.
+.if t \{\
+.ft CW
+\}
+.TS
+l l.
+symbol	version
+_
+__kernel_gettimeofday	LINUX_2.6 (exported since Linux 4.4)
+__kernel_clock_gettime	LINUX_2.6 (exported since Linux 4.4)
+.TE
+.if t \{\
+.in
+.ft P
+\}
+
+.br
+
 .SS ia64 (Itanium) functions
 .\" See linux/arch/ia64/kernel/gate.lds.S
 .\" Also linux/arch/ia64/kernel/fsys.S and linux/Documentation/ia64/fsys.txt
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
