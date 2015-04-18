From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ioctl_list.2: SIOCADDRT accepts in6_rtmsg in INET6 protocol
Date: Sat, 18 Apr 2015 23:07:27 +0200
Message-ID: <5532C78F.9040502@gmail.com>
References: <1429185133.443.1.camel@gnutls.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429185133.443.1.camel-c5N7Ur/I1ocdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikos Mavrogiannopoulos <nmav-c5N7Ur/I1ocdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Nikos,

On 04/16/2015 01:52 PM, Nikos Mavrogiannopoulos wrote:
> 
> Signed-off-by: Nikos Mavrogiannopoulos <nmav-c5N7Ur/I1ocdnm+yROfE0A@public.gmane.org>

Applied. (If you should send more patches, it would be 
helpful to cite locations in the kernel source where the
details can be verified.)

Thanks!

Michael

> ---
>  man2/ioctl_list.2 | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/man2/ioctl_list.2 b/man2/ioctl_list.2
> index ba993a1..1507d3c 100644
> --- a/man2/ioctl_list.2
> +++ b/man2/ioctl_list.2
> @@ -904,6 +904,7 @@ the protocol:
>      Most protocols      const struct rtentry *
>      AX.25               const struct ax25_route *
>      NET/ROM             const struct nr_route_struct *
> +    INET6               const struct in6_rtmsg *
>  
>  .fi
>  .B SIOCGIFCONF
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
