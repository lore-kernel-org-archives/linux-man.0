From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] epoll_ctl(2) fix typo
Date: Mon, 29 Aug 2016 07:26:26 +1200
Message-ID: <bd7d990b-5b5e-af0c-7d31-739599c2b622@gmail.com>
References: <20160828125624.13625-1-ruben@rubenkerkhof.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160828125624.13625-1-ruben-pkfekA+zf0jEimEGZCN+oA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ruben Kerkhof <ruben-pkfekA+zf0jEimEGZCN+oA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/29/2016 12:56 AM, Ruben Kerkhof wrote:

Thanks, Ruben. Applied.

Cheers,

Michael


> ---
>  man2/epoll_ctl.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/epoll_ctl.2 b/man2/epoll_ctl.2
> index 3203ba5..995c47a 100644
> --- a/man2/epoll_ctl.2
> +++ b/man2/epoll_ctl.2
> @@ -205,7 +205,7 @@ is thus useful for avoiding thundering herd problems in certain scenarios.
>  If the same file descriptor is in multiple epoll instances,
>  some with the
>  .BR EPOLLEXCLUSIVE
> -flag, and others without, then events will provided to all epoll
> +flag, and others without, then events will be provided to all epoll
>  instances that did not specify
>  .BR EPOLLEXCLUSIVE ,
>  and at least one of the epoll instances that did specify
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
