From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] tcp.7: tfix
Date: Sun, 21 May 2017 11:37:02 +0200
Message-ID: <6db86e5c-ea69-aba9-9d62-5c86aef4390e@gmail.com>
References: <20170519094648.3137-1-ruben@rubenkerkhof.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170519094648.3137-1-ruben-pkfekA+zf0jEimEGZCN+oA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ruben Kerkhof <ruben-pkfekA+zf0jEimEGZCN+oA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/19/2017 11:46 AM, Ruben Kerkhof wrote:
> Signed-off-by: Ruben Kerkhof <ruben-pkfekA+zf0jEimEGZCN+oA@public.gmane.org>

Thanks, Ruben. Applied!

Cheers,

Michael

> ---
>  man7/tcp.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man7/tcp.7 b/man7/tcp.7
> index 67dbed49a..2a1ad135f 100644
> --- a/man7/tcp.7
> +++ b/man7/tcp.7
> @@ -423,7 +423,7 @@ option.
>  .\" Since 2.4.0-test7
>  Enable RFC\ 2883 TCP Duplicate SACK support.
>  .TP
> -.IR tcp_ecn " (Integer; default: se below; since Linux 2.4)"
> +.IR tcp_ecn " (Integer; default: see below; since Linux 2.4)"
>  .\" Since 2.4.0-test7
>  Enable RFC\ 3168 Explicit Congestion Notification.
>  
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
