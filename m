From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fallocate.2: clarify the zeroing behavior
Date: Fri, 08 Nov 2013 06:03:17 +1300
Message-ID: <527BC7D5.1030609@gmail.com>
References: <20131106135231.GA3882@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131106135231.GA3882-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/07/13 02:52, Christoph Hellwig wrote:
> Fallocate only zeroes space that did not previously contain data,
> but leaves existing data untouched.

Thanks, Christoph. APplied

Cheers

Michael


> Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
> 
> diff --git a/man2/fallocate.2 b/man2/fallocate.2
> index f5c395d..f577ba8 100644
> --- a/man2/fallocate.2
> +++ b/man2/fallocate.2
> @@ -44,8 +44,7 @@ The default operation (i.e.,
>  .I mode
>  is zero) of
>  .BR fallocate ()
> -allocates and initializes to zero the disk space
> -within the range specified by
> +allocates the disk space within the range specified by
>  .I offset
>  and
>  .IR len .
> @@ -54,6 +53,11 @@ The file size (as reported by
>  will be changed if
>  .IR offset + len
>  is greater than the file size.
> +Any subregion withing the range specified by
> +.I offset
> +and
> +.IR len .
> +that did not contain data before the call will be initialized to zero.
>  This default behavior closely resembles the behavior of the
>  .BR posix_fallocate (3)
>  library function,
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
