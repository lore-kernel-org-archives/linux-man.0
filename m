From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nscd.conf.5: ffix
Date: Mon, 25 Feb 2013 05:48:05 +0100
Message-ID: <CAKgNAkjHta41_Ldi_jUkJf0SZeJY30X4z5rrBvgcYXGAoWRS7g@mail.gmail.com>
References: <1361763069-20640-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1361763069-20640-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi David,

Thanks. Applied.

Also, I changed

     .IR service ,

to

    service,

Cheers,

Michael

On Mon, Feb 25, 2013 at 4:31 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> ---
>  man5/nscd.conf.5 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man5/nscd.conf.5 b/man5/nscd.conf.5
> index aa6ea41..3030628 100644
> --- a/man5/nscd.conf.5
> +++ b/man5/nscd.conf.5
> @@ -213,7 +213,7 @@ When set to
>  .IR no
>  for
>  .I passwd
> -.I or
> +or
>  .I group
>  .IR service ,
>  then the
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
