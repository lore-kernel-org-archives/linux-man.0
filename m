From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] vmsplice.2: vmsplice() does not fail on nr_segs=0
Date: Wed, 01 Oct 2014 13:23:17 +0200
Message-ID: <542BE425.9030103@gmail.com>
References: <20140625141235.GA10090@rei.Home>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140625141235.GA10090-HSzIOc4LzcM@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyril Hrubis <metan-+ZI9xUNit7I@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/25/2014 04:12 PM, Cyril Hrubis wrote:
> This case is no-op and no error is returned.
> 
> See fs/splice.c vmsplice syscall which contains:
> 
>         if (unlikely(nr_segs > UIO_MAXIOV))
>                 return -EINVAL;
>         else if (unlikely(!nr_segs))
>                 return 0;
> 
> and looking at the git log suggests that this snipped was always there.

Apologies for the delay, Cyril (and thanks for pinging).
I've applied this patch now.

Cheers,

Michael


> Signed-off-by: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
> ---
>  man2/vmsplice.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/vmsplice.2 b/man2/vmsplice.2
> index 35ab07f..a9ad786 100644
> --- a/man2/vmsplice.2
> +++ b/man2/vmsplice.2
> @@ -133,7 +133,7 @@ either not valid, or doesn't refer to a pipe.
>  .TP
>  .B EINVAL
>  .I nr_segs
> -is 0 or greater than
> +is greater than
>  .BR IOV_MAX ;
>  or memory not aligned if
>  .B SPLICE_F_GIFT
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
