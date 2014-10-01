From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iso_8859-10.7: charset pages unification, minor cleanups
Date: Wed, 01 Oct 2014 11:24:02 +0200
Message-ID: <542BC832.3090707@gmail.com>
References: <542A8644.10105@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <542A8644.10105-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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
>  man7/iso_8859-10.7 |   25 +++++++++++--------------
>  1 files changed, 11 insertions(+), 14 deletions(-)
>=20
> diff --git a/man7/iso_8859-10.7 b/man7/iso_8859-10.7
> index 519b0da..f2430f2 100644
> --- a/man7/iso_8859-10.7
> +++ b/man7/iso_8859-10.7
> @@ -31,9 +31,6 @@ The ISO 8859 standard includes several 8-bit extens=
ions to the ASCII
>  character set (also known as ISO 646-IRV).
>  ISO 8859-10 encodes the
>  characters used in Nordic languages.
> -.\" (Though in my system with glibc-2.8-20080929
> -.\" I found only lg_UG using this charset, and certainly UG
> -.\" is not a "Nordic" country!).
>  .SS ISO 8859 alphabets
>  The full set of ISO 8859 alphabets includes:
>  .TS
> @@ -59,8 +56,6 @@ The following table displays the characters in ISO =
8859-10, which
>  are printable and unlisted in the
>  .BR ascii (7)
>  manual page.
> -.\" The fourth column will only show the proper glyphs
> -.\" in an environment configured for ISO 8859-10.
>  .TS
>  l l l c lp-1.
>  Oct	Dec	Hex	Char	Description
> @@ -80,7 +75,7 @@ _
>  254	172	AC	=C5=BD	LATIN CAPITAL LETTER Z WITH CARON
>  255	173	AD	=C2=AD	SOFT HYPHEN
>  256	174	AE	=C5=AA	LATIN CAPITAL LETTER U WITH MACRON
> -257	175	AF	=C5=8A	LATIN CAPITAL LETTER ENG (Sami)
> +257	175	AF	=C5=8A	LATIN CAPITAL LETTER ENG
>  260	176	B0	=C2=B0	DEGREE SIGN
>  261	177	B1	=C4=85	LATIN SMALL LETTER A WITH OGONEK
>  262	178	B2	=C4=93	LATIN SMALL LETTER E WITH MACRON
> @@ -96,7 +91,7 @@ _
>  274	188	BC	=C5=BE	LATIN SMALL LETTER Z WITH CARON
>  275	189	BD	=E2=80=95	HORIZONTAL BAR
>  276	190	BE	=C5=AB	LATIN SMALL LETTER U WITH MACRON
> -277	191	BF	=C5=8B	LATIN SMALL LETTER ENG (Sami)
> +277	191	BF	=C5=8B	LATIN SMALL LETTER ENG
>  300	192	C0	=C4=80	LATIN CAPITAL LETTER A WITH MACRON
>  301	193	C1	=C3=81	LATIN CAPITAL LETTER A WITH ACUTE
>  302	194	C2	=C3=82	LATIN CAPITAL LETTER A WITH CIRCUMFLEX
> @@ -113,7 +108,7 @@ _
>  315	205	CD	=C3=8D	LATIN CAPITAL LETTER I WITH ACUTE
>  316	206	CE	=C3=8E	LATIN CAPITAL LETTER I WITH CIRCUMFLEX
>  317	207	CF	=C3=8F	LATIN CAPITAL LETTER I WITH DIAERESIS
> -320	208	D0	=C3=90	LATIN CAPITAL LETTER ETH (Icelandic)
> +320	208	D0	=C3=90	LATIN CAPITAL LETTER ETH
>  321	209	D1	=C5=85	LATIN CAPITAL LETTER N WITH CEDILLA
>  322	210	D2	=C5=8C	LATIN CAPITAL LETTER O WITH MACRON
>  323	211	D3	=C3=93	LATIN CAPITAL LETTER O WITH ACUTE
> @@ -127,8 +122,8 @@ _
>  333	219	DB	=C3=9B	LATIN CAPITAL LETTER U WITH CIRCUMFLEX
>  334	220	DC	=C3=9C	LATIN CAPITAL LETTER U WITH DIAERESIS
>  335	221	DD	=C3=9D	LATIN CAPITAL LETTER Y WITH ACUTE
> -336	222	DE	=C3=9E	LATIN CAPITAL LETTER THORN (Icelandic)
> -337	223	DF	=C3=9F	LATIN SMALL LETTER SHARP S (German)
> +336	222	DE	=C3=9E	LATIN CAPITAL LETTER THORN
> +337	223	DF	=C3=9F	LATIN SMALL LETTER SHARP S
>  340	224	E0	=C4=81	LATIN SMALL LETTER A WITH MACRON
>  341	225	E1	=C3=A1	LATIN SMALL LETTER A WITH ACUTE
>  342	226	E2	=C3=A2	LATIN SMALL LETTER A WITH CIRCUMFLEX
> @@ -145,7 +140,7 @@ _
>  355	237	ED	=C3=AD	LATIN SMALL LETTER I WITH ACUTE
>  356	238	EE	=C3=AE	LATIN SMALL LETTER I WITH CIRCUMFLEX
>  357	239	EF	=C3=AF	LATIN SMALL LETTER I WITH DIAERESIS
> -360	240	F0	=C3=B0	LATIN SMALL LETTER ETH (Icelandic)
> +360	240	F0	=C3=B0	LATIN SMALL LETTER ETH
>  361	241	F1	=C5=86	LATIN SMALL LETTER N WITH CEDILLA
>  362	242	F2	=C5=8D	LATIN SMALL LETTER O WITH MACRON
>  363	243	F3	=C3=B3	LATIN SMALL LETTER O WITH ACUTE
> @@ -159,10 +154,12 @@ _
>  373	251	FB	=C3=BB	LATIN SMALL LETTER U WITH CIRCUMFLEX
>  374	252	FC	=C3=BC	LATIN SMALL LETTER U WITH DIAERESIS
>  375	253	FD	=C3=BD	LATIN SMALL LETTER Y WITH ACUTE
> -376	254	FE	=C3=BE	LATIN SMALL LETTER THORN (Icelandic)
> -377	255	FF	=C4=B8	LATIN SMALL LETTER KRA (Greenlandic)
> +376	254	FE	=C3=BE	LATIN SMALL LETTER THORN
> +377	255	FF	=C4=B8	LATIN SMALL LETTER KRA
>  .TE
>  .SH NOTES
>  ISO 8859-10 is also known as Latin-6.
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
