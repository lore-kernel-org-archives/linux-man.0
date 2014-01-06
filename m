From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] tan.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 07 Jan 2014 00:51:59 +1300
Message-ID: <52CA98DF.7040708@gmail.com>
References: <1388994429-23224-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1388994429-23224-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/06/14 20:47, Peng Haitao wrote:
> The functions tan(), tanf() and tanl() are thread safe.


Thanks. Applied.

Cheers,

Michael



> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/tan.3 | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/tan.3 b/man3/tan.3
> index 21318d2..f89bed1 100644
> --- a/man3/tan.3
> +++ b/man3/tan.3
> @@ -32,7 +32,7 @@
>  .\" Modified 2002-07-27 by Walter Harms
>  .\" 	(walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org)
>  .\"
> -.TH TAN 3 2010-09-11 ""  "Linux Programmer's Manual"
> +.TH TAN 3 2014-01-06 ""  "Linux Programmer's Manual"
>  .SH NAME
>  tan, tanf, tanl \- tangent function
>  .SH SYNOPSIS
> @@ -130,6 +130,14 @@ Range error: result overflow
>  An overflow floating-point exception
>  .RB ( FE_OVERFLOW )
>  is raised.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR tan (),
> +.BR tanf (),
> +and
> +.BR tanl ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  C99, POSIX.1-2001.
>  The variant returning
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
