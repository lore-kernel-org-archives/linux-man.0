From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] inet.3: tfix
Date: Sun, 04 May 2014 07:43:13 +0200
Message-ID: <5365D371.5080105@gmail.com>
References: <1399166675-16019-1-git-send-email-taffit@debian.org> <1399166675-16019-2-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399166675-16019-2-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, David. Applied.

Cheers,

Michael


On 05/04/2014 03:24 AM, David Pr=E9vot wrote:
> ---
>  man3/inet.3 | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/man3/inet.3 b/man3/inet.3
> index 611655d..18d2982 100644
> --- a/man3/inet.3
> +++ b/man3/inet.3
> @@ -130,7 +130,6 @@ The form that uses exactly four decimal numbers i=
s referred to as
>  (or sometimes:
>  .IR "IPv4 dotted-quad notation" ).
> =20
> -If
>  .BR inet_aton ()
>  returns 1 if the supplied string was successfully interpreted,
>  or 0 if the string is invalid
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
