From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 02/24] makecontext.3: Fix prototype
Date: Wed, 21 May 2014 19:45:55 +0200
Message-ID: <537CE653.1010000@gmail.com>
References: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk> <1400684275-20972-3-git-send-email-rv@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400684275-20972-3-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied!

Thanks,

Michael


On 05/21/2014 04:57 PM, Rasmus Villemoes wrote:
> The second argument to swapcontext() is const.
> 
> Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
> ---
>  man3/makecontext.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/makecontext.3 b/man3/makecontext.3
> index 1e0e991..e57060d 100644
> --- a/man3/makecontext.3
> +++ b/man3/makecontext.3
> @@ -34,7 +34,7 @@ makecontext, swapcontext \- manipulate user context
>  .BI "void makecontext(ucontext_t *" ucp ", void (*" func )(),
>  .BI "int " argc ", ...);"
>  .sp
> -.BI "int swapcontext(ucontext_t *" oucp ", ucontext_t *" ucp );
> +.BI "int swapcontext(ucontext_t *" oucp ", const ucontext_t *" ucp );
>  .SH DESCRIPTION
>  In a System V-like environment, one has the type \fIucontext_t\fP defined in
>  .I <ucontext.h>
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
