From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] proc.5: tfix
Date: Thu, 22 Jan 2015 20:53:22 +0100
Message-ID: <54C15532.8060500@gmail.com>
References: <1421954463-2853-1-git-send-email-eliedebrauwer@gmail.com> <1421954463-2853-3-git-send-email-eliedebrauwer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421954463-2853-3-git-send-email-eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks Elie!

Applied.

Cheers,

Michael


On 01/22/2015 08:21 PM, Elie De Brauwer wrote:
> Signed-off-by: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man5/proc.5 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man5/proc.5 b/man5/proc.5
> index 5bff2a0..9138ead 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -1981,12 +1981,12 @@ Node 0, zone  Normal   216   55  189  101   84   38   37   27    5    3  587
>  
>  In this example, there is one node containing three zones and there
>  are 11 different chunk sizes.
> -If the page size is 4 kilobyteis, then the first zone called
> +If the page size is 4 kilobytes, then the first zone called
>  .I DMA
>  (on x86 the first 16 megabyte of memory) has 1 chunk of 4 kilobytes
>  (order 0) available and has 3 chunks of 4 megabytes (order 10) available.
>  
> -If the memory is heavily fragmentated, the counters for higher
> +If the memory is heavily fragmented, the counters for higher
>  order chunks will be zero and allocation of large contiguous areas
>  will fail.
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
