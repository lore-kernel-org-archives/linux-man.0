From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] man3/mbstowcs.3: tfix
Date: Thu, 10 Apr 2014 21:00:16 +0200
Message-ID: <5346EA40.4050108@gmail.com>
References: <1397073728-29053-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397073728-29053-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, David. Applied.

Cheers,

Michael


On 04/09/2014 10:02 PM, David Pr=E9vot wrote:
> ---
>  man3/mbstowcs.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man3/mbstowcs.3 b/man3/mbstowcs.3
> index 2689ee5..08f72a3 100644
> --- a/man3/mbstowcs.3
> +++ b/man3/mbstowcs.3
> @@ -108,7 +108,7 @@ functionality.
>  .SH EXAMPLE
>  The program below illustrates the use of
>  .BR mbstowcs (),
> -as well as some of the wider character classification functions.
> +as well as some of the wide character classification functions.
>  An example run is the following:
>  .in +4n
>  .nf
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
