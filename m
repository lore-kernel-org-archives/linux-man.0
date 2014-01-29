From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] man-pages.7: pfix
Date: Wed, 29 Jan 2014 11:06:32 +0100
Message-ID: <52E8D2A8.4080208@gmail.com>
References: <1390863188-8704-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390863188-8704-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, David.

Applied.

Cheers

Michael


On 01/27/2014 11:53 PM, David Pr=E9vot wrote:
> ---
>  man7/man-pages.7 | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/man7/man-pages.7 b/man7/man-pages.7
> index 3fa232d..5430297 100644
> --- a/man7/man-pages.7
> +++ b/man7/man-pages.7
> @@ -621,7 +621,7 @@ system port
>  T}
>  real-time	T{
>  realtime,
> -real-time
> +real time
>  T}
>  run time	runtime
>  saved set-group-ID	T{
> @@ -646,7 +646,8 @@ username	user name
>  zeros	zeroes
>  .TE
>  .ad
> -.PP See also the discussion
> +.PP
> +See also the discussion
>  .IR "Hyphenation of attributive compounds"
>  below.
>  .SS Terms to avoid
> @@ -744,7 +745,7 @@ Em-dashes should be written
>  surrounding spaces.
>  .SS Hyphenation of attributive compounds
>  Compound terms should be hyphenated when used attributively
> -(i.e., to qualify a following noun) Some examples:
> +(i.e., to qualify a following noun). Some examples:
> =20
>      32-bit value
>      command-line argument
> @@ -795,7 +796,7 @@ and the former is probably what you want.
>  Where a real minus character is required (e.g., for numbers such as =
\-1,
>  or when writing options that have a leading dash, such as in
>  .IR "ls\ \-l"),
> -use the following form in the man page source
> +use the following form in the man page source:
> =20
>      \\-
> =20
> @@ -841,7 +842,7 @@ Example programs should be laid out according to =
Kernighan and
>  Ritchie style, with 4-space indents.
>  (Avoid the use of TAB characters in source code!)
>  .IP *
> -For consistency, all example programs should terminate using either =
of;
> +For consistency, all example programs should terminate using either =
of:
> =20
>       exit(EXIT_SUCCESS);
>       exit(EXIT_FAILURE);
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
