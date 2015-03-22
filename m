From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/5] hier.7: Explain YP which is not obvious.
Date: Sun, 22 Mar 2015 16:49:24 +0100
Message-ID: <550EE484.7080103@gmail.com>
References: <1426374917-11484-1-git-send-email-saulery@free.fr> <1426374917-11484-2-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426374917-11484-2-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/15/2015 12:15 AM, St=C3=A9phane Aulery wrote:
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

Thanks, St=C3=A9phane. Applied.

Cheers,

Michael

> ---
>  man7/hier.7 | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/man7/hier.7 b/man7/hier.7
> index bc621fe..70945b1 100644
> --- a/man7/hier.7
> +++ b/man7/hier.7
> @@ -490,7 +490,8 @@ Like
>  this directory holds temporary files stored for an unspecified durat=
ion.
>  .TP
>  .I /var/yp
> -Database files for NIS.
> +Database files for NIS,
> +formerly known as the Sun Yellow Pages (YP).
>  .SH CONFORMING TO
>  The Filesystem Hierarchy Standard, Version 2.3
>  .UR http://www.pathname.com\:/fhs/
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
