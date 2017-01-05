From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ioctl_fideduperange.2: ffix
Date: Fri, 6 Jan 2017 05:57:30 +1300
Message-ID: <46bead88-95a2-94e1-2088-3909999ee775@gmail.com>
References: <20170105124747.7204-1-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170105124747.7204-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/06/2017 01:47 AM, Jakub Wilk wrote:
> Add empty line between "struct file_dedupe_range" definition and the
> following paragraph.

Thanks, Jakub. Applied.

Cheers,

Michael


> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
> ---
>  man2/ioctl_fideduperange.2 | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/man2/ioctl_fideduperange.2 b/man2/ioctl_fideduperange.2
> index 5db25be70..d0a43854b 100644
> --- a/man2/ioctl_fideduperange.2
> +++ b/man2/ioctl_fideduperange.2
> @@ -68,6 +68,7 @@ struct file_dedupe_range {
>  };
>  .fi
>  .in
> +
>  Deduplication is atomic with regards to concurrent writes, so no locks need to
>  be taken to obtain a consistent deduplicated copy.
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
