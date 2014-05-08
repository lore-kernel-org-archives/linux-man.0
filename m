From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 02/10] Fix prototype for stime()
Date: Thu, 08 May 2014 11:43:58 +0200
Message-ID: <536B51DE.30907@gmail.com>
References: <1398886962-10633-1-git-send-email-rv@rasmusvillemoes.dk> <1398886962-10633-3-git-send-email-rv@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398886962-10633-3-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/30/2014 09:42 PM, Rasmus Villemoes wrote:
> The argument is const, both according to the actual header
> files and according to <http://www.sco.com/developers/devspecs/vol1a.pdf>.

Applied!

Thanks,

Michael


> Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
> ---
>  man2/stime.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/stime.2 b/man2/stime.2
> index afecfba..fa47ecd 100644
> --- a/man2/stime.2
> +++ b/man2/stime.2
> @@ -33,7 +33,7 @@ stime \- set time
>  .SH SYNOPSIS
>  .B #include <time.h>
>  .sp
> -.BI "int stime(time_t *" t );
> +.BI "int stime(const time_t *" t );
>  .sp
>  .in -4n
>  Feature Test Macro Requirements for glibc (see
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
