From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] epoll_ctl(2): fix another typo
Date: Mon, 29 Aug 2016 07:26:59 +1200
Message-ID: <d1020b3c-fe7a-0187-48b7-01dfdae4097a@gmail.com>
References: <20160828130048.13759-1-ruben@rubenkerkhof.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160828130048.13759-1-ruben-pkfekA+zf0jEimEGZCN+oA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ruben Kerkhof <ruben-pkfekA+zf0jEimEGZCN+oA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/29/2016 01:00 AM, Ruben Kerkhof wrote:

Thanks, Ruben. Applied.

Cheers,

Michael


> ---
>  man2/epoll_ctl.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/epoll_ctl.2 b/man2/epoll_ctl.2
> index 995c47a..41de995 100644
> --- a/man2/epoll_ctl.2
> +++ b/man2/epoll_ctl.2
> @@ -236,7 +236,7 @@ operation; attempts to employ it with
>  yield an error.
>  If
>  .B EPOLLEXCLUSIVE
> -has set using
> +has been set using
>  .BR epoll_ctl (),
>  then a subsequent
>  .B EPOLL_CTL_MOD
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
