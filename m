From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] creal.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 26 Sep 2013 15:16:58 +0200
Message-ID: <524433CA.5050303@gmail.com>
References: <1379475835-9639-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379475835-9639-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 18.09.2013 05:43, Peng Haitao wrote:
> The functions creal(), crealf() and creall() are thread safe.

Thanks. Applied. 

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/creal.3 | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/creal.3 b/man3/creal.3
> index d67b8bf..8f50792 100644
> --- a/man3/creal.3
> +++ b/man3/creal.3
> @@ -4,7 +4,7 @@
>  .\" Distributed under GPL
>  .\" %%%LICENSE_END
>  .\"
> -.TH CREAL 3 2008-08-11 "" "Linux Programmer's Manual"
> +.TH CREAL 3 2013-09-18 "" "Linux Programmer's Manual"
>  .SH NAME
>  creal, crealf, creall \- get real part of a complex number
>  .SH SYNOPSIS
> @@ -30,6 +30,14 @@ One has:
>  .fi
>  .SH VERSIONS
>  These functions first appeared in glibc in version 2.1.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR creal (),
> +.BR crealf (),
> +and
> +.BR creall ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  C99.
>  .SH NOTES
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
