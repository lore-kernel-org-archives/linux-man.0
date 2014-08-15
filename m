From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pthread_create.3: /proc/sys/kernel/threads-max limits
 process AND threads
Date: Fri, 15 Aug 2014 20:22:17 +0200
Message-ID: <53EE4FD9.8060409@gmail.com>
References: <1407184343-22243-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407184343-22243-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Simon. Applied.

Cheers,

Michael


On 08/04/2014 10:32 PM, Simon Paillard wrote:
> ---
>  man3/pthread_create.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/pthread_create.3 b/man3/pthread_create.3
> index 1d33439..82f73e1 100644
> --- a/man3/pthread_create.3
> +++ b/man3/pthread_create.3
> @@ -133,7 +133,7 @@ soft resource limit (set via
>  .BR setrlimit (2)),
>  which limits the number of processes and threads for a real user ID,
>  was reached;
> -the kernel's system-wide limit on the number of processes threads,
> +the kernel's system-wide limit on the number of processes and threads,
>  .IR /proc/sys/kernel/threads-max ,
>  was reached (see
>  .BR proc (5));
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
