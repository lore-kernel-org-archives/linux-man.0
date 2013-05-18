From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] io_setup.2: tfix
Date: Sat, 18 May 2013 16:15:25 +0200
Message-ID: <CAKgNAki-b9cpRu=4Bgy9o+Pp-G4hxN3DSpombX60wEzs9ac2aw@mail.gmail.com>
References: <1368386889-31178-1-git-send-email-taffit@debian.org> <1368386889-31178-2-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1368386889-31178-2-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello David,

Thanks for the patch, but the problem was resolved as a result of
other rewordings.

Cheers,

Michael


On Sun, May 12, 2013 at 9:28 PM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> ---
>  man2/io_setup.2 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man2/io_setup.2 b/man2/io_setup.2
> index 81b9a8b..549495a 100644
> --- a/man2/io_setup.2
> +++ b/man2/io_setup.2
> @@ -21,7 +21,7 @@ There is no glibc wrapper for this system call; see=
 NOTES.
>  The
>  .BR io_setup ()
>  system call
> -creates an asynchronous I/O context capable of of concurrently proce=
ssing
> +creates an asynchronous I/O context capable of concurrently processi=
ng
>  at least \fInr_events\fP.
>  The
>  .I ctx_idp
> --
> 1.7.10.4
>



--
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
