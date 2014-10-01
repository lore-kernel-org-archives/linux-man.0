From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iso_8859-4.7: charset pages unification, minor cleanups
Date: Wed, 01 Oct 2014 11:22:51 +0200
Message-ID: <542BC7EB.60706@gmail.com>
References: <542A8623.3040808@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <542A8623.3040808-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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
>  man7/iso_8859-4.7 |   22 ++++++++++++----------
>  1 files changed, 12 insertions(+), 10 deletions(-)
>=20
> diff --git a/man7/iso_8859-4.7 b/man7/iso_8859-4.7
> index 0bd60b4..f0bbb47 100644
> --- a/man7/iso_8859-4.7
> +++ b/man7/iso_8859-4.7
> @@ -29,8 +29,8 @@ and hexadecimal
>  .SH DESCRIPTION
>  The ISO 8859 standard includes several 8-bit extensions to the ASCII
>  character set (also known as ISO 646-IRV).
> -ISO 8859-4 encodes the characters used in
> -Scandinavian and Baltic languages (Latin-4).
> +ISO 8859-4 encodes the
> +characters used in Scandinavian and Baltic languages.
>  .SS ISO 8859 alphabets
>  The full set of ISO 8859 alphabets includes:
>  .TS
> @@ -56,8 +56,6 @@ The following table displays the characters in ISO =
8859-4, which
>  are printable and unlisted in the
>  .BR ascii (7)
>  manual page.
> -.\" The fourth column will only show the proper glyphs
> -.\" in an environment configured for ISO 8859-4.
>  .TS
>  l l l c lp-1.
>  Oct	Dec	Hex	Char	Description
> @@ -85,15 +83,15 @@ _
>  264	180	B4	=C2=B4	ACUTE ACCENT
>  265	181	B5	=C4=A9	LATIN SMALL LETTER I WITH TILDE
>  266	182	B6	=C4=BC	LATIN SMALL LETTER L WITH CEDILLA
> -267	183	B7	=CB=87	CARON (Mandarin Chinese third tone)
> +267	183	B7	=CB=87	CARON
>  270	184	B8	=C2=B8	CEDILLA
>  271	185	B9	=C5=A1	LATIN SMALL LETTER S WITH CARON
>  272	186	BA	=C4=93	LATIN SMALL LETTER E WITH MACRON
>  273	187	BB	=C4=A3	LATIN SMALL LETTER G WITH CEDILLA
>  274	188	BC	=C5=A7	LATIN SMALL LETTER T WITH STROKE
> -275	189	BD	=C5=8A	LATIN CAPITAL LETTER ENG (Sami)
> +275	189	BD	=C5=8A	LATIN CAPITAL LETTER ENG
>  276	190	BE	=C5=BE	LATIN SMALL LETTER Z WITH CARON
> -277	191	BF	=C5=8B	LATIN SMALL LETTER ENG (Sami)
> +277	191	BF	=C5=8B	LATIN SMALL LETTER ENG
>  300	192	C0	=C4=80	LATIN CAPITAL LETTER A WITH MACRON
>  301	193	C1	=C3=81	LATIN CAPITAL LETTER A WITH ACUTE
>  302	194	C2	=C3=82	LATIN CAPITAL LETTER A WITH CIRCUMFLEX
> @@ -125,7 +123,7 @@ _
>  334	220	DC	=C3=9C	LATIN CAPITAL LETTER U WITH DIAERESIS
>  335	221	DD	=C5=A8	LATIN CAPITAL LETTER U WITH TILDE
>  336	222	DE	=C5=AA	LATIN CAPITAL LETTER U WITH MACRON
> -337	223	DF	=C3=9F	LATIN SMALL LETTER SHARP S (German)
> +337	223	DF	=C3=9F	LATIN SMALL LETTER SHARP S
>  340	224	E0	=C4=81	LATIN SMALL LETTER A WITH MACRON
>  341	225	E1	=C3=A1	LATIN SMALL LETTER A WITH ACUTE
>  342	226	E2	=C3=A2	LATIN SMALL LETTER A WITH CIRCUMFLEX
> @@ -157,7 +155,11 @@ _
>  374	252	FC	=C3=BC	LATIN SMALL LETTER U WITH DIAERESIS
>  375	253	FD	=C5=A9	LATIN SMALL LETTER U WITH TILDE
>  376	254	FE	=C5=AB	LATIN SMALL LETTER U WITH MACRON
> -377	255	FF	=CB=99	DOT ABOVE (Mandarin Chinese light tone)
> +377	255	FF	=CB=99	DOT ABOVE
>  .TE
> +.SH NOTES
> +ISO 8859-4 is also known as Latin-4.
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
