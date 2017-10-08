From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: tfix
Date: Sun, 8 Oct 2017 20:50:13 +0200
Message-ID: <06218f19-f173-8983-77e1-1c767e1fe51a@gmail.com>
References: <20171008155334.6909-1-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171008155334.6909-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 10/08/2017 05:53 PM, Jakub Wilk wrote:
> Remove duplicated word.

Thanks, Jakub. Applied.

Cheers,

Michael

> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
> ---
>  man5/proc.5 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man5/proc.5 b/man5/proc.5
> index d23c0588a..cf4f35025 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -4992,7 +4992,7 @@ cache management.
>  .IR /proc/sys/vm/admin_reserve_kbytes " (since Linux 3.10)"
>  .\" commit 4eeab4f5580d11bffedc697684b91b0bca0d5009
>  This file defines the amount of free memory (in KiB) on the system that
> -that should be reserved for users with the capability
> +should be reserved for users with the capability
>  .BR CAP_SYS_ADMIN .
>  .IP
>  The default value in this file is the minimum of [3% of free pages, 8MiB]
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
