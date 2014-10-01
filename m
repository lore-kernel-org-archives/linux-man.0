From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iso_8859-1.7: charset pages unification, minor cleanups
Date: Wed, 01 Oct 2014 10:59:18 +0200
Message-ID: <542BC266.6070706@gmail.com>
References: <542A8612.9060406@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <542A8612.9060406-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lefteris Dimitroulakis <edimitro-6VGm6rrshF0@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Marko,

This patch does not apply.

Could you take a look please.

Cheers,

Michael

On 09/30/2014 12:29 PM, Marko Myllynen wrote:
> - adjust references
> - remove stray comments, streamline description
>   (charsets(7) and Wikipedia provide more detailed
>    and up-to-date description)
> - cosmetics
> ---
>  man7/iso_8859-1.7 |   37 +++++++++++--------------------------
>  1 files changed, 11 insertions(+), 26 deletions(-)
>=20
> diff --git a/man7/iso_8859-1.7 b/man7/iso_8859-1.7
> index 0a77a1a..d48819f 100644
> --- a/man7/iso_8859-1.7
> +++ b/man7/iso_8859-1.7
> @@ -25,25 +25,14 @@
>  .\" Slightly rearranged, aeb, 950713
>  .\" Updated, dpo, 990531
>  .TH ISO_8859-1 7 2014-02-16 "Linux" "Linux Programmer's Manual"
> -.nh
>  .SH NAME
>  iso_8859-1 \- ISO 8859-1 character set encoded in octal, decimal,
>  and hexadecimal
>  .SH DESCRIPTION
>  The ISO 8859 standard includes several 8-bit extensions to the ASCII
>  character set (also known as ISO 646-IRV).
> -Especially important is
> -ISO 8859-1, the "Latin Alphabet No. 1", which has become widely
> -implemented and may already be seen as the de-facto standard ASCII
> -replacement.
> -.P
> -ISO 8859-1 supports the following languages: Afrikaans, Basque,
> -Catalan, Danish, Dutch, English, Faeroese, Finnish, French, Galician=
,
> -German, Icelandic, Irish, Italian, Norwegian, Portuguese, Scottish,
> -Spanish, and Swedish.
> -.P
> -Note that the ISO 8859-1 characters are also the first 256 character=
s
> -of ISO 10646 (Unicode).
> +ISO 8859-1 encodes the
> +characters used in many West European languages.
>  .SS ISO 8859 alphabets
>  The full set of ISO 8859 alphabets includes:
>  .TS
> @@ -65,14 +54,12 @@ ISO 8859-15	West European languages (Latin-9)
>  ISO 8859-16	Romanian (Latin-10)
>  .TE
>  .SS ISO 8859-1 characters
> -The following table displays the characters in ISO 8859-1 (Latin-1),
> -which are printable and unlisted in the
> +The following table displays the characters in ISO 8859-1, which
> +are printable and unlisted in the
>  .BR ascii (7)
>  manual page.
> -.\" The fourth column will only show the proper glyphs
> -.\" in an environment configured for ISO 8859-1.
>  .TS
> -l2 l2 l2 c2 lp-1.
> +l l l c lp-1.
>  Oct	Dec	Hex	Char	Description
>  _
>  240	160	A0	 	NO-BREAK SPACE
> @@ -88,7 +75,7 @@ _
>  252	170	AA	=AA	FEMININE ORDINAL INDICATOR
>  253	171	AB	=AB	LEFT-POINTING DOUBLE ANGLE QUOTATION MARK
>  254	172	AC	=AC	NOT SIGN
> -255	173	AD	=AD	SOFT HYPHEN (shown as a hyphen at line breaks) [1]
> +255	173	AD	=AD	SOFT HYPHEN
>  256	174	AE	=AE	REGISTERED SIGN
>  257	175	AF	=AF	MACRON
>  260	176	B0	=B0	DEGREE SIGN
> @@ -172,12 +159,10 @@ _
>  376	254	FE	=FE	LATIN SMALL LETTER THORN
>  377	255	FF	=FF	LATIN SMALL LETTER Y WITH DIAERESIS
>  .TE
> -.IP [1] 4
> -See
> -.BR groff_char (7)
> -(soft hyphen) and the standard ISO 8859-1 ("shy",
> -paragraph 6.3.3)
> -or the equivalent version from your national standardization body.
> +.SH NOTES
> +ISO 8859-1 is also known as Latin-1.
>  .SH SEE ALSO
>  .BR ascii (7),
> -.BR iso_8859-15 (7)
> +.BR charsets (7),
> +.BR iso_8859-15 (7),
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
