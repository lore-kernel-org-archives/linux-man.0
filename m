From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv2] vdso.7: update for MIPS
Date: Tue, 12 Apr 2016 09:13:01 +0100
Message-ID: <1460448781-42861-1-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <20160406190137.GH6588@vapier.lan>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160406190137.GH6588-UgUKS2FnFs9+urZeOPWqwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Document the symbols exported by the MIPS VDSO.
VDSO support was added from kernel 4.4 onwards.

See https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/log/arch/mips/vdso

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
---
V2 -> V1
Added sigreturn/rt_sigreturn as well
---
 man7/vdso.7 | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/man7/vdso.7 b/man7/vdso.7
index 5eb885f..9a96df8 100644
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
@@ -247,6 +248,29 @@ For information on this code page,
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
+__kernel_rt_sigreturn	LINUX_2.6 (exported since Linux 4.4)
+__kernel_sigreturn	LINUX_2.6 (exported since Linux 4.4)
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
