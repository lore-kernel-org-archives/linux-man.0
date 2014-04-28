From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fallocate.2: ffix
Date: Mon, 28 Apr 2014 09:39:21 +0200
Message-ID: <535E05A9.1070008@gmail.com>
References: <1398635545-12432-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398635545-12432-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Simon. Applied.

On 04/27/2014 11:52 PM, Simon Paillard wrote:
> ---
>  man2/fallocate.2 | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/fallocate.2 b/man2/fallocate.2
> index b14bb28..73c4f12 100644
> --- a/man2/fallocate.2
> +++ b/man2/fallocate.2
> @@ -233,12 +233,14 @@ or
>  is not a multiple of the filesystem block size.
>  .TP
>  .B EINVAL
> -mode contains both
> +.I mode
> +contains both
>  .B FALLOC_FL_COLLAPSE_RANGE
>  and other flags;
>  no other flags are permitted with
>  .BR FALLOC_FL_COLLAPSE_RANGE .
> -.TP EINVAL
> +.TP
> +.B EINVAL
>  .I mode
>  is
>  .BR FALLOC_FL_COLLAPSE_RANGE ,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
