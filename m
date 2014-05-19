From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fallocate.2: ffix
Date: Mon, 19 May 2014 06:51:09 +0200
Message-ID: <53798DBD.90105@gmail.com>
References: <1400430482-25427-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400430482-25427-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Simon. Applied.

Cheers,

Michael


On 05/18/2014 06:28 PM, Simon Paillard wrote:
> ---
>  man2/fallocate.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/fallocate.2 b/man2/fallocate.2
> index a29d7df..fa2703c 100644
> --- a/man2/fallocate.2
> +++ b/man2/fallocate.2
> @@ -290,7 +290,7 @@ no other flags are permitted with
>  is
>  .BR FALLOC_FL_COLLAPSE_RANGE
>  or
> -.BR FALLOC_FL_ZERO_RANGE,
> +.BR FALLOC_FL_ZERO_RANGE ,
>  but the file referred to by
>  .I fd
>  is not a regular file.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
