From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] cbrt.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 26 Sep 2013 15:15:17 +0200
Message-ID: <52443365.5070403@gmail.com>
References: <1379495536-7221-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379495536-7221-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 18.09.2013 11:12, Peng Haitao wrote:
> The functions cbrt(), cbrtf() and cbrtl() are thread safe.

Applied.

Thanks,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/cbrt.3 | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/cbrt.3 b/man3/cbrt.3
> index 91e0891..466e5d3 100644
> --- a/man3/cbrt.3
> +++ b/man3/cbrt.3
> @@ -27,7 +27,7 @@
>  .\" Modified 2002-07-27 Walter Harms
>  .\" (walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org)
>  .\"
> -.TH CBRT 3  2010-09-20 "GNU"  "Linux Programmer's Manual"
> +.TH CBRT 3  2013-09-18 "GNU"  "Linux Programmer's Manual"
>  .SH NAME
>  cbrt, cbrtf, cbrtl \- cube root function
>  .SH SYNOPSIS
> @@ -87,6 +87,14 @@ is +0, \-0, positive infinity, negative infinity, or NaN,
>  is returned.
>  .SH ERRORS
>  No errors occur.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR cbrt (),
> +.BR cbrtf (),
> +and
> +.BR cbrtl ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  C99, POSIX.1-2001.
>  .\" .BR cbrt ()
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
