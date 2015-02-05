From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] unix.7: mentioning SOCK_STREAM socket for ioctl_type
 of ioctl function
Date: Thu, 05 Feb 2015 10:51:45 +0100
Message-ID: <54D33D31.2040907@gmail.com>
References: <20141018153600.15536.67496.stgit@unused-4-157.brq.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141018153600.15536.67496.stgit-/v0jm+aXwyk2pP1PFFXgSPXAX3CI6PSWQQ4Iyu8u01E@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 10/18/2014 05:36 PM, Jan Chaloupka wrote:
> from https://bugzilla.redhat.com/show_bug.cgi?id=1110401.
> 
> unix.7 is not clear about socket type of ioctl_type argument of ioctl
> function. The description of SIOCINQ is applicable only for SOCK_STREAM
> socket. For SOCK_DGRAM, udp(7) man page gives correct description of
> SIOCINQ

Applied.

Thanks, Jan.

Cheers,

Michael


> Changelog: reformulation of referrence to udp(7) by Michael Kerrisk
> 
> Signed-off-by: Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  man7/unix.7 |   14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/man7/unix.7 b/man7/unix.7
> index 1ab70d5..7c9cb36 100644
> --- a/man7/unix.7
> +++ b/man7/unix.7
> @@ -382,7 +382,9 @@ The correct syntax is:
>  can be:
>  .TP
>  .B SIOCINQ
> -Returns the amount of queued unread data in the receive buffer.
> +For
> +.B SOCK_STREAM
> +socket the function returns the amount of queued unread data in the receive buffer.
>  The socket must not be in LISTEN state, otherwise an error
>  .RB ( EINVAL )
>  is returned.
> @@ -402,6 +404,13 @@ defined in
>  .\" That number is normally larger than the number of bytes of pending
>  .\" output. Since this info is, from userland's point of view, imprecise,
>  .\" and it may well change, probably best not to document this now.
> +For
> +.B SOCK_DGRAM
> +socket,
> +the returned value is the same as
> +for Internet domain datagram socket;
> +see
> +.BR udp (7).
>  .SH ERRORS
>  .TP
>  .B EADDRINUSE
> @@ -621,4 +630,5 @@ see
>  .BR cmsg (3),
>  .BR capabilities (7),
>  .BR credentials (7),
> -.BR socket (7)
> +.BR socket (7),
> +.BR udp (7)
> 
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
