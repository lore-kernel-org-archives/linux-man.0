From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] alarm.2: wfix
Date: Mon, 03 Mar 2014 05:50:45 +0100
Message-ID: <53140A25.7090906@gmail.com>
References: <1393685321-20813-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393685321-20813-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Simon. Applied.

Cheers,

Michael


On 03/01/2014 03:48 PM, Simon Paillard wrote:
> ---
>  man2/alarm.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/alarm.2 b/man2/alarm.2
> index 6805ae8..1eea89d 100644
> --- a/man2/alarm.2
> +++ b/man2/alarm.2
> @@ -69,7 +69,7 @@ Alarms created by
>  .BR alarm()
>  are preserved across
>  .BR execve (2)
> -not are not inherited by children created via
> +and are not inherited by children created via
>  .BR fork (2).
>  .PP
>  .BR sleep (3)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
