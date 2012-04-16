From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] ld.so.8: Document effect of hwcaps on search path
Date: Tue, 17 Apr 2012 08:39:49 +1200
Message-ID: <CAKgNAki+Dg_CDHXCRTqKVK0k_t+Xhh0ZArGX2zsO3Agk00SDPQ@mail.gmail.com>
References: <20111020070037.GA11392@elie.hsd1.il.comcast.net>
 <CAKgNAkgbcL3deJ4x0DEV==vtiAmYie7+Gw+c=K_dAJhWE4va1Q@mail.gmail.com>
 <20120416165806.GR5813@burratino> <CAKgNAkj0BAKbP6SrohCEG+eeEAZAYkJ6NA9Jvi0hS2j3e19mmg@mail.gmail.com>
 <20120416172408.GT5813@burratino> <CAKgNAkggZ1EZyBkkkd4xmJnjt-_kw=F_xb81+--gpQztvyD8oA@mail.gmail.com>
 <20120416190346.GX5813@burratino> <CAKgNAkjfcbiDiGqd1PNpdPcUTQBd+8qyrWZj3D6hnzU5vZdecA@mail.gmail.com>
 <20120416192703.GY5813@burratino>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120416192703.GY5813@burratino>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Petr Baudis <pasky-+ZI9xUNit7I@public.gmane.org>, Aurelien Jarno <aurelien-rXXEIb44qovR7s880joybQ@public.gmane.org>, Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, Apr 17, 2012 at 7:27 AM, Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> Wording by Aurelien Jarno from Debian glibc's r4701 (2011-06-04).
>
> Addresses http://bugs.debian.org/622385
>
> Requested-by: Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>
> Signed-off-by: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Thanks Jonathan. Applied for 3.39.

Cheers,

Michael


> ---
> Michael Kerrisk (man-pages) wrote:
>
>> Some minor formatting points:
>> * Please start new sentences on new lines.
> [and other useful feedback about the grammar and substance]
>
> Here goes.
>
> =A0man8/ld.so.8 | =A0 36 ++++++++++++++++++++++++++++++++++++
> =A01 file changed, 36 insertions(+)
>
> diff --git a/man8/ld.so.8 b/man8/ld.so.8
> index 2fbacae0..72e69f74 100644
> --- a/man8/ld.so.8
> +++ b/man8/ld.so.8
> @@ -64,6 +64,8 @@ in the augmented library path.
> =A0If, however, the binary was linked with the
> =A0.B \-z nodeflib
> =A0linker option, libraries in the default library paths are skipped.
> +Libraries installed in hardware capability directories (see below)
> +are preferred to other libraries.
> =A0.IP o
> =A0In the default path
> =A0.IR /lib ,
> @@ -129,6 +131,40 @@ is set-user-ID or set-group-ID.
> =A0.TP
> =A0.B \-\-audit LIST
> =A0Use objects named in LIST as auditors.
> +.SH HARDWARE CAPABILITIES
> +Some libraries are compiled using hardware-specific instructions whi=
ch do
> +not exist on every CPU.
> +Such libraries should be installed in directories whose names define=
 the
> +required hardware capabilities, such as
> +.IR /usr/lib/sse2/ .
> +The dynamic linker checks these directories against the hardware of =
the
> +machine and selects the most suitable version of a given library.
> +Hardware capability directories can be cascaded to combine CPU featu=
res.
> +The list of supported hardware capability names depends on the CPU.
> +The following names are currently recognized:
> +.TP
> +.B Alpha
> +ev4, ev5, ev56, ev6, ev67
> +.TP
> +.B MIPS
> +loongson2e, loongson2f, octeon, octeon2
> +.TP
> +.B PowerPC
> +4xxmac, altivec, arch_2_05, arch_2_06, booke, cellbe, dfp, efpdouble=
, efpsingle,
> +fpu, ic_snoop, mmu, notb, pa6t, power4, power5, power5+, power6x, pp=
c32, ppc601,
> +ppc64, smt, spe, ucache, vsx
> +.TP
> +.B SPARC
> +flush, muldiv, stbar, swap, ultra3, v9, v9v, v9v2
> +.TP
> +.B s390
> +dfp, eimm, esan3, etf3enh, g5, highgprs, hpage, ldisp, msa, stfle,
> +z900, z990, z9-109, z10, zarch
> +.TP
> +.TP
> +.B x86 (32-bit only)
> +acpi, apic, clflush, cmov, cx8, dts, fxsr, ht, i386, i486, i586, i68=
6, mca, mmx,
> +mtrr, pat, pbe, pge, pn, pse36, sep, ss, sse, sse2, tm
> =A0.SH ENVIRONMENT
> =A0There are four important environment variables.
> =A0.TP
> --
> 1.7.10
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
