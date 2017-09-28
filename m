From: "Michael Kerrisk (man-opages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] perror(3): add missing period
Date: Thu, 28 Sep 2017 09:23:38 +0200
Message-ID: <7e135596-2e1c-2bf2-7e40-fc84d276a457@gmail.com>
References: <20170928001259.8678-1-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170928001259.8678-1-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/28/2017 02:12 AM, Mike Frysinger wrote:
> From: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Thanks, Mike. Applied.

Cheers,

Michael


> Signed-off-by: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>   man3/perror.3 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/perror.3 b/man3/perror.3
> index e0ee3d1751c9..bbdac61a5d6c 100644
> --- a/man3/perror.3
> +++ b/man3/perror.3
> @@ -89,7 +89,7 @@ The use of
>   .IR sys_errlist "[]"
>   is nowadays deprecated; use
>   .BR strerror (3)
> -instead
> +instead.
>   .PP
>   When a system call fails, it usually returns \-1 and sets the
>   variable
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
