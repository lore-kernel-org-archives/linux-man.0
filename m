From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mq_receive.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 04 Jun 2014 21:16:46 +0200
Message-ID: <538F709E.1090201@gmail.com>
References: <1401780792-31701-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401780792-31701-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Haitao,

Patch applied. Thank you!

Cheers,

Michael

On 06/03/2014 09:33 AM, Peng Haitao wrote:
> The functions mq_receive() and mq_timedreceive() are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/mq_receive.3 | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/mq_receive.3 b/man3/mq_receive.3
> index ee0ccb2..b139f44 100644
> --- a/man3/mq_receive.3
> +++ b/man3/mq_receive.3
> @@ -23,7 +23,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH MQ_RECEIVE 3 2014-01-18 "Linux" "Linux Programmer's Manual"
> +.TH MQ_RECEIVE 3 2014-06-03 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  mq_receive, mq_timedreceive \- receive a message from a message queue
>  .SH SYNOPSIS
> @@ -153,6 +153,13 @@ attribute of the message queue.
>  .TP
>  .B ETIMEDOUT
>  The call timed out before a message could be transferred.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR mq_receive ()
> +and
> +.BR mq_timedreceive ()
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
