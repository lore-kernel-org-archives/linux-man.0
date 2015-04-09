From: =?utf-8?B?U3TDqXBoYW5l?= Aulery <saulery-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH] resolver.3: More information about RES_INSECURE1 and
 RES_INSECURE2 option in debug mode
Date: Thu, 9 Apr 2015 17:45:56 +0200
Message-ID: <20150409154556.GA8512@free.fr>
References: <550FAD49.20706@gmail.com>
 <1427147900-15468-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1427147900-15468-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Michael,

I don't know if your are available at this time. The patch below have
not been reviewed / commited.

Regards,

Le lundi 23 mars 2015 =C3=A0 10:58:20, AULERY St=C3=A9phane a =C3=A9cri=
t :
> Asked by Walter Harms <wharms-fPG8STNUNVg@public.gmane.org>
>=20
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man3/resolver.3 | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/man3/resolver.3 b/man3/resolver.3
> index 4a1c97d..a070c57 100644
> --- a/man3/resolver.3
> +++ b/man3/resolver.3
> @@ -240,12 +240,18 @@ This option is used by
>  [Enabled by default].
>  .TP
>  .B RES_INSECURE1
> -Accept a response from a wrong server and show it on standard output
> -(for debug purpose only).
> +Accept a response from a wrong server.
> +This can be used to detect potential security hazards,
> +but you need to compile glibc with debugging enabled and use
> +.B RES_DEBUG
> +option (for debug purpose only).
>  .TP
>  .B RES_INSECURE2
> -Accept a response which contains a wrong query and show it on standa=
rd
> -output (for debug purpose only).
> +Accept a response which contains a wrong query.
> +This can be used to detect potential security hazards,
> +but you need to compile glibc with debugging enabled and use
> +.B RES_DEBUG
> +option (for debug purpose only).
>  .TP
>  .B RES_NOALIASES
>  Disable usage of
> --=20
> 2.1.4
>=20

--=20
St=C3=A9phane Aulery
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
