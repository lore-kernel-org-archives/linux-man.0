From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] resolver.3: RES_IGNTC is implemented
Date: Wed, 11 Mar 2015 06:51:33 +0100
Message-ID: <54FFD7E5.4010402@gmail.com>
References: <1426027978-2703-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426027978-2703-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/10/2015 11:52 PM, St=C3=A9phane Aulery wrote:
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

Thanks, St=C3=A9phane. Applied.

Cheers,

Michael


> ---
>  man3/resolver.3 | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/man3/resolver.3 b/man3/resolver.3
> index 06704b1..4a1c97d 100644
> --- a/man3/resolver.3
> +++ b/man3/resolver.3
> @@ -210,7 +210,6 @@ Query primary domain name server only.
>  .B RES_IGNTC
>  Ignore truncation errors.
>  Don't retry with TCP.
> -[Not currently implemented].
>  .TP
>  .B RES_RECURSE
>  Set the recursion desired bit in queries.
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
