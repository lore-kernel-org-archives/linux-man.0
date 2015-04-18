From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getent.1: Document options.
Date: Sat, 18 Apr 2015 14:50:48 +0200
Message-ID: <55325328.1040800@gmail.com>
References: <1429253632-14804-1-git-send-email-robbat2@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429253632-14804-1-git-send-email-robbat2-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Robin H. Johnson" <robbat2-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org, Nalin Dahyabhai <nalin-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jay Fenlason <fenlason-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 04/17/2015 08:53 AM, Robin H. Johnson wrote:
> The options to getent are now documented, after being around for nearly
> a decade without changes.

Thanks, Robin! Applied.

Cheers,

Michael


> Signed-off-by: Robin H. Johnson <robbat2-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> CC: Nalin Dahyabhai <nalin-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> (original -s {service} option)
> CC: Jay Fenlason <fenlason-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> (-s {database}:{service} addition)
> CC: Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> (IDN flags)
> ---
>  man1/getent.1 | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/man1/getent.1 b/man1/getent.1
> index a15d880..16f2668 100644
> --- a/man1/getent.1
> +++ b/man1/getent.1
> @@ -1,4 +1,5 @@
>  .\" Copyright (c) 2011, Mark R. Bannister <cambridge-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
> +.\" Copyright (c) 2015, Robin H. Johnson <robbat2-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
>  .\"
>  .\" %%%LICENSE_START(GPLv2+_DOC_FULL)
>  .\" This is free documentation; you can redistribute it and/or
> @@ -25,8 +26,7 @@
>  .SH NAME
>  getent \- get entries from Name Service Switch libraries
>  .SH SYNOPSIS
> -.B "getent
> -.IR database " [" key " ...]"
> +.BR getent\ [\fIoption\fP]...\ \fIdatabase\fP\ \fIkey\fP...
>  .SH DESCRIPTION
>  The
>  .B getent
> @@ -342,6 +342,24 @@ in succession to
>  .BR getspnam (3)
>  and display the result.
>  .RE
> +.SH OPTIONS
> +.TP
> +.BR \-s\ \fIservice\fP\ \-\-service\ \fIservice\fP
> +.\" commit 9d0881aa76b399e6a025c5cf44bebe2ae0efa8af (glibc)
> +Override all databases with the specified service. (Since glibc-2.2.5.)
> +.TP
> +.BR \-s\ \fIdatabase\fP:\fIservice\fP\ \-\-service\ \fIdatabase\fP:\fIservice\fP
> +.\" commit b4f6f4be85d32b9c03361c38376e36f08100e3e8 (glibc)
> +Override only specified databases with the specified service. The option may be used
> +multiple times, but only the last service for each database will be used. (Since glibc-2.4.)
> +.TP
> +.BR \-i\ \-\-no\-idn
> +.\" commit a160f8d808cf8020b13bd0ef4a9eaf3c11f964ad (glibc)
> +Disables IDN encoding in lookups for
> +.BR ahosts
> +/
> +.BR getaddrinfo (3)
> +(Since glibc-2.13.)
>  .SH EXIT STATUS
>  One of the following exit values can be returned by
>  .BR getent :
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
