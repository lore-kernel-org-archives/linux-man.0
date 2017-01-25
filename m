From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] iconv.1: tfix
Date: Thu, 26 Jan 2017 07:25:30 +1300
Message-ID: <1b4efb70-edfc-d204-ad2a-a5b73d799f8e@gmail.com>
References: <20170125155846.4908-1-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170125155846.4908-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/26/2017 04:58 AM, Jakub Wilk wrote:
> Escape hyphens in option names and pathnames.


Applied! Thanks, Jakub.

Cheers,

Michael



> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
> ---
>  man1/iconv.1 | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/man1/iconv.1 b/man1/iconv.1
> index 92542a5e3..8c7e2447d 100644
> --- a/man1/iconv.1
> +++ b/man1/iconv.1
> @@ -29,8 +29,8 @@ iconv \- convert text from one character encoding to another
>  .SH SYNOPSIS
>  .B iconv
>  .RI [ options ]
> -.RI "[-f " from-encoding "]"
> -.RI "[-t " to-encoding "]"
> +.RI "[\-f " from-encoding "]"
> +.RI "[\-t " to-encoding "]"
>  .RI [ inputfile ]...
>  .SH DESCRIPTION
>  The
> @@ -55,12 +55,12 @@ from the current locale's character
>  encoding.
>  .SH OPTIONS
>  .TP
> -.BI \-f " from-encoding" ", \-\-from-code=" from-encoding
> +.BI \-f " from-encoding" ", \-\-from\-code=" from-encoding
>  Use
>  .I from-encoding
>  for input characters.
>  .TP
> -.BI \-t " to-encoding" ", \-\-to-code=" to-encoding
> +.BI \-t " to-encoding" ", \-\-to\-code=" to-encoding
>  Use
>  .I to-encoding
>  for output characters.
> @@ -171,10 +171,10 @@ directories.
>  .I /usr/lib/gconv
>  Usual default gconv module path.
>  .TP
> -.I /usr/lib/gconv/gconv-modules
> +.I /usr/lib/gconv/gconv\-modules
>  Usual system default gconv module configuration file.
>  .TP
> -.I /usr/lib/gconv/gconv-modules.cache
> +.I /usr/lib/gconv/gconv\-modules.cache
>  Usual system gconv module configuration cache.
>  .SH CONFORMING TO
>  POSIX.1-2001.
> @@ -183,7 +183,7 @@ Convert text from the ISO 8859-15 character encoding to UTF-8:
>  
>  .in +4n
>  .nf
> -$ \fBiconv \-f ISO\-8859\-15 -t UTF\-8 < input.txt > output.txt\fP
> +$ \fBiconv \-f ISO\-8859\-15 \-t UTF\-8 < input.txt > output.txt\fP
>  .fi
>  .in
>  .PP
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
