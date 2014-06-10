From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] malloc_usable_size.3: ATTRIBUTES: Note function that
 is thread-safe
Date: Tue, 10 Jun 2014 16:46:40 +0200
Message-ID: <53971A50.4060206@gmail.com>
References: <1402389968.1169.9.camel@fedora>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402389968.1169.9.camel@fedora>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, aoliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, carlos <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Applied. Thank you, Qian Lei.

Cheers,

Michael

On 06/10/2014 10:46 AM, Qian Lei wrote:
> The function malloc_usable_size() is thread safe.
> 
> Signed-off-by: Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/malloc_usable_size.3 | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/man3/malloc_usable_size.3 b/man3/malloc_usable_size.3
> index 5b06a65..e3313bc 100644
> --- a/man3/malloc_usable_size.3
> +++ b/man3/malloc_usable_size.3
> @@ -45,6 +45,11 @@ the block of allocated memory pointed to by
>  If
>  .I ptr
>  is NULL, 0 is returned.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR malloc_usable_size ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  This function is a GNU extension.
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
