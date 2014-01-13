From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mq_receive.3: wfix
Date: Mon, 13 Jan 2014 21:43:02 +1300
Message-ID: <52D3A716.7080205@gmail.com>
References: <1389598606-13221-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389598606-13221-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied. Thanks, Haitao.

Cheers,

Michael


On 01/13/2014 08:36 PM, Peng Haitao wrote:
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/mq_receive.3 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man3/mq_receive.3 b/man3/mq_receive.3
> index a644212..3ed7efe 100644
> --- a/man3/mq_receive.3
> +++ b/man3/mq_receive.3
> @@ -23,7 +23,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH MQ_RECEIVE 3 2013-11-08 "Linux" "Linux Programmer's Manual"
> +.TH MQ_RECEIVE 3 2014-01-13 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  mq_receive, mq_timedreceive \- receive a message from a message queue
>  .SH SYNOPSIS
> @@ -65,7 +65,7 @@ The
>  .I msg_len
>  argument specifies the size of the buffer pointed to by
>  .IR msg_ptr ;
> -this must be greater than or equalt to the
> +this must be greater than or equal to the
>  .I mq_msgsize
>  attribute of the queue (see
>  .BR mq_getattr (3)).
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
