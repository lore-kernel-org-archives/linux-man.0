From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ld.so.8: Add --inhibit-cache option.
Date: Sat, 18 Oct 2014 10:04:29 +0200
Message-ID: <54421F0D.8030102@gmail.com>
References: <54417889.7040104@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54417889.7040104-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Siddhesh Poyarekar <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 10/17/2014 10:14 PM, Carlos O'Donell wrote:
> Michael,
> 
> The dynamic loader has 6 options, only 5 are documented.
> This patch documents the sixth option i.e. `--inhibit-cache`.
> 
> Please apply the patch against master.

Thanks, Carlos. Applied.

Cheers,

Michael


> diff --git a/man8/ld.so.8 b/man8/ld.so.8
> index fe7d2f0..2ef5977 100644
> --- a/man8/ld.so.8
> +++ b/man8/ld.so.8
> @@ -147,6 +147,9 @@ List all dependencies and how they are resolved.
>  Verify that program is dynamically linked and this dynamic linker can handle
>  it.
>  .TP
> +.B \-\-inhibit-cache
> +Do not use /etc/ld.so.cache.
> +.TP
>  .B \-\-library\-path PATH
>  Use PATH instead of
>  .B LD_LIBRARY_PATH
> ---
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
