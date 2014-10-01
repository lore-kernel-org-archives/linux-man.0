From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iso_8859-3.7: charset pages unification, minor cleanups
Date: Wed, 01 Oct 2014 11:22:47 +0200
Message-ID: <542BC7E7.2080806@gmail.com>
References: <542A861D.5060705@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <542A861D.5060705-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lefteris Dimitroulakis <edimitro-6VGm6rrshF0@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 09/30/2014 12:29 PM, Marko Myllynen wrote:
> - adjust references
> - remove stray comments
> - cosmetics

Thanks, Marko. Applied (for the moment, in a local branch).

Cheers,

Michael


> ---
>  man7/iso_8859-3.7 |   16 +++++++---------
>  1 files changed, 7 insertions(+), 9 deletions(-)
>=20
> diff --git a/man7/iso_8859-3.7 b/man7/iso_8859-3.7
> index 6f8191f..ed7a7f7 100644
> --- a/man7/iso_8859-3.7
> +++ b/man7/iso_8859-3.7
> @@ -23,16 +23,14 @@
>  .\" %%%LICENSE_END
>  .\"
>  .TH ISO_8859-3 7 2014-02-16 "Linux" "Linux Programmer's Manual"
> -.nh
>  .SH NAME
>  iso_8859-3 \- ISO 8859-3 character set encoded in octal, decimal,
>  and hexadecimal
>  .SH DESCRIPTION
>  The ISO 8859 standard includes several 8-bit extensions to the ASCII
>  character set (also known as ISO 646-IRV).
> -ISO 8859-3 encodes the characters used in Southeast European languag=
es.
> -.\" (Though in my system with glibc-2.8-20080929
> -.\" I found only mt_MT (Malta) using this charset).
> +ISO 8859-3 encodes the
> +characters used in certain Southeast European languages.
>  .SS ISO 8859 alphabets
>  The full set of ISO 8859 alphabets includes:
>  .TS
> @@ -58,8 +56,6 @@ The following table displays the characters in ISO =
8859-3, which
>  are printable and unlisted in the
>  .BR ascii (7)
>  manual page.
> -.\" The fourth column will only show the proper glyphs
> -.\" in an environment configured for ISO 8859-3.
>  .TS
>  l l l c lp-1.
>  Oct	Dec	Hex	Char	Description
> @@ -122,7 +118,7 @@ _
>  334	220	DC	=C3=9C	LATIN CAPITAL LETTER U WITH DIAERESIS
>  335	221	DD	=C5=AC	LATIN CAPITAL LETTER U WITH BREVE
>  336	222	DE	=C5=9C	LATIN CAPITAL LETTER S WITH CIRCUMFLEX
> -337	223	DF	=C3=9F	LATIN SMALL LETTER SHARP S (German)
> +337	223	DF	=C3=9F	LATIN SMALL LETTER SHARP S
>  340	224	E0	=C3=A0	LATIN SMALL LETTER A WITH GRAVE
>  341	225	E1	=C3=A1	LATIN SMALL LETTER A WITH ACUTE
>  342	226	E2	=C3=A2	LATIN SMALL LETTER A WITH CIRCUMFLEX
> @@ -152,9 +148,11 @@ _
>  374	252	FC	=C3=BC	LATIN SMALL LETTER U WITH DIAERESIS
>  375	253	FD	=C5=AD	LATIN SMALL LETTER U WITH BREVE
>  376	254	FE	=C5=9D	LATIN SMALL LETTER S WITH CIRCUMFLEX
> -377	255	FF	=CB=99	DOT ABOVE (Mandarin Chinese light tone)
> +377	255	FF	=CB=99	DOT ABOVE
>  .TE
>  .SH NOTES
>  ISO 8859-3 is also known as Latin-3.
>  .SH SEE ALSO
> -.BR ascii (7)
> +.BR ascii (7),
> +.BR charsets (7),
> +.BR utf-8 (7)
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
