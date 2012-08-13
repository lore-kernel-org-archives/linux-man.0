From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/5] migrate_pages.2: tfix
Date: Mon, 13 Aug 2012 09:26:33 +0200
Message-ID: <CAKgNAkhvxYxPuiZa0qW=+aLVuZeKNCbufmXKrKMLFmzo+E-dTQ@mail.gmail.com>
References: <1344821668-11324-1-git-send-email-taffit@debian.org> <1344821668-11324-6-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1344821668-11324-6-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied!

On Mon, Aug 13, 2012 at 3:34 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> ---
>  man2/migrate_pages.2 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man2/migrate_pages.2 b/man2/migrate_pages.2
> index 47615bf..9c7416e 100644
> --- a/man2/migrate_pages.2
> +++ b/man2/migrate_pages.2
> @@ -87,7 +87,7 @@ privilege.
>  .SH "RETURN VALUE"
>  On success
>  .BR migrate_pages ()
> -returns the number of pages that cold not be moved
> +returns the number of pages that could not be moved
>  (i.e., a return of zero means that all pages were successfully moved=
).
>  On error, it returns \-1, and sets
>  .I errno
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
