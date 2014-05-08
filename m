From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 05/10] Fix prototype for sched_setaffinity()
Date: Thu, 08 May 2014 11:44:06 +0200
Message-ID: <536B51E6.4030201@gmail.com>
References: <1398886962-10633-1-git-send-email-rv@rasmusvillemoes.dk> <1398886962-10633-6-git-send-email-rv@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398886962-10633-6-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/30/2014 09:42 PM, Rasmus Villemoes wrote:
> The mask argument is const.

Applied!

Thanks,

Michael


> Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
> ---
>  man2/sched_setaffinity.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/sched_setaffinity.2 b/man2/sched_setaffinity.2
> index 4078b88..b77f5b6 100644
> --- a/man2/sched_setaffinity.2
> +++ b/man2/sched_setaffinity.2
> @@ -41,7 +41,7 @@ set and get a thread's CPU affinity mask
>  .B #include <sched.h>
>  .sp
>  .BI "int sched_setaffinity(pid_t " pid ", size_t " cpusetsize ,
> -.BI "                      cpu_set_t *" mask );
> +.BI "                      const cpu_set_t *" mask );
>  .sp
>  .BI "int sched_getaffinity(pid_t " pid ", size_t " cpusetsize ,
>  .BI "                      cpu_set_t *" mask );
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
