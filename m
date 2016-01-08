From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] futex.2: tfix
Date: Fri, 8 Jan 2016 17:26:35 +0100
Message-ID: <568FE33B.90307@gmail.com>
References: <1451923175-4316-1-git-send-email-jwilk@jwilk.net>
 <1451923175-4316-2-git-send-email-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1451923175-4316-2-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/04/2016 04:59 PM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

Thanks, Jakub. Applied.

Cheers,

Michael

> diff --git a/man2/futex.2 b/man2/futex.2
> index 8c6c023..7cf0d0b 100644
> --- a/man2/futex.2
> +++ b/man2/futex.2
> @@ -516,7 +516,7 @@ unlock(A);
>  If a waker thread used
>  .BR FUTEX_WAKE ,
>  then all waiters waiting on B would be woken up,
> -and they would would all try to acquire lock A.
> +and they would all try to acquire lock A.
>  However, waking all of the threads in this manner would be pointless because
>  all except one of the threads would immediately block on lock A again.
>  By contrast, a requeue operation wakes just one waiter and moves
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
