From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iso_8859-16.7: charset pages unification, minor cleanups
Date: Wed, 01 Oct 2014 11:24:20 +0200
Message-ID: <542BC844.4070909@gmail.com>
References: <542A865F.1030302@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <542A865F.1030302-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lefteris Dimitroulakis <edimitro-6VGm6rrshF0@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 09/30/2014 12:30 PM, Marko Myllynen wrote:
> - adjust references
> - remove stray comments, streamline description
>   (charsets(7) and Wikipedia provide more detailed
>    and up-to-date description)
> - cosmetics


Thanks, Marko. Applied (for the moment, in a local branch).

Cheers,

Michael

> ---
>  man7/iso_8859-16.7 |   31 +++++++++----------------------
>  1 files changed, 9 insertions(+), 22 deletions(-)
>=20
> diff --git a/man7/iso_8859-16.7 b/man7/iso_8859-16.7
> index 3d72739..662e4aa 100644
> --- a/man7/iso_8859-16.7
> +++ b/man7/iso_8859-16.7
> @@ -23,23 +23,14 @@
>  .\" %%%LICENSE_END
>  .\"
>  .TH ISO_8859-16 7 2014-02-16 "Linux" "Linux Programmer's Manual"
> -.nh
>  .SH NAME
>  iso_8859-16 \- ISO 8859-16 character set encoded in octal, decimal,
>  and hexadecimal
>  .SH DESCRIPTION
>  The ISO 8859 standard includes several 8-bit extensions to the ASCII
>  character set (also known as ISO 646-IRV).
> -ISO 8859-16, the "Latin
> -Alphabet No. 10" is used to encode Central and Eastern European Lati=
n
> -characters and is not implemented yet by any program vendors.
> -.P
> -ISO 8859-16 supports the following languages: Albanian, Bosnian,
> -Croatian, English, Finnish, German, Hungarian, Irish, Polish,
> -Romanian, Slovenian, and Serbian.
> -.P
> -Also note that the following Cyrillic-based languages have one-to-on=
e
> -transliterations to Latin 10: Macedonian and Serbian.
> +ISO 8859-16 encodes the
> +Latin characters used in Southeast European languages.
>  .SS ISO 8859 alphabets
>  The full set of ISO 8859 alphabets includes:
>  .TS
> @@ -61,12 +52,10 @@ ISO 8859-15	West European languages (Latin-9)
>  ISO 8859-16	Romanian (Latin-10)
>  .TE
>  .SS ISO 8859-16 characters
> -The following table displays the characters in ISO 8859-16 (Latin-10=
),
> -which are printable and unlisted in the
> +The following table displays the characters in ISO 8859-16, which
> +are printable and unlisted in the
>  .BR ascii (7)
>  manual page.
> -.\" The fourth column will only show the proper glyphs
> -.\" in an environment configured for ISO 8859-16.
>  .TS
>  l l l c lp-1.
>  Oct	Dec	Hex	Char	Description
> @@ -168,12 +157,10 @@ _
>  376	254	FE	=C8=9B	LATIN SMALL LETTER T WITH COMMA BELOW
>  377	255	FF	=C3=BF	LATIN SMALL LETTER Y WITH DIAERESIS
>  .TE
> +.SH NOTES
> +ISO 8859-16 is also known as Latin-10.
>  .SH SEE ALSO
>  .BR ascii (7),
> -.BR iso_8859-1 (7),
> -.BR iso_8859-15 (7),
> -.BR iso_8859-2 (7)
> -
> -.I ISO 8859-16 (Latin 10) Resources
> -.UR http://bucovina.chem.tue.nl\:/fonturi\:/index-en.html
> -.UE .
> +.BR charsets (7),
> +.BR iso_8859-3 (7),
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
