From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] open_by_handle_at.2: Add reference to feature_test_macros(7)
Date: Wed, 04 Jun 2014 20:45:18 +0200
Message-ID: <538F693E.5040909@gmail.com>
References: <1401899608-30515-1-git-send-email-rv@rasmusvillemoes.dk> <1401899608-30515-3-git-send-email-rv@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401899608-30515-3-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Rasmus. Applied.

Cheers,

Michael


On 06/04/2014 06:33 PM, Rasmus Villemoes wrote:
> Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
> ---
>  man2/open_by_handle_at.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/open_by_handle_at.2 b/man2/open_by_handle_at.2
> index 45df008..1d22339 100644
> --- a/man2/open_by_handle_at.2
> +++ b/man2/open_by_handle_at.2
> @@ -28,7 +28,7 @@ name_to_handle_at, open_by_handle_at \- obtain handle
>  for a pathname and open file via a handle
>  .SH SYNOPSIS
>  .nf
> -.B #define _GNU_SOURCE
> +.B "#define _GNU_SOURCE" "         /* See feature_test_macros(7) */"
>  .B #include <sys/types.h>
>  .B #include <sys/stat.h>
>  .B #include <fcntl.h>
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
