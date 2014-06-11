From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] matherr.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 11 Jun 2014 10:37:20 +0200
Message-ID: <53981540.70808@gmail.com>
References: <1402474873.20654.19.camel@fedora>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402474873.20654.19.camel@fedora>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, aoliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, carlos <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?5b2t5rW35rab?= <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Thanks, Qian Lei. Applied.

Cheers,

Michael

On 06/11/2014 10:21 AM, Qian Lei wrote:
> The function matherr() is thread safe.
> 
> Reviewed-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> Signed-off-by: Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/matherr.3 | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/man3/matherr.3 b/man3/matherr.3
> index c3c1eee..53d7c6f 100644
> --- a/man3/matherr.3
> +++ b/man3/matherr.3
> @@ -272,6 +272,11 @@ scalb() u/f	UNDERFLOW	copysign(	n	ERANGE
>  fmod(x,0)	DOMAIN	x	y	EDOM
>  remainder(x,0)	DOMAIN	NAN	y	EDOM	\" retval is 0.0/0.0
>  .TE
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR matherr ()
> +function is thread-safe.
>  .SH EXAMPLE
>  The example program demonstrates the use of
>  .BR matherr ()
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
