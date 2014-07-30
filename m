From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] capabilities.7: tfix
Date: Wed, 30 Jul 2014 08:40:18 +0200
Message-ID: <53D89352.9040008@gmail.com>
References: <1406655908-2445-1-git-send-email-yuray@komyakino.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406655908-2445-1-git-send-email-yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Yuri. Applied.

Cheers,

Michael


On 07/29/2014 07:45 PM, Yuri Kozlov wrote:
> ---
>  man7/capabilities.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man7/capabilities.7 b/man7/capabilities.7
> index 0b7f89f..3d37fdd 100644
> --- a/man7/capabilities.7
> +++ b/man7/capabilities.7
> @@ -914,7 +914,7 @@ Removing capabilities from the bounding set is supported only if file
>  capabilities are compiled into the kernel.
>  In kernels before Linux 2.6.33,
>  file capabilities were an optional feature configurable via the
> -CONFIG_SECURITY_FILE_CAPABILITIES
> +.B CONFIG_SECURITY_FILE_CAPABILITIES
>  option.
>  Since Linux 2.6.33, the configuration option has been removed
>  and file capabilities are always part of the kernel.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
