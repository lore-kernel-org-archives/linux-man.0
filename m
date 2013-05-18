From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] alarm.2, io_destroy.2: tfix
Date: Sat, 18 May 2013 16:16:43 +0200
Message-ID: <CAKgNAkg4WeqjtGPZ5_awBq7qVoPrJr0OsU_Ev8Gv6j_jgNFt+Q@mail.gmail.com>
References: <1368386889-31178-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1368386889-31178-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sun, May 12, 2013 at 9:28 PM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> Actually a consistency fix.

Thanks, David. Appkied.

Cheers,

Michael


> ---
>  man2/alarm.2      |    2 +-
>  man2/io_destroy.2 |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/man2/alarm.2 b/man2/alarm.2
> index 736cd90..7252880 100644
> --- a/man2/alarm.2
> +++ b/man2/alarm.2
> @@ -46,7 +46,7 @@ seconds.
>
>  If
>  .I seconds
> -is zero, any pending alarm is cancelled.
> +is zero, any pending alarm is canceled.
>
>  In any event any previously set
>  .BR alarm ()
> diff --git a/man2/io_destroy.2 b/man2/io_destroy.2
> index 4a8cf28..e4d78a5 100644
> --- a/man2/io_destroy.2
> +++ b/man2/io_destroy.2
> @@ -24,7 +24,7 @@ system call
>  will attempt to cancel all outstanding asynchronous I/O operations a=
gainst
>  .IR ctx_id ,
>  will block on the completion of all operations
> -that could not be cancelled, and will destroy the
> +that could not be canceled, and will destroy the
>  .IR ctx_id .
>  .SH RETURN VALUE
>  On success,
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
