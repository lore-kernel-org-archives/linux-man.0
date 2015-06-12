From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] setlocale.3: update CONFORMING TO
Date: Fri, 12 Jun 2015 20:17:56 +0200
Message-ID: <557B2254.8070309@gmail.com>
References: <5576F5A8.50409@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5576F5A8.50409-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 06/09/2015 04:18 PM, Marko Myllynen wrote:
> Hi Michael,
> 
> a tiny update to setlocale's CONFORMING TO section.
> 
> http://pubs.opengroup.org/onlinepubs/9699919799/functions/setlocale.html

Thanks, Marko. Applied.

Cheers,

Michael


> ---
>  man3/setlocale.3 |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/man3/setlocale.3 b/man3/setlocale.3
> index 1d05ba7..1b31cf8 100644
> --- a/man3/setlocale.3
> +++ b/man3/setlocale.3
> @@ -185,7 +185,7 @@ T}	Thread safety	MT-Unsafe const:locale env
>  .TE
>  
>  .SH CONFORMING TO
> -C89, C99, POSIX.1-2001.
> +C89, C99, POSIX.1-2001, POSIX.1-2008.
>  .SH SEE ALSO
>  .BR locale (1),
>  .BR localedef (1),
> 
> Thanks,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
