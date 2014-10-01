From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iso_8859-5.7: charset pages unification, minor cleanups
Date: Wed, 01 Oct 2014 11:22:56 +0200
Message-ID: <542BC7F0.4060809@gmail.com>
References: <542A8628.6070400@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <542A8628.6070400-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lefteris Dimitroulakis <edimitro-6VGm6rrshF0@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 09/30/2014 12:30 PM, Marko Myllynen wrote:
> - adjust references
> - remove stray comments
> - cosmetics

Thanks, Marko. Patch fixed and applied (for the moment, in=20
a local branch).

Cheers,

Michael




> ---
>  man7/iso_8859-5.7 |   26 ++++++++++++++------------
>  1 files changed, 14 insertions(+), 12 deletions(-)
>=20
> diff --git a/man7/iso_8859-5.7 b/man7/iso_8859-5.7
> index e68deca..7159864 100644
> --- a/man7/iso_8859-5.7
> +++ b/man7/iso_8859-5.7
> @@ -29,7 +29,8 @@ and hexadecimal
>  .SH DESCRIPTION
>  The ISO 8859 standard includes several 8-bit extensions to the ASCII
>  character set (also known as ISO 646-IRV).
> -ISO 8859-5 encodes the Cyrillic alphabet as used in Russian and Mace=
donian.
> +ISO 8859-5 encodes the
> +Cyrillic characters used in many East European languages.
>  .SS ISO 8859 alphabets
>  The full set of ISO 8859 alphabets includes:
>  .TS
> @@ -55,15 +56,13 @@ The following table displays the characters in IS=
O 8859-5, which
>  are printable and unlisted in the
>  .BR ascii (7)
>  manual page.
> -.\" The fourth column will only show the proper glyphs
> -.\" in an environment configured for ISO 8859-5.
>  .TS
>  l l l c lp-1.
>  Oct	Dec	Hex	Char	Description
>  _
>  240	160	A0	 	NO-BREAK SPACE
>  241	161	A1	=D0=81	CYRILLIC CAPITAL LETTER IO
> -242	162	A2	=D0=82	CYRILLIC CAPITAL LETTER DJE (Serbocroatian)
> +242	162	A2	=D0=82	CYRILLIC CAPITAL LETTER DJE
>  243	163	A3	=D0=83	CYRILLIC CAPITAL LETTER GJE
>  244	164	A4	=D0=84	CYRILLIC CAPITAL LETTER UKRAINIAN IE
>  245	165	A5	=D0=85	CYRILLIC CAPITAL LETTER DZE
> @@ -72,14 +71,14 @@ CYRILLIC CAPITAL LETTER
>  .br
>  BYELORUSSIAN-UKRAINIAN I
>  T}
> -247	167	A7	=D0=87	CYRILLIC CAPITAL LETTER YI (Ukrainian)
> +247	167	A7	=D0=87	CYRILLIC CAPITAL LETTER YI
>  250	168	A8	=D0=88	CYRILLIC CAPITAL LETTER JE
>  251	169	A9	=D0=89	CYRILLIC CAPITAL LETTER LJE
>  252	170	AA	=D0=8A	CYRILLIC CAPITAL LETTER NJE
> -253	171	AB	=D0=8B	CYRILLIC CAPITAL LETTER TSHE (Serbocroatian)
> +253	171	AB	=D0=8B	CYRILLIC CAPITAL LETTER TSHE
>  254	172	AC	=D0=8C	CYRILLIC CAPITAL LETTER KJE
>  255	173	AD	=C2=AD	SOFT HYPHEN
> -256	174	AE	=D0=8E	CYRILLIC CAPITAL LETTER SHORT U (Byelorussian)
> +256	174	AE	=D0=8E	CYRILLIC CAPITAL LETTER SHORT U
>  257	175	AF	=D0=8F	CYRILLIC CAPITAL LETTER DZHE
>  260	176	B0	=D0=90	CYRILLIC CAPITAL LETTER A
>  261	177	B1	=D0=91	CYRILLIC CAPITAL LETTER BE
> @@ -147,21 +146,24 @@ T}
>  357	239	EF	=D1=8F	CYRILLIC SMALL LETTER YA
>  360	240	F0	=E2=84=96	NUMERO SIGN
>  361	241	F1	=D1=91	CYRILLIC SMALL LETTER IO
> -362	242	F2	=D1=92	CYRILLIC SMALL LETTER DJE (Serbocroatian)
> +362	242	F2	=D1=92	CYRILLIC SMALL LETTER DJE
>  363	243	F3	=D1=93	CYRILLIC SMALL LETTER GJE
>  364	244	F4	=D1=94	CYRILLIC SMALL LETTER UKRAINIAN IE
>  365	245	F5	=D1=95	CYRILLIC SMALL LETTER DZE
>  366	246	F6	=D1=96	CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I
> -367	247	F7	=D1=97	CYRILLIC SMALL LETTER YI (Ukrainian)
> +367	247	F7	=D1=97	CYRILLIC SMALL LETTER YI
>  370	248	F8	=D1=98	CYRILLIC SMALL LETTER JE
>  371	249	F9	=D1=99	CYRILLIC SMALL LETTER LJE
>  372	250	FA	=D1=9A	CYRILLIC SMALL LETTER NJE
> -373	251	FB	=D1=98	CYRILLIC SMALL LETTER TSHE (Serbocroatian)
> +373	251	FB	=D1=98	CYRILLIC SMALL LETTER TSHE
>  374	252	FC	=D1=9C	CYRILLIC SMALL LETTER KJE
>  375	253	FD	=C2=A7	SECTION SIGN
> -376	254	FE	=D1=9E	CYRILLIC SMALL LETTER SHORT U (Byelorussian)
> +376	254	FE	=D1=9E	CYRILLIC SMALL LETTER SHORT U
>  377	255	FF	=D1=9F	CYRILLIC SMALL LETTER DZHE
>  .TE
>  .SH SEE ALSO
>  .BR ascii (7),
> -.BR koi8-r (7)
> +.BR charsets (7),
> +.BR koi8-r (7),
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
