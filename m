From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] koi8-r.7: charset pages unification, minor cleanups
Date: Wed, 01 Oct 2014 11:05:54 +0200
Message-ID: <542BC3F2.4040604@gmail.com>
References: <542A8609.5030109@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <542A8609.5030109-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lefteris Dimitroulakis <edimitro-6VGm6rrshF0@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 09/30/2014 12:29 PM, Marko Myllynen wrote:
> - adjust references
> - remove stray comments, streamline description
>   (charsets(7) and Wikipedia provide more detailed
>    and up-to-date description)
> - list differences between koi8-r.7 vs koi8-u.7
> - cosmetics

Thanks, Marko. Applied (for the moment, in a local branch).

Cheers,

Michael


> ---
>  man7/koi8-r.7 |   43 ++++++++++++-------------------------------
>  1 files changed, 12 insertions(+), 31 deletions(-)
>=20
> diff --git a/man7/koi8-r.7 b/man7/koi8-r.7
> index 755392e..274ae21 100644
> --- a/man7/koi8-r.7
> +++ b/man7/koi8-r.7
> @@ -1,8 +1,6 @@
>  '\" t -*- coding: UTF-8 -*-
>  .\" Copyright 2001      Alexey Mahotkin <alexm-MqrojJxo3WQox3rIn2DAYQ@public.gmane.org>
>  .\"
> -.\" Lots of text ripped from http://koi8.pp.ru/
> -.\"
>  .\" %%%LICENSE_START(GPLv2+_DOC_FULL)
>  .\" This is free documentation; you can redistribute it and/or
>  .\" modify it under the terms of the GNU General Public License as
> @@ -25,31 +23,13 @@
>  .\" %%%LICENSE_END
>  .\"
>  .TH KOI8-R 7 2014-02-16 "Linux" "Linux Programmer's Manual"
> -.nh
>  .SH NAME
> -koi8-r \- Russian character set encoded in octal, decimal, and
> -hexadecimal
> +koi8-r \- Russian character set encoded in octal, decimal,
> +and hexadecimal
>  .SH DESCRIPTION
> -KOI8-R is the character set of choice for encoding Russian texts for
> -many UNIX-like operation systems.
> -KOI8-R is a successor for KOI-8, a
> -de-facto standard for Internet Mail, News, WWW, and other interactiv=
e
> -services at least all over the ex-SU territory.
> -.PP
> -KOI8-R is defined by RFC\ 1489 (Registration of a Cyrillic Character
> -Set).
> -.SH NOTES
> -KOI8-R was designed for mixed Russian/English texts and covers
> -only Russian Cyrillic characters,
> -so if you're looking for Cyrillic characters for Ukrainian,
> -Byelorussian, and so on,
> -try ISO-IR-111, or KOI8-U
> -(Ukrainian Character Set), or KOI8-C (for ancient Russian texts)
> -instead, which are identical to KOI8-R in the Russian Cyrillic lette=
rs
> -area.
> -.PP
> -A more complete set of Cyrillic characters is also defined by the
> -ISO-8859-5 character set.
> +RFC\ 1489 defines an 8-bit character set, KOI8-R.=20
> +KOI8-R encodes the
> +characters used in Russian.
>  .SS KOI8-R characters
>  The following table displays the characters in KOI8-R, which
>  are printable and unlisted in the
> @@ -196,11 +176,12 @@ T}
>  376	254	FE	=D0=A7	CYRILLIC CAPITAL LETTER CHE
>  377	255	FF	=D0=AA	CYRILLIC CAPITAL LETTER HARD SIGN
>  .TE
> +.SH NOTES
> +The differences with KOI8-U are in the hex positions
> +A4, A6, A7, AD, B4, B6, B7, and BD.
>  .SH SEE ALSO
>  .BR ascii (7),
> -.BR iso-8859-5 (7),
> -.BR koi8-u (7)
> -
> -RFC\ 1489,
> -.UR http://koi8.pp.ru/
> -.UE
> +.BR charsets (7),
> +.BR iso_8859-5 (7),
> +.BR koi8-u (7),
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
