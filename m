From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] wcsdup.3: Returns NULL on error
Date: Mon, 20 Mar 2017 17:51:30 +0100
Message-ID: <4f31d760-156c-8c00-6feb-a1dfc1c5bd49@gmail.com>
References: <55a31704-8d85-3b6f-1a96-d5b5d757fa6f@t-online.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55a31704-8d85-3b6f-1a96-d5b5d757fa6f-zqRNUXuvxA0b1SvskN2V4Q@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan Heberer <jangc-zqRNUXuvxA0b1SvskN2V4Q@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/18/2017 01:57 PM, Jan Heberer wrote:
> Patch applies against man-pages-4.10
> 
>  From 224502bd506d7d46734949a4254e8bc3990547f8 Mon Sep 17 00:00:00 2001
> From: Jan Heberer <jangc-zqRNUXuvxA0b1SvskN2V4Q@public.gmane.org>
> Date: Sat, 18 Mar 2017 13:54:58 +0100
> Subject: [PATCH] wcsdup.3: Returns NULL on error

Thanks, Jan. For some reason your patch failed to apply, so I made 
the fix manually.

Cheers,

Michael

> Return value for failure was accidentally changed from NULL to -1 in 
> man-pages commit 572acb41c48b6b8e690d50edff367d8b8b01702a.
> ---
>   man3/wcsdup.3 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/wcsdup.3 b/man3/wcsdup.3
> index 56534ddcb..b4b0d41b4 100644
> --- a/man3/wcsdup.3
> +++ b/man3/wcsdup.3
> @@ -60,7 +60,7 @@ and should be freed with
>   On success,
>   .BR wcsdup ()
>   returns a pointer to the new wide-character string.
> -On error, it returns \-1, with
> +On error, it returns NULL, with
>   .I errno
>   set to indicate the cause of the error.
>   .SH ERRORS
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
