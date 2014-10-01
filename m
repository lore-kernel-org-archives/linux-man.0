From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iso_8859-15.7: charset pages unification, minor cleanups
Date: Wed, 01 Oct 2014 11:24:17 +0200
Message-ID: <542BC841.9010204@gmail.com>
References: <542A865A.5070907@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <542A865A.5070907-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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
(Patch did not apply cleanly, but I fixed it.)

Cheers,

Michael


> ---
>  man7/iso_8859-15.7 |   29 +++++++++--------------------
>  1 files changed, 9 insertions(+), 20 deletions(-)
>=20
> diff --git a/man7/iso_8859-15.7 b/man7/iso_8859-15.7
> index 1175796..30cb655 100644
> --- a/man7/iso_8859-15.7
> +++ b/man7/iso_8859-15.7
> @@ -24,27 +24,14 @@
>  .\" %%%LICENSE_END
>  .\"
>  .TH ISO_8859-15 7 2014-02-16 "Linux" "Linux Programmer's Manual"
> -.nh
>  .SH NAME
>  iso_8859-15 \- ISO 8859-15 character set encoded in octal, decimal,
>  and hexadecimal
>  .SH DESCRIPTION
>  The ISO 8859 standard includes several 8-bit extensions to the ASCII
>  character set (also known as ISO 646-IRV).
> -Especially important is
> -ISO 8859-1, the "Latin Alphabet No. 1", which has become widely
> -implemented and may already be seen as the de-facto standard ASCII
> -replacement.
> -However, it lacks the EURO symbol and does not fully
> -cover Finnish and French.
> -ISO 8859-15 is a modification of ISO 8859-1
> -that covers these needs.
> -.P
> -ISO 8859-15 supports the following languages: Albanian, Basque, Bret=
on,
> -Catalan, Danish, Dutch, English, Estonian, Faroese, Finnish, French,
> -Frisian, Galician, German, Greenlandic, Icelandic, Irish Gaelic,
> -Italian, Latin, Luxemburgish, Norwegian, Portuguese, Rhaeto-Romanic,
> -Scottish Gaelic, Spanish, and Swedish.
> +ISO 8859-15 encodes the
> +characters used in many West European languages and adds the Euro si=
gn.
>  .SS ISO 8859 alphabets
>  The full set of ISO 8859 alphabets includes:
>  .TS
> @@ -66,12 +53,10 @@ ISO 8859-15	West European languages (Latin-9)
>  ISO 8859-16	Romanian (Latin-10)
>  .TE
>  .SS ISO 8859-15 characters
> -The following table displays the characters in ISO 8859-15 (Latin-9)=
,
> -which are printable and unlisted in the
> +The following table displays the characters in ISO 8859-15, which
> +are printable and unlisted in the
>  .BR ascii (7)
>  manual page.
> -.\" The fourth column will only show the proper glyphs
> -.\" in an environment configured for ISO 8859-15.
>  .TS
>  l l l c lp-1.
>  Oct	Dec	Hex	Char	Description
> @@ -173,6 +158,10 @@ _
>  376	254	FE	=FE	LATIN SMALL LETTER THORN
>  377	255	FF	=FF	LATIN SMALL LETTER Y WITH DIAERESIS
>  .TE
> +.SH NOTES
> +ISO 8859-15 is also known as Latin-9 (or sometimes as Latin-0).
>  .SH SEE ALSO
>  .BR ascii (7),
> -.BR iso_8859-1 (7)
> +.BR charsets (7),
> +.BR iso_8859-1 (7),
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
