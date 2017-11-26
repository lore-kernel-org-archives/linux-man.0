From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] makedev.3: glibc has deprecated exposing the definitions
 via <sys/types.h>
Date: Sun, 26 Nov 2017 08:36:15 +0100
Message-ID: <4a5a6a79-c960-404d-2e48-5ed8779dd11a@gmail.com>
References: <20171125101207.27932-1-bunk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171125101207.27932-1-bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/25/2017 11:12 AM, Adrian Bunk wrote:
> Compile warning with glibc 2.25:
> 
> warning: In the GNU C Library, "makedev" is defined
>  by <sys/sysmacros.h>. For historical compatibility, it is
>  currently defined by <sys/types.h> as well, but we plan to
>  remove this soon. To use "makedev", include <sys/sysmacros.h>
>  directly. If you did not intend to use a system-defined macro
>  "makedev", you should undefine it after including <sys/types.h>.

Thanks, Adrian. Patch applied.

Cheers,

Michael

> Background:
> https://sourceware.org/git/?p=glibc.git;a=commit;h=dbab6577c6684c62bd2521c1c29dc25c3cac966f
> ---
>  man3/makedev.3 | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/man3/makedev.3 b/man3/makedev.3
> index 3398bbb0b..75c191be7 100644
> --- a/man3/makedev.3
> +++ b/man3/makedev.3
> @@ -94,9 +94,10 @@ and
>  The latter names are exported, but the traditional names are more portable.
>  .PP
>  The BSDs expose the definitions for these macros via
> -.IR <sys/types.h> ,
> -and glibc also exposes definitions for these macros from that
> -header file if suitable feature test macros are defined.
> +.IR <sys/types.h> .
> +glibc also exposes definitions for these macros from that
> +header file if suitable feature test macros are defined,
> +but this is deprecated and will be removed in the future.
>  .SH SEE ALSO
>  .BR mknod (2),
>  .BR stat (2)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
