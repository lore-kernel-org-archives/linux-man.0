From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch 5/7] getpwent_r.3: wfix
Date: Fri, 16 Jan 2015 07:00:03 +0100
Message-ID: <54B8A8E3.1050706@gmail.com>
References: <54B88302.5070405@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54B88302.5070405-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/16/2015 04:18 AM, Carlos O'Donell wrote:
> Harmonize all the manual pages to use "stream" for FILE*
> instead of randomly using "fp" or "stream." Choosing something
> and being consistent helps users scan the man pages quickly
> and understand what they are looking at.

Thanks, Carlos. Applied.

Cheers,

Michael



> Patch against master.
> 
> diff --git a/man3/getpwent_r.3 b/man3/getpwent_r.3
> index a9076a9..ac84e3b 100644
> --- a/man3/getpwent_r.3
> +++ b/man3/getpwent_r.3
> @@ -32,7 +32,7 @@ getpwent_r, fgetpwent_r \- get passwd file entry reentrantly
>  .br
>  .BI "               size_t " buflen ", struct passwd **" pwbufp );
>  .sp
> -.BI "int fgetpwent_r(FILE *" fp ", struct passwd *" pwbuf ", char *" buf ,
> +.BI "int fgetpwent_r(FILE *" stream ", struct passwd *" pwbuf ", char *" buf ,
>  .br
>  .BI "                size_t " buflen ", struct passwd **" pwbufp );
>  .fi
> @@ -58,8 +58,8 @@ and
>  .BR fgetpwent (3).
>  The former reads the next passwd entry from the stream initialized by
>  .BR setpwent (3).
> -The latter reads the next passwd entry from the stream
> -.IR fp .
> +The latter reads the next passwd entry from the
> +.IR stream .
>  .PP
>  The \fIpasswd\fP structure is defined in
>  .I <pwd.h>
> ---
> 
> Cheers,
> Carlos.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
