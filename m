From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: ffix
Date: Sun, 03 Aug 2014 12:23:11 +0200
Message-ID: <53DE0D8F.20401@gmail.com>
References: <1407013980-31378-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407013980-31378-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Simon. Applied.

Cheers,

Michael

On 08/02/2014 11:13 PM, Simon Paillard wrote:
> ---
>  man5/proc.5 | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/man5/proc.5 b/man5/proc.5
> index 040db32..942156b 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -4062,7 +4062,9 @@ The statistics can be retrieved by:
>  
>      $ cat /proc/timer_stats
>  
> -While sampling is enabled, each readout from /proc/timer_stats will see
> +While sampling is enabled, each readout from
> +.I /proc/timer_stats
> +will see
>  newly updated statistics.
>  Once sampling is disabled, the sampled information
>  is kept until a new sample period is started.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
