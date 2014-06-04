From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mq_send.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 04 Jun 2014 21:17:01 +0200
Message-ID: <538F70AD.6040308@gmail.com>
References: <1401786728-3967-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401786728-3967-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Haitao,

Patch applied. Thank you!

Cheers,

Michael

On 06/03/2014 11:12 AM, Peng Haitao wrote:
> The functions mq_send() and mq_timedsend() are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/mq_send.3 | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/mq_send.3 b/man3/mq_send.3
> index 6564338..4fc414b 100644
> --- a/man3/mq_send.3
> +++ b/man3/mq_send.3
> @@ -23,7 +23,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH MQ_SEND 3 2014-01-18 "Linux" "Linux Programmer's Manual"
> +.TH MQ_SEND 3 2014-06-03 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  mq_send, mq_timedsend \- send a message to a message queue
>  .SH SYNOPSIS
> @@ -158,6 +158,13 @@ attribute of the message queue.
>  .TP
>  .B ETIMEDOUT
>  The call timed out before a message could be transferred.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR mq_send ()
> +and
> +.BR mq_timedsend ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  POSIX.1-2001.
>  .SH NOTES
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
