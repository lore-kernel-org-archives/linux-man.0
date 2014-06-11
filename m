From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] lockf.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 11 Jun 2014 10:41:46 +0200
Message-ID: <5398164A.3010604@gmail.com>
References: <1402465656.20654.9.camel@fedora>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402465656.20654.9.camel@fedora>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, aoliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, carlos <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?5b2t5rW35rab?= <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Thanks, Qian Lei. Applied.

Cheers,

Michael

On 06/11/2014 07:47 AM, Qian Lei wrote:
> The function lockf() is thread safe.
> 
> Reviewed-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> Signed-off-by: Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/lockf.3 | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/man3/lockf.3 b/man3/lockf.3
> index d33c769..8395d85 100644
> --- a/man3/lockf.3
> +++ b/man3/lockf.3
> @@ -151,6 +151,11 @@ An invalid operation was specified in
>  .TP
>  .B ENOLCK
>  Too many segment locks open, lock table is full.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR lockf ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  SVr4, POSIX.1-2001.
>  .SH SEE ALSO
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
