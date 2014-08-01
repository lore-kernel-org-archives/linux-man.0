From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] capabilities.7: tfix
Date: Fri, 01 Aug 2014 21:59:53 +0200
Message-ID: <53DBF1B9.3050403@gmail.com>
References: <1406905760-2232-1-git-send-email-yuray@komyakino.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406905760-2232-1-git-send-email-yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Yuri. Applied.

Cheers,

Michael




On 08/01/2014 05:09 PM, Yuri Kozlov wrote:
> ---
>  man7/capabilities.7 | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/man7/capabilities.7 b/man7/capabilities.7
> index 3d37fdd..7d55f51 100644
> --- a/man7/capabilities.7
> +++ b/man7/capabilities.7
> @@ -1105,7 +1105,8 @@ is based on the withdrawn POSIX.1e draft standard; see
>  .UE .
>  .SH NOTES
>  Since kernel 2.5.27, capabilities are an optional kernel component,
> -and can be enabled/disabled via the CONFIG_SECURITY_CAPABILITIES
> +and can be enabled/disabled via the
> +.B CONFIG_SECURITY_CAPABILITIES
>  kernel configuration option.
>  
>  The
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
