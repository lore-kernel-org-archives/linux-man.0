From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iso_8859-9.7: charset pages unification, minor cleanups
Date: Wed, 01 Oct 2014 11:23:58 +0200
Message-ID: <542BC82E.5030803@gmail.com>
References: <542A863E.4000400@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <542A863E.4000400-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lefteris Dimitroulakis <edimitro-6VGm6rrshF0@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 09/30/2014 12:30 PM, Marko Myllynen wrote:
> - adjust references
> - remove stray comments
> - cosmetics

Thanks, Marko. Applied (for the moment, in a local branch).

Cheers,

Michael



> ---
>  man7/iso_8859-9.7 |   17 +++++++++--------
>  1 files changed, 9 insertions(+), 8 deletions(-)
>=20
> diff --git a/man7/iso_8859-9.7 b/man7/iso_8859-9.7
> index fd48747..977a366 100644
> --- a/man7/iso_8859-9.7
> +++ b/man7/iso_8859-9.7
> @@ -23,15 +23,14 @@
>  .\" %%%LICENSE_END
>  .\"
>  .TH ISO_8859-9 7 2014-02-16 "Linux" "Linux Programmer's Manual"
> -.nh
>  .SH NAME
>  iso_8859-9 \- ISO 8859-9 character set encoded in octal, decimal,
>  and hexadecimal
>  .SH DESCRIPTION
>  The ISO 8859 standard includes several 8-bit extensions to the ASCII
>  character set (also known as ISO 646-IRV).
> -ISO 8859-9, also known as
> -the "Latin Alphabet No. 5", encodes the characters used in Turkish.
> +ISO 8859-9 encodes the
> +characters used in Turkish.
>  .SS ISO 8859 alphabets
>  The full set of ISO 8859 alphabets includes:
>  .TS
> @@ -53,12 +52,10 @@ ISO 8859-15	West European languages (Latin-9)
>  ISO 8859-16	Romanian (Latin-10)
>  .TE
>  .SS ISO 8859-9 characters
> -The following table displays the characters in ISO 8859-9 (Latin-5),
> -which are printable and unlisted in the
> +The following table displays the characters in ISO 8859-9, which
> +are printable and unlisted in the
>  .BR ascii (7)
>  manual page.
> -.\" The fourth column will only show the proper glyphs
> -.\" in an environment configured for ISO 8859-9.
>  .TS
>  l l l c lp-1.
>  Oct	Dec	Hex	Char	Description
> @@ -160,5 +157,9 @@ _
>  376	254	FE	=C5=9F	LATIN SMALL LETTER S WITH CEDILLA
>  377	255	FF	=C3=BF	LATIN SMALL LETTER Y WITH DIAERESIS
>  .TE
> +.SH NOTES
> +ISO 8859-9 is also known as Latin-5.
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
