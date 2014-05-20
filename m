From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 10/20] inet_net_pton.3: srcfix, cfix
Date: Tue, 20 May 2014 09:01:57 +0200
Message-ID: <537AFDE5.3030208@gmail.com>
References: <1400540546-25578-1-git-send-email-rv@rasmusvillemoes.dk> <1400540546-25578-11-git-send-email-rv@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400540546-25578-11-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied. Thanks, Rasmus.

Cheers,

Michael



On 05/20/2014 01:02 AM, Rasmus Villemoes wrote:
> Use a consistent style throughout the man-pages.
> ---
>  man3/inet_net_pton.3 | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/man3/inet_net_pton.3 b/man3/inet_net_pton.3
> index 8276012..340a849 100644
> --- a/man3/inet_net_pton.3
> +++ b/man3/inet_net_pton.3
> @@ -37,8 +37,7 @@ inet_net_pton, inet_net_ntop \- Internet network number conversion
>  .BI "                    char *" pres ", size_t " psize );
>  .fi
>  .sp
> -Link with
> -.IR \-lresolv .
> +Link with \fI\-lresolv\fP.
>  .sp
>  .in -4n
>  Feature Test Macro Requirements for glibc (see
> @@ -331,7 +330,7 @@ Raw address:              c1a80180
>  .in
>  .SS Program source
>  .nf
> -/* Link with -lresolv */
> +/* Link with "\-lresolv" */
>  
>  #include <arpa/inet.h>
>  #include <stdio.h>
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
