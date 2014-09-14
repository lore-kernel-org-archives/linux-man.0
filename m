From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getgrent.3: Add ENOENT to error list.
Date: Sun, 14 Sep 2014 09:09:36 -0700
Message-ID: <5415BDC0.50205@gmail.com>
References: <54105ED1.5020206@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54105ED1.5020206-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Simo Sorce <ssorce-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jakub Hrozek <jhrozek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Carlos,

On 09/10/2014 07:23 AM, Carlos O'Donell wrote:
> Michael,
> 
> It's possible to get ENOENT returned from getgrent
> if the backend, for example say SSSD, isn't configured
> or the daemon isn't running. The same can be said of any
> of the NSS backend.
> 
> As POSIX does not list ENOENT, we can list it ourselves
> and define it how we like.
> 
> I don't know how you handle errno values that are glibc
> specific, but here is the patch that enhances getgrent
> to make users aware of what ENOENT is intended to mean
> from glibc.

Thanks. I've applied. Are similar fixes also required for, 
say, getpwent.3, getspent.3, and perhaps other pages 
(e.g., putgrent)?

Cheers,

Michael


> Patch against master. Pleas apply.
> 
> diff --git a/man3/getgrent.3 b/man3/getgrent.3
> index f49c746..02f26bd 100644
> --- a/man3/getgrent.3
> +++ b/man3/getgrent.3
> @@ -141,6 +141,11 @@ The calling process already has too many open files.
>  .B ENFILE
>  Too many open files in the system.
>  .TP
> +.\" not in POSIX
> +.B ENOENT
> +A necessary input file cannot be found.
> +For NSS backends in glibc this indicates the backend is not correctly configured.
> +.TP
>  .B ENOMEM
>  .\" not in POSIX
>  Insufficient memory to allocate
> ---
> 
> Cheers,
> Carlos.
> .
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
