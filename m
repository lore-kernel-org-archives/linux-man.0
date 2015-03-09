From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] resolv.conf.5: tfix
Date: Mon, 09 Mar 2015 08:09:56 +0100
Message-ID: <54FD4744.7020104@gmail.com>
References: <1425817115-2617-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425817115-2617-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/08/2015 01:18 PM, St=C3=A9phane Aulery wrote:
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

Applied.

Thanks, St=C3=A9phane.

Michael

> ---
>  man5/resolv.conf.5 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man5/resolv.conf.5 b/man5/resolv.conf.5
> index 1777c8a..f01bf57 100644
> --- a/man5/resolv.conf.5
> +++ b/man5/resolv.conf.5
> @@ -203,7 +203,7 @@ sets
>  .BR RES_USE_INET6
>  in
>  .IR _res.options .
> -This has the effect of trying a AAAA query before an A query inside =
the
> +This has the effect of trying an AAAA query before an A query inside=
 the
>  .BR gethostbyname (3)
>  function, and of mapping IPv4 responses in IPv6 "tunneled form"
>  if no AAAA records are found but an A record set exists.
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
