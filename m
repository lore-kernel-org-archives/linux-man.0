From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] resolver.3: ffix
Date: Tue, 5 Mar 2013 17:39:00 +0100
Message-ID: <CAKgNAki-kZ46p-eon9HFgeJR3Zue61oArP9z1zTHydrx1UvF5g@mail.gmail.com>
References: <1362355839-11975-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1362355839-11975-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks. Applied.

On Mon, Mar 4, 2013 at 1:10 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrot=
e:
> ---
>  man3/resolver.3 |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/man3/resolver.3 b/man3/resolver.3
> index af532f7..d64f61c 100644
> --- a/man3/resolver.3
> +++ b/man3/resolver.3
> @@ -87,7 +87,8 @@ domain name servers.
>  The
>  .BR res_init ()
>  function reads the configuration files (see
> -resolv.conf(5)) to get the default domain name, search order and nam=
e
> +.BR resolv.conf (5))
> +to get the default domain name, search order and name
>  server address(es).
>  If no server is given, the local host is tried.
>  If no domain is given, that associated with the local host is used.
> --
> 1.7.10.4
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
