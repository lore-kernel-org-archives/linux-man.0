From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] malloc_get_state.3: Replace header
Date: Wed, 04 Jun 2014 20:52:37 +0200
Message-ID: <538F6AF5.50303@gmail.com>
References: <1401892717-12014-1-git-send-email-rv@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401892717-12014-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Rasmus. Applied.

Cheers,

Michael


On 06/04/2014 04:38 PM, Rasmus Villemoes wrote:
> The non-standard functions malloc_[gs]et_state are provided by
> malloc.h, not stdlib.h
> 
> Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
> ---
>  man3/malloc_get_state.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/malloc_get_state.3 b/man3/malloc_get_state.3
> index cea14c4..5da546d 100644
> --- a/man3/malloc_get_state.3
> +++ b/man3/malloc_get_state.3
> @@ -27,7 +27,7 @@
>  malloc_get_state, malloc_set_state \- record and restore state of malloc implementation
>  .SH SYNOPSIS
>  .nf
> -.B #include <stdlib.h>
> +.B #include <malloc.h>
>  .sp
>  .BI "void* malloc_get_state(void);"
>  
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
