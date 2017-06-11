From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getaddrinfo.3: Fix _POSIX_C_SOURCE value for
 getaddrinfo()
Date: Sun, 11 Jun 2017 08:15:38 +0200
Message-ID: <8dd2d453-b85c-4068-8dd9-c585f341a701@gmail.com>
References: <20170609230020.GA62868@alpha.fifth.space>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170609230020.GA62868-lvRy8M+iZ/WfwRssfSzb0bNAH6kLmebB@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Quentin Rameau <quinq-UlqG2OPX9a0ue8ZPuPpd/Q@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


On 06/10/2017 01:00 AM, Quentin Rameau wrote:
> The correct _POSIX_C_SOURCE value is 200112L, not 201112L in features.h.

Thank you Quentin. Applied.

Cheers,

Michael


> ---
>  man3/getaddrinfo.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/getaddrinfo.3 b/man3/getaddrinfo.3
> index f058e5a80..2f89c099b 100644
> --- a/man3/getaddrinfo.3
> +++ b/man3/getaddrinfo.3
> @@ -69,7 +69,7 @@ Feature Test Macro Requirements for glibc (see
>  .BR getaddrinfo (),
>  .BR freeaddrinfo (),
>  .BR gai_strerror ():
> -    Since glibc 2.22: _POSIX_C_SOURCE >= 201112L
> +    Since glibc 2.22: _POSIX_C_SOURCE >= 200112L
>      Glibc 2.21 and earlier: _POSIX_C_SOURCE
>  .ad b
>  .SH DESCRIPTION
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
