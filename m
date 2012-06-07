From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] aio_cancel.3, aio_suspend.3: ffix
Date: Fri, 8 Jun 2012 03:02:17 +1200
Message-ID: <CAKgNAkiJzNr4r4fsAYjSd3pnbiQ9jyYeOJP+p=k59wdxdDMpqQ@mail.gmail.com>
References: <1337137844-26841-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1337137844-26841-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks David. Likewise fixed independently before reading your mail.

Cheers,

Michael


On Wed, May 16, 2012 at 3:10 PM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> ---
> =A0man3/aio_cancel.3 =A0| =A0 =A02 +-
> =A0man3/aio_suspend.3 | =A0 =A02 +-
> =A02 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/man3/aio_cancel.3 b/man3/aio_cancel.3
> index 8b80275..c800075 100644
> --- a/man3/aio_cancel.3
> +++ b/man3/aio_cancel.3
> @@ -104,7 +104,7 @@ The cause of the error can be found by inspecting
> =A0is not a valid file descriptor.
> =A0.TP
> =A0.B ENOSYS
> -.BR aio_cancel()
> +.BR aio_cancel ()
> =A0is not implemented.
> =A0.SH VERSIONS
> =A0The
> diff --git a/man3/aio_suspend.3 b/man3/aio_suspend.3
> index 1215ff7..05d045d 100644
> --- a/man3/aio_suspend.3
> +++ b/man3/aio_suspend.3
> @@ -97,7 +97,7 @@ waiting for); see
> =A0.BR signal (7).
> =A0.TP
> =A0.B ENOSYS
> -.BR aio_suspend()
> +.BR aio_suspend ()
> =A0is not implemented.
> =A0.SH VERSIONS
> =A0The
> --
> 1.7.10
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
