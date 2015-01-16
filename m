From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch 7/7] getmntent.3: wfix
Date: Fri, 16 Jan 2015 06:59:54 +0100
Message-ID: <54B8A8DA.30300@gmail.com>
References: <54B88309.6050505@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54B88309.6050505-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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
> diff --git a/man3/getmntent.3 b/man3/getmntent.3
> index 02759a2..8540bc5 100644
> --- a/man3/getmntent.3
> +++ b/man3/getmntent.3
> @@ -40,18 +40,18 @@ getmntent_r \- get filesystem descriptor file entry
>  .sp
>  .BI "FILE *setmntent(const char *" filename ", const char *" type );
>  .sp
> -.BI "struct mntent *getmntent(FILE *" fp );
> +.BI "struct mntent *getmntent(FILE *" stream );
>  .sp
> -.BI "int addmntent(FILE *" fp ", const struct mntent *" mnt );
> +.BI "int addmntent(FILE *" stream ", const struct mntent *" mnt );
>  .sp
> -.BI "int endmntent(FILE *" fp );
> +.BI "int endmntent(FILE *" streamp );
>  .sp
>  .BI "char *hasmntopt(const struct mntent *" mnt ", const char *" opt );
>  .sp
>  /* GNU extension */
>  .B #include <mntent.h>
>  .sp
> -.BI "struct mntent *getmntent_r(FILE *" fp ", struct mntent *" mntbuf ,
> +.BI "struct mntent *getmntent_r(FILE *" streamp ", struct mntent *" mntbuf ,
>  .BI "                           char *" buf ", int " buflen );
>  .fi
>  .sp
> @@ -84,9 +84,9 @@ argument of
>  .PP
>  The
>  .BR getmntent ()
> -function reads the next line from the filesystem
> -description file
> -.I fp
> +function reads the next line of the filesystem
> +description file from
> +.I stream
>  and returns a pointer to a structure
>  containing the broken out fields from a line in the file.
>  The pointer
> @@ -101,13 +101,14 @@ function adds the
>  structure
>  .I mnt
>  to
> -the end of the open file
> -.IR fp .
> +the end of the open
> +.IR stream .
>  .PP
>  The
>  .BR endmntent ()
> -function closes the filesystem description file
> -.IR fp .
> +function closes the
> +.IR stream
> +associated with the filesystem description file.
>  .PP
>  The
>  .BR hasmntopt ()
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
