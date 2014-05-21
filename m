From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 07/24] pthread_sigqueue.3: Include needed header
Date: Wed, 21 May 2014 19:56:55 +0200
Message-ID: <537CE8E7.3020501@gmail.com>
References: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk> <1400684275-20972-8-git-send-email-rv@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400684275-20972-8-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/21/2014 04:57 PM, Rasmus Villemoes wrote:
> One needs to #include <signal.h> to get a declaration of
> pthread_sigqueue.

I applied that piece.

> Also, abbreviate the FTM needed to expose it.

But not that piece. In general, I actually prefer the long form
and should have used it on all pages, for consistency.

Thanks,

Michael


> Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
> ---
>  man3/pthread_sigqueue.3 | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/man3/pthread_sigqueue.3 b/man3/pthread_sigqueue.3
> index 84611ef..8ad0b63 100644
> --- a/man3/pthread_sigqueue.3
> +++ b/man3/pthread_sigqueue.3
> @@ -27,21 +27,15 @@
>  pthread_sigqueue \- queue a signal and data to a thread
>  .SH SYNOPSIS
>  .nf
> +.BR "#define _GNU_SOURCE" "             /* See feature_test_macros(7) */"
>  .B #include <pthread.h>
> +.B #include <signal.h>
>  
>  .BI "int pthread_sigqueue(pthread_t " thread ", int " sig ,
>  .BI "                     const union sigval " value );
> -.fi
>  .sp
>  Compile and link with \fI\-pthread\fP.
> -.sp
> -.in -4n
> -Feature Test Macro Requirements for glibc (see
> -.BR feature_test_macros (7)):
> -.in
> -.sp
> -.BR pthread_sigqueue ():
> -_GNU_SOURCE
> +.fi
>  .SH DESCRIPTION
>  The
>  .BR pthread_sigqueue ()
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
