From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch 3/7] getspnam.3: wfix
Date: Fri, 16 Jan 2015 06:59:44 +0100
Message-ID: <54B8A8D0.70404@gmail.com>
References: <54B882FD.9090009@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54B882FD.9090009-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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
> diff --git a/man3/getspnam.3 b/man3/getspnam.3
> index 13d6157..e230b78 100644
> --- a/man3/getspnam.3
> +++ b/man3/getspnam.3
> @@ -24,11 +24,11 @@ lckpwdf, ulckpwdf \- get shadow password file entry
>  .sp
>  .B void endspent(void);
>  .sp
> -.BI "struct spwd *fgetspent(FILE *" fp );
> +.BI "struct spwd *fgetspent(FILE *" stream );
>  .sp
>  .BI "struct spwd *sgetspent(const char *" s );
>  .sp
> -.BI "int putspent(const struct spwd *" p ", FILE *" fp );
> +.BI "int putspent(const struct spwd *" p ", FILE *" stream );
>  .sp
>  .B int lckpwdf(void);
>  .sp
> @@ -46,7 +46,7 @@ lckpwdf, ulckpwdf \- get shadow password file entry
>  .br
>  .BI "        char *" buf ", size_t " buflen ", struct spwd **" spbufp );
>  .sp
> -.BI "int fgetspent_r(FILE *" fp ", struct spwd *" spbuf ,
> +.BI "int fgetspent_r(FILE *" stream ", struct spwd *" spbuf ,
>  .br
>  .BI "        char *" buf ", size_t " buflen ", struct spwd **" spbufp );
>  .sp
> @@ -137,8 +137,8 @@ The
>  function writes the contents of the supplied struct
>  .I spwd
>  .I *p
> -as a text line in the shadow password file format to the stream
> -.IR fp .
> +as a text line in the shadow password file format to the
> +.IR stream .
>  String entries with value NULL and numerical entries with value \-1
>  are written as an empty string.
>  .LP
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
