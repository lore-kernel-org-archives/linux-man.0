From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] readdir_r(3): fix reference to readdir(3)
Date: Sun, 28 Aug 2016 16:38:59 +1200
Message-ID: <5a6e9013-a07b-d013-eab1-fd4dd394bb8f@gmail.com>
References: <20160827102039.15524-1-ruben@rubenkerkhof.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160827102039.15524-1-ruben-pkfekA+zf0jEimEGZCN+oA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ruben Kerkhof <ruben-pkfekA+zf0jEimEGZCN+oA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/27/2016 10:20 PM, Ruben Kerkhof wrote:

Thanks, Ruben. Applied.

Cheers,

Michael

> ---
>  man3/readdir_r.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/readdir_r.3 b/man3/readdir_r.3
> index 45c67d0..7181857 100644
> --- a/man3/readdir_r.3
> +++ b/man3/readdir_r.3
> @@ -62,7 +62,7 @@ and returns it in the caller-allocated buffer pointed to by
>  For details of the
>  .IR dirent
>  structure, see
> -.BR readir (3).
> +.BR readdir (3).
>  
>  A pointer to the returned buffer is placed in
>  .IR *result ;
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
