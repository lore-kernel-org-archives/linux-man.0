From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] toupper.3: nfix
Date: Mon, 14 Apr 2014 12:24:55 +0200
Message-ID: <534BB777.3090002@gmail.com>
References: <1397169620-10086-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397169620-10086-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, David. APplied.

Cheers,

Michael


On 04/11/2014 12:40 AM, David Pr=E9vot wrote:
> ---
>  man3/toupper.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man3/toupper.3 b/man3/toupper.3
> index 0b765ae..6e835b2 100644
> --- a/man3/toupper.3
> +++ b/man3/toupper.3
> @@ -77,7 +77,7 @@ but uses the locale referred to by the locale handl=
e
>  If
>  .I c
>  is a uppercase letter,
> -.BR toupper ()
> +.BR tolower ()
>  returns its lowercase equivalent,
>  if a lowercase representation exists in the current locale.
>  Otherwise, it returns
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
