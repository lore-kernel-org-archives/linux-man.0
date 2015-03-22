From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 6/6] attributes.7: tfix
Date: Sun, 22 Mar 2015 16:42:58 +0100
Message-ID: <550EE302.7020104@gmail.com>
References: <1426381982-10434-1-git-send-email-saulery@free.fr> <1426381982-10434-6-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426381982-10434-6-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/15/2015 02:13 AM, St=C3=A9phane Aulery wrote:
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

Thanks, St=C3=A9phane. Applied.

Cheers,

Michael

> ---
>  man7/attributes.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man7/attributes.7 b/man7/attributes.7
> index 9f9e0a1..3d91b7b 100644
> --- a/man7/attributes.7
> +++ b/man7/attributes.7
> @@ -858,7 +858,7 @@ context.
>  .I /condition
>  Some safety annotations may be conditional,
>  in that they only apply if a boolean expression involving arguments,
> -global variables or even the underlying kernel evaluates evaluates t=
o true.
> +global variables or even the underlying kernel evaluates to true.
>  .\" Such conditions as
>  .\" .I /hurd
>  .\" or
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
