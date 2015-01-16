From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch 4/7] putgrent.3: wfix
Date: Fri, 16 Jan 2015 06:45:06 +0100
Message-ID: <54B8A562.5000205@gmail.com>
References: <54B88300.4000205@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54B88300.4000205-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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
> diff --git a/man3/putgrent.3 b/man3/putgrent.3
> index 0d59c82..5954626 100644
> --- a/man3/putgrent.3
> +++ b/man3/putgrent.3
> @@ -12,7 +12,7 @@ putgrent \- write a group database entry to a file
>  .br
>  .B #include <grp.h>
>  .sp
> -.BI "int putgrent(const struct group *" grp ", FILE *" fp );
> +.BI "int putgrent(const struct group *" grp ", FILE *" stream );
>  .SH DESCRIPTION
>  The
>  .BR putgrent ()
> @@ -21,8 +21,7 @@ function is the counterpart for
>  The function writes the content of the provided
>  .IR "struct group"
>  into the
> -file pointed to by
> -.IR fp .
> +.IR stream .
>  The list of group members must be NULL-terminated or NULL-initialized.
>  .sp
>  The
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
