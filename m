From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pthread_attr_setschedparam.3: ffix
Date: Fri, 15 Aug 2014 20:21:35 +0200
Message-ID: <53EE4FAF.40604@gmail.com>
References: <1407182334-21786-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407182334-21786-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Simon. Applied.

Cheers,

Michael


On 08/04/2014 09:58 PM, Simon Paillard wrote:
> ---
>  man3/pthread_attr_setschedparam.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/pthread_attr_setschedparam.3 b/man3/pthread_attr_setschedparam.3
> index 8c0bf13..f3db870 100644
> --- a/man3/pthread_attr_setschedparam.3
> +++ b/man3/pthread_attr_setschedparam.3
> @@ -123,5 +123,5 @@ See
>  .BR pthread_create (3),
>  .BR pthread_setschedparam (3),
>  .BR pthread_setschedprio (3),
> -.BR pthreads (7).
> +.BR pthreads (7),
>  .BR sched (7)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
