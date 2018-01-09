From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] recvmmsg.2, sendmmsg.2: point out that error handling
 is unreliable
Date: Tue, 9 Jan 2018 19:45:55 +0100
Message-ID: <76e6d114-54ea-9a34-ce52-1029cf834e33@gmail.com>
References: <1515506049.3260.40.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515506049.3260.40.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Nikola,

On 01/09/2018 02:54 PM, Nikola Forró wrote:
> If an error occurs after at least one message has been received,
> recvmmsg() call succeeds, and returns the number of messages received.
> The error code is expected to be returned on a subsequent call.
> In the current implementation, however, the error code can be overwritten
> in the meantime by an unrelated network event on a socket, for example
> an incoming ICMP packet.
> 
> If an error occurs after at least one message has been sent,
> sendmmsg() call succeeds, and returns the number of messages sent.
> The error code is lost. The caller can retry the transmission,
> starting at first failed message, but there is no guarantee that,
> if an error is returned, it will be the same as the one that was lost
> on the previous call.

Thanks. Patch applied. (And thanks for your persistence.)

Cheers,

Michael



> Reference:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/tree/net/socket.c
> 
> Signed-off-by: Nikola Forró <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  man2/recvmmsg.2 | 10 ++++++++++
>  man2/sendmmsg.2 |  8 ++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/man2/recvmmsg.2 b/man2/recvmmsg.2
> index e7dfe848a..7a1be5787 100644
> --- a/man2/recvmmsg.2
> +++ b/man2/recvmmsg.2
> @@ -160,6 +160,8 @@ In addition, the following error can occur:
>  .B EINVAL
>  .I timeout
>  is invalid.
> +.PP
> +See also BUGS.
>  .SH VERSIONS
>  The
>  .BR recvmmsg ()
> @@ -179,6 +181,14 @@ so that if up to
>  .I vlen\-1
>  datagrams are received before the timeout expires,
>  but then no further datagrams are received, the call will block forever.
> +.PP
> +If an error occurs after at least one message has been received,
> +the call succeeds, and returns the number of messages received.
> +The error code is expected to be returned on a subsequent call to
> +.BR recvmmsq ().
> +In the current implementation, however, the error code can be overwritten
> +in the meantime by an unrelated network event on a socket,
> +for example an incoming ICMP packet.
>  .SH EXAMPLE
>  .PP
>  The following program uses
> diff --git a/man2/sendmmsg.2 b/man2/sendmmsg.2
> index a4895c1ac..ab08162bd 100644
> --- a/man2/sendmmsg.2
> +++ b/man2/sendmmsg.2
> @@ -134,6 +134,7 @@ is set to indicate the error.
>  Errors are as for
>  .BR sendmsg (2).
>  An error is returned only if no datagrams could be sent.
> +See also BUGS.
>  .\" commit 728ffb86f10873aaf4abd26dde691ee40ae731fe
>  .\"     ... only return an error if no datagrams could be sent.
>  .\"     If less than the requested number of messages were sent, the application
> @@ -165,6 +166,13 @@ is capped to
>  .\"     For error handling an application using sendmmsg needs to retry at
>  .\"     the first unsent message, so capping is simpler and requires less
>  .\"     application logic than returning EINVAL.
> +.SH BUGS
> +If an error occurs after at least one message has been sent,
> +the call succeeds, and returns the number of messages sent.
> +The error code is lost. The caller can retry the transmission,
> +starting at first failed message, but there is no guarantee that,
> +if an error is returned, it will be the same as the one that was lost
> +on the previous call.
>  .SH EXAMPLE
>  The example below uses
>  .BR sendmmsg ()
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
