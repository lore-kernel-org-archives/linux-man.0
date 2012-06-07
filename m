From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch], iso_8859-*.7: Explanation of SOFT HYPHEN and the code
 for it
Date: Fri, 8 Jun 2012 00:08:26 +1200
Message-ID: <CAKgNAkiw4yhNMM2vHdQ4yd2u_T0tLd34wpmUbuH9_ndPpEsg6Q@mail.gmail.com>
References: <20120510194231.GA13127@rhi.hi.is>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120510194231.GA13127-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Bjarni,

On Fri, May 11, 2012 at 7:42 AM, Bjarni Ingi Gislason
<bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org> wrote:
> Package: man-pages
> Version: 3.40
> Severity: minor
> Tags: patch
>
> =A0From "groff -ww ...":
>
> <groff: iso_8859-2.7>:89: warning: can't find special character `shc'
>
> =A0This is the only "iso_8859-*.7" file that has this (now)
> undefined character. =A0The code in column four in "iso_8859-1.7" is
> "0x2D" ("HYPHEN, MINUS SIGN" or "HYPHEN-MINUS") instead of "0xAD".
> See Debian bug 156154 (or package "manpages").
>
> =A0There should be an explanation for this graphic character and the
> code should be 0xAD in iso_8859-1.7 (as in all others), even though
> "[gn]roff" does not display a "HYPHEN" in that position of the table.
>
> =A0The line with "SOFT HYPHEN" gets a footnote and a short
> explanation. =A0The footnote is from the official ISO standard.
>
> =A0Suggested patch for one of the files:

Is there any reason that the explanation should be added to only one
of the files? I'm somewhat inclined just to change the character, and
not add the explanation (so that this page is similar to the others).

Cheers,

Michael



> --- iso_8859-1.7 =A0 =A0 =A0 =A02012-04-26 22:58:39.000000000 +0000
> +++ iso_8859-1.7.new =A0 =A02012-05-10 16:01:39.000000000 +0000
> @@ -71,7 +71,7 @@
> =A0The fourth column will only show the proper glyphs
> =A0in an environment configured for ISO 8859-1.
> =A0.TS
> -l l l c lp-1.
> +l2 l2 l2 c2 lp-1.
> =A0Oct =A0 =A0Dec =A0 =A0 Hex =A0 =A0 Char =A0 =A0Description
> =A0_
> =A0240 =A0 =A0160 =A0 =A0 A0 =A0 =A0 =A0=A0 =A0 =A0 =A0 NO-BREAK SPAC=
E
> @@ -87,7 +87,7 @@
> =A0252 =A0 =A0170 =A0 =A0 AA =A0 =A0 =A0=AA =A0 =A0 =A0 FEMININE ORDI=
NAL INDICATOR
> =A0253 =A0 =A0171 =A0 =A0 AB =A0 =A0 =A0=AB =A0 =A0 =A0 LEFT-POINTING=
 DOUBLE ANGLE QUOTATION MARK
> =A0254 =A0 =A0172 =A0 =A0 AC =A0 =A0 =A0=AC =A0 =A0 =A0 NOT SIGN
> -255 =A0 =A0173 =A0 =A0 AD =A0 =A0 =A0- =A0 =A0 =A0 SOFT HYPHEN
> +255 =A0 =A0173 =A0 =A0 AD =A0 =A0 =A0=AD =A0 =A0 =A0 SOFT HYPHEN (sh=
own as a hyphen at line breaks)=B9
> =A0256 =A0 =A0174 =A0 =A0 AE =A0 =A0 =A0=AE =A0 =A0 =A0 REGISTERED SI=
GN
> =A0257 =A0 =A0175 =A0 =A0 AF =A0 =A0 =A0=AF =A0 =A0 =A0 MACRON
> =A0260 =A0 =A0176 =A0 =A0 B0 =A0 =A0 =A0=B0 =A0 =A0 =A0 DEGREE SIGN
> @@ -171,6 +171,11 @@
> =A0376 =A0 =A0254 =A0 =A0 FE =A0 =A0 =A0=FE =A0 =A0 =A0 LATIN SMALL L=
ETTER THORN
> =A0377 =A0 =A0255 =A0 =A0 FF =A0 =A0 =A0=FF =A0 =A0 =A0 LATIN SMALL L=
ETTER Y WITH DIAERESIS
> =A0.TE
> + =A0=B9 A graphic character that is imaged by a graphic symbol
> +identical with, or similar to, that representing HYPHEN, for use
> +when a line break has been established wihin a word.
> +.BR "ISO 8859-1:1987" ,
> +paragraph 6.3.3.
> =A0.SH "SEE ALSO"
> =A0.BR ascii (7),
> =A0.BR iso_8859-15 (7)
>
> --
> Bjarni I. Gislason



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
