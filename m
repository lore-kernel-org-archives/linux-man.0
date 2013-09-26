From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ftime.3: ATTRIBUTES: Note function that is thread-safe
Date: Thu, 26 Sep 2013 15:12:16 +0200
Message-ID: <524432B0.8080501@gmail.com>
References: <1380186453-3334-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380186453-3334-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 26.09.2013 11:07, Peng Haitao wrote:
> The function ftime() is thread safe.

Thanks. Applied.

Cheers,

Michael



> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/ftime.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/ftime.3 b/man3/ftime.3
> index 2acdd1a..1ac4fd6 100644
> --- a/man3/ftime.3
> +++ b/man3/ftime.3
> @@ -27,7 +27,7 @@
>  .\" Modified Sun Oct 18 17:31:43 1998 by Andries Brouwer (aeb-rh8NL+sEX9E@public.gmane.org)
>  .\" 2008-06-23, mtk, minor rewrites, added some details
>  .\"
> -.TH FTIME 3 2010-02-25 "GNU" "Linux Programmer's Manual"
> +.TH FTIME 3 2013-09-26 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  ftime \- return date and time
>  .SH SYNOPSIS
> @@ -67,6 +67,11 @@ fields are unspecified; avoid relying on them.
>  .SH RETURN VALUE
>  This function always returns 0.
>  (POSIX.1-2001 specifies, and some systems document, a \-1 error return.)
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR ftime ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  4.2BSD, POSIX.1-2001.
>  POSIX.1-2008 removes the specification of
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
My next Linux/UNIX system programming course:
http://blog.man7.org/2013/09/linuxunix-system-programming-course.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
