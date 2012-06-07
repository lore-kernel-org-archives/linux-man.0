From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Psuedo->Pseudo
Date: Thu, 7 Jun 2012 21:45:56 +1200
Message-ID: <CAKgNAkiYD4y3NY_jEzfa6isXfHa3q+_FcS3QDVjUwFGGZpz4Ug@mail.gmail.com>
References: <4FB16967.1060606@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FB16967.1060606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jim Hill <gjthill-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks Jim,

Applied for 3.42.

Cheers,

Michael

On Tue, May 15, 2012 at 8:21 AM, Jim Hill <gjthill-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> ---
> =A0man4/pts.4 | 2 +-
> =A0man7/pty.7 | 2 +-
> =A02 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/man4/pts.4 b/man4/pts.4
> index 7164e10..ff81c63 100644
> --- a/man4/pts.4
> +++ b/man4/pts.4
> @@ -44,7 +44,7 @@ programs such as
> =A0in which data read from the pseudoterminal master is sent across t=
he
> network
> =A0to a client program that is connected to a terminal or terminal em=
ulator.
> =A0.PP
> -Psuedoterminals can also be used to send input to programs that norm=
ally
> +Pseudoterminals can also be used to send input to programs that norm=
ally
> =A0refuse to read input from pipes (such as
> =A0.BR su (1),
> =A0and
> diff --git a/man7/pty.7 b/man7/pty.7
> index c6d8c35..2860b30 100644
> --- a/man7/pty.7
> +++ b/man7/pty.7
> @@ -48,7 +48,7 @@ that is connected to the slave.
> =A0Conversely, anything that is written to the slave end of the
> =A0pseudoterminal can be read by the process that is connected to
> =A0the master end.
> -Psuedoterminals are used by applications such as network login servi=
ces
> +Pseudoterminals are used by applications such as network login servi=
ces
> =A0.RB ( ssh "(1), " rlogin "(1), " telnet (1)),
> =A0terminal emulators,
> =A0.BR script (1),
> --
> 1.7.10.1.456.g16798d0
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
