From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] close.2: Mention a need of shutdown before closing socket
Date: Fri, 7 Oct 2011 08:28:59 +0200
Message-ID: <CAKgNAkjDZufWp-H7NeSRT40FGBRCkMuisesbGcdJnD94OZucUA@mail.gmail.com>
References: <1314620800-15587-1-git-send-email-lczerner@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1314620800-15587-1-git-send-email-lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Lukas,

On Mon, Aug 29, 2011 at 2:26 PM, Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wr=
ote:
> When dealing with sockets, we have to be sure that there is no recv
> still blocking on it on another thread, otherwise it might block fore=
ver,
> since no more messages will be send via the socket. We should advice =
to
> use shutdown before closing socket.

I'm looking into this now. The picture may be more complex than this.
Tell me, so you have a Solaris system available for testing?

Thanks,

Michael


> Signed-off-by: Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
> =A0man2/close.2 | =A0 =A07 +++++++
> =A01 files changed, 7 insertions(+), 0 deletions(-)
>
> diff --git a/man2/close.2 b/man2/close.2
> index a2a2961..02472f3 100644
> --- a/man2/close.2
> +++ b/man2/close.2
> @@ -114,6 +114,13 @@ other threads in the same process.
> =A0Since a file descriptor may be reused,
> =A0there are some obscure race conditions
> =A0that may cause unintended side effects.
> +.PP
> +When dealing with sockets, you have to be sure that there is no
> +.BR recv (2)
> +still blocking on it on another thread, otherwise it might block for=
ever,
> +since no more messages will be send via the socket. Be sure to use
> +.BR shutdown (2)
> +to shut down all parts the connection before closing the socket.
> =A0.\" Date: Tue, 4 Sep 2007 13:57:35 +0200
> =A0.\" From: Fredrik Noring <noring-zgYzP9v7iJcdnm+yROfE0A@public.gmane.org>
> =A0.\" One such race involves signals and ERESTARTSYS. If a file desc=
riptor
> --
> 1.7.4.4
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
