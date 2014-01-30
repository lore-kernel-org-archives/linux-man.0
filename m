From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] setjmp.3: ffix
Date: Thu, 30 Jan 2014 09:12:05 +0100
Message-ID: <52EA0955.8010807@gmail.com>
References: <1391013936-19379-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391013936-19379-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied.

Thanks,

Michael

On 01/29/2014 05:45 PM, David Pr=E9vot wrote:
> ---
>  man3/setjmp.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man3/setjmp.3 b/man3/setjmp.3
> index 6ac3d65..8dae4ad 100644
> --- a/man3/setjmp.3
> +++ b/man3/setjmp.3
> @@ -102,7 +102,7 @@ is a function
>  .B _setjmp
>  that will not.
>  On Linux with glibc versions before 2.19,
> -.BR setjmp()
> +.BR setjmp ()
>  follows the System V behavior by default,
>  but the BSD behavior is provided if the
>  .BR _BSD_SOURCE
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
