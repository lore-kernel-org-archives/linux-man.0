From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: grfix
Date: Sun, 03 Aug 2014 12:22:41 +0200
Message-ID: <53DE0D71.3050907@gmail.com>
References: <1407017123-475-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407017123-475-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/03/2014 12:05 AM, Simon Paillard wrote:
> Missing verb

Thanks, Simon. Applied.

Cheers,

Michael



> ---
>  man5/proc.5 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man5/proc.5 b/man5/proc.5
> index d721a3b..d69555b 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -3467,7 +3467,7 @@ file is also nonzero, then the machine will be rebooted.
>  .IR /proc/sys/kernel/pid_max " (since Linux 2.5.34)"
>  This file specifies the value at which PIDs wrap around
>  (i.e., the value in this file is one greater than the maximum PID).
> -PIDs greater than this value not allocated;
> +PIDs greater than this value are not allocated;
>  thus, the value in this file also acts as a system-wide limit
>  on the total number of processes and threads.
>  The default value for this file, 32768,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
