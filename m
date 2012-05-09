From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] get_robust_list.2: tfix
Date: Wed, 9 May 2012 17:17:24 +1200
Message-ID: <CAKgNAkjfzf45pwAVoG6ZxWHoN-9nM1nAipRV_Z8jJWwFnneZMw@mail.gmail.com>
References: <1336531753-22522-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1336531753-22522-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, May 9, 2012 at 2:49 PM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrot=
e:
> Only one set_robust_list() error is currently documented.

Thanks. Applied!

Cheers,

Michael


> ---
> =A0man2/get_robust_list.2 | =A0 =A02 +-
> =A01 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man2/get_robust_list.2 b/man2/get_robust_list.2
> index e6e753e..7dc0198 100644
> --- a/man2/get_robust_list.2
> +++ b/man2/get_robust_list.2
> @@ -79,7 +79,7 @@ an error code otherwise.
> =A0.SH ERRORS
> =A0The
> =A0.BR set_robust_list ()
> -system call can fail with the following errors:
> +system call can fail with the following error:
> =A0.TP
> =A0.B EINVAL
> =A0.I len
> --
> 1.7.10
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
