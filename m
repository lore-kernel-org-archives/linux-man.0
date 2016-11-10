From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] mq_receive.3, mq_send.3: clarification regarding
 reasons behind EBADF
Date: Thu, 10 Nov 2016 08:22:46 +0100
Message-ID: <b6d853f0-fab9-5fe0-a84d-48874830a0c8@gmail.com>
References: <20161109173052.GA19634@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161109173052.GA19634@obsidian>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Eugene,

On 11/09/2016 06:30 PM, Eugene Syromyatnikov wrote:
> ---
>  man3/mq_receive.3 |    2 +-
>  man3/mq_send.3    |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Thanks. Applied.

Cheers,

Michael


> diff --git a/man3/mq_receive.3 b/man3/mq_receive.3
> index 57a1f58..f204b98 100644
> --- a/man3/mq_receive.3
> +++ b/man3/mq_receive.3
> @@ -129,7 +129,7 @@ flag was set for the message queue description referred to by
>  .B EBADF
>  The file descriptor specified in
>  .I mqdes
> -was invalid.
> +was invalid or unavailable for reading.
>  .TP
>  .B EINTR
>  The call was interrupted by a signal handler; see
> diff --git a/man3/mq_send.3 b/man3/mq_send.3
> index 9d30092..4277c36 100644
> --- a/man3/mq_send.3
> +++ b/man3/mq_send.3
> @@ -134,7 +134,7 @@ flag was set for the message queue description referred to by
>  .B EBADF
>  The file descriptor specified in
>  .I mqdes
> -was invalid.
> +was invalid or unavailable for writing.
>  .TP
>  .B EINTR
>  The call was interrupted by a signal handler; see
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
