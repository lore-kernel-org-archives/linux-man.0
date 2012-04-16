From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] ld.so.8: Document effect of hwcaps on search path
Date: Tue, 17 Apr 2012 07:19:02 +1200
Message-ID: <CAKgNAkjfcbiDiGqd1PNpdPcUTQBd+8qyrWZj3D6hnzU5vZdecA@mail.gmail.com>
References: <20111020070037.GA11392@elie.hsd1.il.comcast.net>
 <CAKgNAkgbcL3deJ4x0DEV==vtiAmYie7+Gw+c=K_dAJhWE4va1Q@mail.gmail.com>
 <20120416165806.GR5813@burratino> <CAKgNAkj0BAKbP6SrohCEG+eeEAZAYkJ6NA9Jvi0hS2j3e19mmg@mail.gmail.com>
 <20120416172408.GT5813@burratino> <CAKgNAkggZ1EZyBkkkd4xmJnjt-_kw=F_xb81+--gpQztvyD8oA@mail.gmail.com>
 <20120416190346.GX5813@burratino>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120416190346.GX5813@burratino>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Petr Baudis <pasky-+ZI9xUNit7I@public.gmane.org>, Aurelien Jarno <aurelien-rXXEIb44qovR7s880joybQ@public.gmane.org>, Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Jonathan,

On Tue, Apr 17, 2012 at 7:03 AM, Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> Wording by Aurelien Jarno from Debian glibc's r4701 (2011-06-04).
>
> Addresses http://bugs.debian.org/622385
>
> Requested-by: Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>
> Signed-off-by: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Michael Kerrisk (man-pages) wrote:
>
>> IIUC, your purpose is to allow Debian to drop downstream ld.so.8, by
>> ensuring that upstream ld.so.8 has everything that useful from the
>> downstream (purpose 1).
>
> Let's just handle them as isolated patches. =A0This one comes from
> Debian and the text matches what I get with "man ld.so" on a Debian
> system. =A0Since v1, I have rebased it against "master" and rewrapped=
 to
> use 76-character instead of 80-character lines.

Some minor formatting points:
* Please start new sentences on new lines.
* I strongly prefer the forms .B, .I, etc. over \fB...\fP, etc. Also,
the particular case here if a pathname should be formatted italic.

Could you please tweak as above and resend.

See also comments below.

>
> =A0man8/ld.so.8 | =A0 33 +++++++++++++++++++++++++++++++++
> =A01 file changed, 33 insertions(+)
>
> diff --git a/man8/ld.so.8 b/man8/ld.so.8
> index 2fbacae0..c0084376 100644
> --- a/man8/ld.so.8
> +++ b/man8/ld.so.8
> @@ -64,6 +64,8 @@ in the augmented library path.
> =A0If, however, the binary was linked with the
> =A0.B \-z nodeflib
> =A0linker option, libraries in the default library paths are skipped.
> +Libraries installed in hardware capabilities directories (see below)
> +are preferred to other libraries.
> =A0.IP o
> =A0In the default path
> =A0.IR /lib ,
> @@ -129,6 +131,37 @@ is set-user-ID or set-group-ID.
> =A0.TP
> =A0.B \-\-audit LIST
> =A0Use objects named in LIST as auditors.
> +.SH HARDWARE CAPABILITIES
> +Libraries might be compiled using hardware-specific instructions whi=
ch do
> +not exist on every CPU. Such libraries should be installed in direct=
ories
> +whose name defines the hardware capabilities such as \fB/usr/lib/sse=
2/\fR.

name defines =3D=3D> names define

> +The dynamic linker checks these directories against the hardware of =
the
> +machine and selects the best suitable version of a given library. Ha=
rdware

best suitable =3D=3D> most suitable

> +capabilities directories could be cascaded to combine CPU features. =
Hardware

"could be"? Should this be "can be"?

> +capabilities depends on the CPU. The following names are currently

depends =3D=3D> depend

> +recognized:
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

Thanks,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
