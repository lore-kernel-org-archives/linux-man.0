From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iconv.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 11 Jun 2014 10:38:15 +0200
Message-ID: <53981577.4000405@gmail.com>
References: <1402470890.20654.12.camel@fedora>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402470890.20654.12.camel@fedora>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, aoliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, carlos <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?5b2t5rW35rab?= <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Thanks, Qian Lei. Applied.

Cheers,

Michael

On 06/11/2014 09:14 AM, Qian Lei wrote:
> The function iconv() is thread safe.
> 
> Reviewed-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> Signed-off-by: Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/iconv.3 | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/man3/iconv.3 b/man3/iconv.3
> index 39455d2..365ee8a 100644
> --- a/man3/iconv.3
> +++ b/man3/iconv.3
> @@ -139,6 +139,11 @@ An invalid multibyte sequence has been encountered in the input.
>  An incomplete multibyte sequence has been encountered in the input.
>  .SH VERSIONS
>  This function is available in glibc since version 2.1.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR iconv ()
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
