From: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 6/6] ld.so.8: document how hwcaps affect search path
Date: Thu, 20 Oct 2011 02:16:35 -0500
Message-ID: <20111020071635.GF11485@elie.hsd1.il.comcast.net>
References: <20111020070037.GA11392@elie.hsd1.il.comcast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111020070037.GA11392-E4JsH6yu/ca99If2fRKg35Ea+QML8DWm@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>, Aurelien Jarno <aurelien-rXXEIb44qovR7s880joybQ@public.gmane.org>, Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Wording by Aurelien Jarno, from Debian glibc's r4701 (2011-06-04).

Fixes http://bugs.debian.org/622385

Requested-by: Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>
Signed-off-by: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
I think this information belongs in the ldconfig(8) page, not
ld.so(8), but either one is better than nowhere. ;-)

That's the end of the series.  Thanks for reading.

 man8/ld.so.8 |   32 ++++++++++++++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/man8/ld.so.8 b/man8/ld.so.8
index 409876d..13b5508 100644
--- a/man8/ld.so.8
+++ b/man8/ld.so.8
@@ -63,6 +63,8 @@ in the augmented library path.
 If, however, the binary was linked with the
 .B \-z nodeflib
 linker option, libraries in the default library paths are skipped.
+Libraries installed in hardware capabilities directories (see below)
+are preferred to other libraries.
 .IP o
 In the default path
 .IR /lib ,
@@ -152,6 +154,36 @@ the system libraries directory, which is /lib for the native architecture
 on FHS compliant GNU/Linux systems.
 .\" ld.so lets names be abbreviated, so $O will work for $ORIGIN;
 .\" Don't do this!!
+.SH HARDWARE CAPABILITIES
+Libraries might be compiled using hardware-specific instructions which do not
+exist on every CPU. Such libraries should be installed in directories whose name
+defines the hardware capabilities such as \fB/usr/lib/sse2/\fR. The dynamic
+linker checks these directories against the hardware of the machine and selects
+the best suitable version of a given library. Hardware capabilities directories
+could be cascaded to combine CPU features. Hardware capabilities depends on
+the CPU. The following names are currently recognized:
+.B Alpha
+ev4, ev5, ev56, ev6, ev67
+.TP
+.B MIPS
+loongson2e, loongson2f, octeon, octeon2
+.TP
+.B PowerPC
+4xxmac, altivec, arch_2_05, arch_2_06, booke, cellbe, dfp, efpdouble, efpsingle,
+fpu, ic_snoop, mmu, notb, pa6t, power4, power5, power5+, power6x, ppc32, ppc601,
+ppc64, smt, spe, ucache, vsx
+.TP
+.B SPARC
+flush, muldiv, stbar, swap, ultra3, v9, v9v, v9v2
+.TP
+.B s390
+dfp, eimm, esan3, etf3enh, g5, highgprs, hpage, ldisp, msa, stfle,
+z900, z990, z9-109, z10, zarch
+.TP
+.TP
+.B x86 (32-bit only)
+acpi, apic, clflush, cmov, cx8, dts, fxsr, ht, i386, i486, i586, i686, mca, mmx,
+mtrr, pat, pbe, pge, pn, pse36, sep, ss, sse, sse2, tm
 .SH ENVIRONMENT
 There are four important environment variables.
 .TP
-- 
1.7.7

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
