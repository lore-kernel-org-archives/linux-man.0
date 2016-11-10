From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] mq_open.3: clarification regarding usage of mq_flags
 attribute in mq_open()
Date: Thu, 10 Nov 2016 19:29:48 +0100
Message-ID: <d5896c5c-a2fc-2a86-5cf6-a3625bed95fb@gmail.com>
References: <20161109173106.GA19836@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161109173106.GA19836@obsidian>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Eugene,

On 11/09/2016 06:31 PM, Eugene Syromyatnikov wrote:
> ---
>  man3/mq_open.3 |    9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Thanks. Applied!

Cheers,

Michael

> diff --git a/man3/mq_open.3 b/man3/mq_open.3
> index 771a263..ba70ada 100644
> --- a/man3/mq_open.3
> +++ b/man3/mq_open.3
> @@ -123,7 +123,14 @@ The
>  argument specifies attributes for the queue.
>  See
>  .BR mq_getattr (3)
> -for details.
> +for details (except for
> +.I mq_flags
> +field which is currently ignored by
> +.BR mq_open() ;
> +.B O_NONBLOCK
> +flag should be set in
> +.I oflag
> +parameter instead).
>  If
>  .I attr
>  is NULL, then the queue is created with implementation-defined
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
