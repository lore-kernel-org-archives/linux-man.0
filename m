From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 07/10] Fix prototype for mbind(2)
Date: Thu, 08 May 2014 11:44:21 +0200
Message-ID: <536B51F5.5000602@gmail.com>
References: <1398886962-10633-1-git-send-email-rv@rasmusvillemoes.dk> <1398886962-10633-8-git-send-email-rv@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398886962-10633-8-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/30/2014 09:42 PM, Rasmus Villemoes wrote:
> The nmask argument is const. The return type in numaif.h is long.

Thanks. Applied!

Cheers,

Michael

> ---
> Well, at least <numaif.h> says nmask is const. The current kernel does
> not define it as a const argument, but sys_mbind() only passes it to
> get_nodes(), which does treat it as const.
> 
> Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
> ---
>  man2/mbind.2 | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/man2/mbind.2 b/man2/mbind.2
> index 2a690e6..6cff10a 100644
> --- a/man2/mbind.2
> +++ b/man2/mbind.2
> @@ -49,9 +49,9 @@ mbind \- set memory policy for a memory range
>  .nf
>  .B "#include <numaif.h>"
>  .sp
> -.BI "int mbind(void *" addr ", unsigned long " len  ", int " mode ,
> -.BI "          unsigned long *" nodemask  ", unsigned long " maxnode ,
> -.BI "          unsigned " flags );
> +.BI "long mbind(void *" addr ", unsigned long " len  ", int " mode ,
> +.BI "           const unsigned long *" nodemask  ", unsigned long " maxnode ,
> +.BI "           unsigned " flags );
>  .sp
>  Link with \fI\-lnuma\fP.
>  .fi
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
