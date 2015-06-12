From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] setlocale.3: tweak C/POSIX locale portability description
Date: Fri, 12 Jun 2015 20:17:54 +0200
Message-ID: <557B2252.3070908@gmail.com>
References: <5576F5A1.9030202@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5576F5A1.9030202-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 06/09/2015 04:18 PM, Marko Myllynen wrote:
> Hi Michael,
> 
> as discussed earlier, the current description might be a little
> bit too stringent, let's avoid the issue by describing the
> portability aspect on a slightly higher level.
> 
> References:
> 
> http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap06.html
> http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap07.html
> http://pubs.opengroup.org/onlinepubs/9699919799/functions/setlocale.html

Thanks, Marko. Applied.

Cheers,

Michael


> ---
>  man3/setlocale.3 |    6 ++----
>  1 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/man3/setlocale.3 b/man3/setlocale.3
> index a3102ba..1d05ba7 100644
> --- a/man3/setlocale.3
> +++ b/man3/setlocale.3
> @@ -117,10 +117,8 @@ The locale
>  .B """C"""
>  or
>  .B """POSIX"""
> -is a portable locale; its
> -.B LC_CTYPE
> -part corresponds to the 7-bit ASCII
> -character set.
> +is a portable locale;
> +it exists on all conforming systems.
>  .PP
>  A locale name is typically of the form
>  .IR language "[_" territory "][." codeset "][@" modifier "],"
> 
> Thanks,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
