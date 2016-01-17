From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] recv.2: equivalence to read
Date: Sun, 17 Jan 2016 08:03:00 +0100
Message-ID: <569B3CA4.1060806@gmail.com>
References: <1452286943-26340-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452286943-26340-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/08/2016 10:02 PM, Heinrich Schuchardt wrote:
> Describe the recv.2-read.2 and the recvfrom.2-recv.2 equivalences for
> zero valued arguments.

Thanks, Heinrich. Applied.

Cheers,

Michael


> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man2/recv.2 | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/man2/recv.2 b/man2/recv.2
> index a789256..1bdeb7a 100644
> --- a/man2/recv.2
> +++ b/man2/recv.2
> @@ -68,6 +68,26 @@ to receive data on both connectionless and connection-oriented sockets.
>  This page first describes common features of all three system calls,
>  and then describes the differences between the calls.
>  .PP
> +The only difference between
> +.BR recv ()
> +and
> +.BR read (2)
> +is the presence of
> +.IR flags .
> +With a zero
> +.I flags
> +argument,
> +.BR recv ()
> +is equivalent to
> +.BR read (2).
> +Also, the following call
> +
> +    recv(sockfd, buf, len, flags);
> +
> +is equivalent to
> +
> +    recvfrom(sockfd, buf, len, flags, NULL, NULL);
> +.PP
>  All three calls return the length of the message on successful
>  completion.
>  If a message is too long to fit in the supplied buffer, excess
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
