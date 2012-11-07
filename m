From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] init_module.2: ffix
Date: Wed, 7 Nov 2012 13:58:37 +0100
Message-ID: <CAKgNAkj0=LpGAnJ9ZZi=959G3UVfry4HmJh4y7WNJss0eAsB1Q@mail.gmail.com>
References: <1352211348-13619-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352211348-13619-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks. Applied.

On Tue, Nov 6, 2012 at 3:15 PM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrot=
e:
> ---
>  man2/init_module.2 |   13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/man2/init_module.2 b/man2/init_module.2
> index a924ec4..eab48ec 100644
> --- a/man2/init_module.2
> +++ b/man2/init_module.2
> @@ -62,13 +62,20 @@ The kernel parses this string and initializes the=
 specified
>  parameters.
>  Each of the parameter specifications has the form:
>
> -.RI "        " name [ =3Dvalue [ ,value ...]]
> +.RI "        " name [\c
> +.BI =3D value\c
> +.RB [ ,\c
> +.IR value ...]]
>
> -The parameter name is one of those defined within the module using
> +The parameter
> +.I name
> +is one of those defined within the module using
>  .IR module_param ()
>  (see the Linux kernel source file
>  .IR include/linux/moduleparam.h ).
> -The parameter value is optional in the case of
> +The parameter
> +.I value
> +is optional in the case of
>  .I bool
>  and
>  .I invbool
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
