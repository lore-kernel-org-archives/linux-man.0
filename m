From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sendfile.2: ffix
Date: Mon, 19 Sep 2011 07:09:20 +0200
Message-ID: <CAKgNAkgxhOFft4OHZmApTqeWNy5kJjRS-myU5XokSj5zk=bQVA@mail.gmail.com>
References: <1316400120-27669-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1316400120-27669-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello David,

On Mon, Sep 19, 2011 at 4:42 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
>
> Signed-off-by: David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>

Thanks. Applied for 3.34.

Cheers,

Michael


> ---
> =A0man2/sendfile.2 | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/man2/sendfile.2 b/man2/sendfile.2
> index 81220fc..49ed9e5 100644
> --- a/man2/sendfile.2
> +++ b/man2/sendfile.2
> @@ -163,7 +163,7 @@ In Linux 2.4 and earlier,
> =A0.I out_fd
> =A0could also refer to a regular file, and
> =A0.BR sendfile ()
> - =A0 =A0changed the current offset of that file.
> +changed the current offset of that file.
>
> =A0The original Linux
> =A0.BR sendfile ()
> --
> 1.7.6.3
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
