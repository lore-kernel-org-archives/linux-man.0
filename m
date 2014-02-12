From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nscd.conf.5: tfix
Date: Wed, 12 Feb 2014 09:19:21 +0100
Message-ID: <52FB2E89.8000508@gmail.com>
References: <1392171760-15390-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392171760-15390-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, David. Applied.

Cheers,

Michael

On 02/12/2014 03:22 AM, David Pr=E9vot wrote:
> ---
>  man5/nscd.conf.5 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man5/nscd.conf.5 b/man5/nscd.conf.5
> index f9208e1..2eeaa80 100644
> --- a/man5/nscd.conf.5
> +++ b/man5/nscd.conf.5
> @@ -233,7 +233,7 @@ and
>  The default values stated in this manual page originate
>  from the source code of
>  .BR nscd (8)
> -and are used if not overriden in the configuration file.
> +and are used if not overridden in the configuration file.
>  The default values used in the configuration file of
>  your distribution might differ.
>  .SH SEE ALSO
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
