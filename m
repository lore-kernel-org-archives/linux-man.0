From: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3] ld.so.8: Document effect of hwcaps on search path
Date: Mon, 16 Apr 2012 14:27:03 -0500
Message-ID: <20120416192703.GY5813@burratino>
References: <20111020070037.GA11392@elie.hsd1.il.comcast.net>
 <CAKgNAkgbcL3deJ4x0DEV==vtiAmYie7+Gw+c=K_dAJhWE4va1Q@mail.gmail.com>
 <20120416165806.GR5813@burratino>
 <CAKgNAkj0BAKbP6SrohCEG+eeEAZAYkJ6NA9Jvi0hS2j3e19mmg@mail.gmail.com>
 <20120416172408.GT5813@burratino>
 <CAKgNAkggZ1EZyBkkkd4xmJnjt-_kw=F_xb81+--gpQztvyD8oA@mail.gmail.com>
 <20120416190346.GX5813@burratino>
 <CAKgNAkjfcbiDiGqd1PNpdPcUTQBd+8qyrWZj3D6hnzU5vZdecA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkjfcbiDiGqd1PNpdPcUTQBd+8qyrWZj3D6hnzU5vZdecA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Petr Baudis <pasky-+ZI9xUNit7I@public.gmane.org>, Aurelien Jarno <aurelien-rXXEIb44qovR7s880joybQ@public.gmane.org>, Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Wording by Aurelien Jarno from Debian glibc's r4701 (2011-06-04).

Addresses http://bugs.debian.org/622385

Requested-by: Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>
Signed-off-by: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Michael Kerrisk (man-pages) wrote:

> Some minor formatting points:
> * Please start new sentences on new lines.
[and other useful feedback about the grammar and substance]

Here goes.

 man8/ld.so.8 |   36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/man8/ld.so.8 b/man8/ld.so.8
index 2fbacae0..72e69f74 100644
--- a/man8/ld.so.8
+++ b/man8/ld.so.8
@@ -64,6 +64,8 @@ in the augmented library path.
 If, however, the binary was linked with the
 .B \-z nodeflib
 linker option, libraries in the default library paths are skipped.
+Libraries installed in hardware capability directories (see below)
+are preferred to other libraries.
 .IP o
 In the default path
 .IR /lib ,
@@ -129,6 +131,40 @@ is set-user-ID or set-group-ID.
 .TP
 .B \-\-audit LIST
 Use objects named in LIST as auditors.
+.SH HARDWARE CAPABILITIES
+Some libraries are compiled using hardware-specific instructions which do
+not exist on every CPU.
+Such libraries should be installed in directories whose names define the
+required hardware capabilities, such as
+.IR /usr/lib/sse2/ .
+The dynamic linker checks these directories against the hardware of the
+machine and selects the most suitable version of a given library.
+Hardware capability directories can be cascaded to combine CPU features.
+The list of supported hardware capability names depends on the CPU.
+The following names are currently recognized:
+.TP
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
1.7.10

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
