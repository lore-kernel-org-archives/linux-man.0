From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] resolver.3: More information about RES_INSECURE1 and
 RES_INSECURE2 option in debug mode
Date: Mon, 23 Mar 2015 07:06:01 +0100
Message-ID: <550FAD49.20706@gmail.com>
References: <1427057408-5001-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427057408-5001-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/22/2015 09:50 PM, St=C3=A9phane Aulery wrote:
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
> +Potential security hazard could be detected here,

I find the sense of the preceding line a little difficult
to understand. Would this be better as something like:

    This can be used to detect potential security hazards...

And the same thing a few lines down.

> +but you need to compile glibc with debugging enabled and use
> +.B RES_DEBUG
> +option (for debug purpose only).
>  .TP
>  .B RES_INSECURE2
> -Accept a response which contains a wrong query and show it on standa=
rd
> -output (for debug purpose only).
> +Accept a response which contains a wrong query.
> +Potential security hazard could be detected here,

See comment above.

> +but you need to compile glibc with debugging enabled and use
> +.B RES_DEBUG
> +option (for debug purpose only).
>  .TP
>  .B RES_NOALIASES
>  Disable usage of

Thanks,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
