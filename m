From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] strfmon.3: fix CONFORMING TO
Date: Fri, 12 Jun 2015 20:18:22 +0200
Message-ID: <557B226E.5020408@gmail.com>
References: <5576F5B5.4060407@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5576F5B5.4060407-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 06/09/2015 04:18 PM, Marko Myllynen wrote:
> Hi Michael,
> 
> AFAICS strfmon(3) is now defined in POSIX and the glibc
> implementation is as specified there.


Thanks, Marko. Applied.

Cheers,

Michael


> http://pubs.opengroup.org/onlinepubs/9699919799/functions/strfmon.html
> ---
>  man3/strfmon.3 |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/man3/strfmon.3 b/man3/strfmon.3
> index 3c1c19b..4964b36 100644
> --- a/man3/strfmon.3
> +++ b/man3/strfmon.3
> @@ -149,8 +149,7 @@ T}	Thread safety	MT-Safe locale
>  .TE
>  
>  .SH CONFORMING TO
> -Not in POSIX.1-2001.
> -Present on several other systems.
> +POSIX.1-2008.
>  .SH EXAMPLE
>  The call
>  .in +4n
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
