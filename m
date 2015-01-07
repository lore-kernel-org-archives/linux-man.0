From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] aio_cancel.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 07 Jan 2015 07:07:52 +0100
Message-ID: <54ACCD38.8090302@gmail.com>
References: <1420600657-26323-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420600657-26323-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/07/2015 04:17 AM, Ma Shimiao wrote:
> The function aio_cancel() is thread safe.

Hello Ma Shimiao,

Patch applied in my local branch. 

Thanks,

Michael


> 
> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/aio_cancel.3 | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/man3/aio_cancel.3 b/man3/aio_cancel.3
> index abe1e96..9eea924 100644
> --- a/man3/aio_cancel.3
> +++ b/man3/aio_cancel.3
> @@ -111,6 +111,18 @@ is not implemented.
>  The
>  .BR aio_cancel ()
>  function is available since glibc 2.1.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR aio_cancel ()
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH CONFORMING TO
>  POSIX.1-2001, POSIX.1-2008.
>  .SH EXAMPLE
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
