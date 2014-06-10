From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mq_close.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 10 Jun 2014 16:45:49 +0200
Message-ID: <53971A1D.8030201@gmail.com>
References: <1402300238.1804.39.camel@fedora>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402300238.1804.39.camel@fedora>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, aoliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Applied. Thank you, Qian Lei.

Cheers,

Michael

On 06/09/2014 09:50 AM, Qian Lei wrote:
> The function mq_close() is thread safe.
> 
> Signed-off-by: Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/mq_close.3 | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/man3/mq_close.3 b/man3/mq_close.3
> index 8020ce0..d61388b 100644
> --- a/man3/mq_close.3
> +++ b/man3/mq_close.3
> @@ -56,6 +56,11 @@ set to indicate the error.
>  The descriptor specified in
>  .I mqdes
>  is invalid.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR mq_close ()
> +function is thread-safe.
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
