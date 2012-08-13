From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/5] readdir.3: ffix
Date: Mon, 13 Aug 2012 09:23:51 +0200
Message-ID: <CAKgNAkiHuW9yKj5hw4=wMnBBq0y3v6o-Q6qn7qB6ayoX0-cBGA@mail.gmail.com>
References: <1344821668-11324-1-git-send-email-taffit@debian.org> <1344821668-11324-3-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1344821668-11324-3-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied!

On Mon, Aug 13, 2012 at 3:34 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> ---
>  man3/readdir.3 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man3/readdir.3 b/man3/readdir.3
> index 0660efd..90f2ff1 100644
> --- a/man3/readdir.3
> +++ b/man3/readdir.3
> @@ -227,7 +227,7 @@ as follows:
>  .nf
>
>  name_max =3D pathconf(dirpath, _PC_NAME_MAX);
> -if (name_max =3D=3D \-1)        /* Limit not defined, or error */
> +if (name_max =3D=3D \-1)         /* Limit not defined, or error */
>      name_max =3D 255;         /* Take a guess */
>  len =3D offsetof(struct dirent, d_name) + name_max + 1;
>  entryp =3D malloc(len);
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
