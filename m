From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 05/20] a64l.3: fix prototype for a64l()
Date: Tue, 20 May 2014 07:16:42 +0200
Message-ID: <537AE53A.50104@gmail.com>
References: <1400540546-25578-1-git-send-email-rv@rasmusvillemoes.dk> <1400540546-25578-6-git-send-email-rv@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400540546-25578-6-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Rasmus! Applied.

Cheers,

Michael

On 05/20/2014 01:02 AM, Rasmus Villemoes wrote:
> The argument is const, both according to POSIX and the glibc headers.
> ---
>  man3/a64l.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/a64l.3 b/man3/a64l.3
> index 61a1872..0a21f82 100644
> --- a/man3/a64l.3
> +++ b/man3/a64l.3
> @@ -12,7 +12,7 @@ a64l, l64a \- convert between long and base-64
>  .SH SYNOPSIS
>  .B #include <stdlib.h>
>  .sp
> -.BI "long a64l(char *" str64 );
> +.BI "long a64l(const char *" str64 );
>  .sp
>  .BI "char *l64a(long " value );
>  .sp
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
