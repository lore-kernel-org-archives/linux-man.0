From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] socket.7: Add info about SO_PEEK_OFF option
Date: Wed, 17 Apr 2013 08:45:39 +0200
Message-ID: <CAKgNAkhoStgFnweOABOx3GQnq4Y9NaOambo2UKHcA_7DZiA7SA@mail.gmail.com>
References: <5123CE11.5060900@parallels.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5123CE11.5060900-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, Feb 19, 2013 at 8:10 PM, Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org> wrote:
> Since Linux 3.4 there appeared an ability to specify the
> offset in bytes from which the data will be MSG_PEEK-ed.
> Describe this socket option in the socket(7) page, where
> all the other socket options are described.
>
> Signed-off-by: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>

Pavel, I have applied this patch, but would like to clarify some
details. See below.

> ---
>
> diff --git a/man7/socket.7 b/man7/socket.7
> index 2f915da..6177ab1 100644
> --- a/man7/socket.7
> +++ b/man7/socket.7
> @@ -618,6 +618,33 @@ for details on control messages.
>  Gets the socket type as an integer (e.g.,
>  .BR SOCK_STREAM ).
>  This socket option is read-only.
> +.TP
> +.BR SO_PEEK_OFF " (since Linux 3.4)"
> +This option controls the behavior of
> +.BR recv(2)
> +system call when used with
> +.BR MSG_PEEK
> +flag.
> +
> +When this value is negative (kernel sets -1 to all new sockets by default)
> +the behavior of the
> +.BR recv(2)
> +is not affected at all.
> +When it's set to zero or positive value, peeking the data would occur from
> +the respective position in bytes. At the same time this offset will be
> +incremented on the amount of bytes peeked from queue, so that the
> +subsequent attempt to peek the data would result in next data in queue

So, if I set SO_PEEK_OFF to 5 and do a recv(fs, buf, 10, MSG_PEEK),
then the offset will end up at 15, and the next MSG_PEEK would
retrieve at offset 15, right?

> +(similarly, receiving the data from queue without the
> +.BR MSG_PEEK
> +flag will result in respectively decreased offset value).

What does this mean? Is it correct that if I set SO_PEEK_OFF to 5 and
do a recv(fs, buf, 10, 0), then the offset will end up at 0, and the
next MSG_PEEK would retrieve at offset 0? Or, rather, does a recv()
without MSG_PEEK leave the offset unchanged, so that the next MSG_PEEK
would retrieve at offset 5?

Thanks,

Michael

> +For datagram sockets, if the offset points to the middle of a packet,
> +the data returned will be marked with the
> +.BR MSG_TRUNC
> +flag.

That looks strange. So, if dealing
> +Since Linux 3.4 this option is supported for
> +.BR unix(7)
> +sockets only.
>  .SS Signals
>  When writing onto a connection-oriented socket that has been shut down
>  (by the local or the remote end)



--
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
