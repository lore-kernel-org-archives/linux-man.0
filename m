From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mq_getattr.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 10 Jun 2014 16:46:17 +0200
Message-ID: <53971A39.1080203@gmail.com>
References: <1402307414.1804.42.camel@fedora>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402307414.1804.42.camel@fedora>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, carlos <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, aoliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Applied. Thank you, Qian Lei.

Cheers,

Michael

On 06/09/2014 11:50 AM, Qian Lei wrote:
> The functions mq_getattr() and mq_setattr() are thread safe.
> 
> Signed-off-by: Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/mq_getattr.3 | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/man3/mq_getattr.3 b/man3/mq_getattr.3
> index 0fe370d..1c2321f 100644
> --- a/man3/mq_getattr.3
> +++ b/man3/mq_getattr.3
> @@ -134,6 +134,13 @@ is invalid.
>  .I newattr\->mq_flags
>  contained set bits other than
>  .BR O_NONBLOCK .
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR mq_getattr ()
> +and
> +.BR mq_setattr ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  POSIX.1-2001.
>  .SH NOTES
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
