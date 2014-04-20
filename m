From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] timer_getoverrun.2:tfix
Date: Sun, 20 Apr 2014 10:43:04 +0200
Message-ID: <53538898.4060001@gmail.com>
References: <1397968868-4466-1-git-send-email-yuray@komyakino.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397968868-4466-1-git-send-email-yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Yuri. Applied.

Cheers,

Michael

On 04/20/2014 06:41 AM, Yuri Kozlov wrote:
> ---
>  man2/timer_getoverrun.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/timer_getoverrun.2 b/man2/timer_getoverrun.2
> index d64255a..c14230b 100644
> --- a/man2/timer_getoverrun.2
> +++ b/man2/timer_getoverrun.2
> @@ -78,7 +78,7 @@ Timer overruns can also occur when expiration notifications
>  are delivered via invocation of a thread,
>  since there may be an arbitrary delay between an expiration of the timer
>  and the invocation of the notification thread,
> -and in that delay interval, additional timer expirations may occur
> +and in that delay interval, additional timer expirations may occur.
>  .SH RETURN VALUE
>  On success,
>  .BR timer_getoverrun ()
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
