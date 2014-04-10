From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] duplocale.3: tfix
Date: Thu, 10 Apr 2014 20:59:51 +0200
Message-ID: <5346EA27.405@gmail.com>
References: <1397092606-11046-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397092606-11046-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, David. Applied.

Cheers,

Michael


On 04/10/2014 03:16 AM, David Pr=E9vot wrote:
> ---
>  man3/duplocale.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man3/duplocale.3 b/man3/duplocale.3
> index bb54301..b9fad7a 100644
> --- a/man3/duplocale.3
> +++ b/man3/duplocale.3
> @@ -123,7 +123,7 @@ and
>  .BR duplocale ()
>  to obtain a handle for the current locale which is then passed to
>  .BR toupper_l (3).
> -The program takes one command-liane argument,
> +The program takes one command-line argument,
>  a string of characters that is converted to uppercase and
>  displayed on standard output.
>  An example of its use is the following:
>=20



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
