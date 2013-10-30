From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] erf.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 30 Oct 2013 14:43:35 +1300
Message-ID: <52706447.1040701@gmail.com>
References: <1383014282-10627-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383014282-10627-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 29.10.2013 15:38, Peng Haitao wrote:
> The functions erf(), erff() and erfl() are thread safe.

Applied.

Thanks,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/erf.3 | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/erf.3 b/man3/erf.3
> index 2f903b0..560b78c 100644
> --- a/man3/erf.3
> +++ b/man3/erf.3
> @@ -32,7 +32,7 @@
>  .\" Modified 2002-07-27 by Walter Harms
>  .\" 	(walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org)
>  .\"
> -.TH ERF 3  2010-09-20 "GNU" "Linux Programmer's Manual"
> +.TH ERF 3  2013-10-29 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  erf, erff, erfl, \- error function
>  .SH SYNOPSIS
> @@ -123,6 +123,14 @@ These functions do not set
>  .IR errno .
>  .\" FIXME . Is it intentional that these functions do not set errno?
>  .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6785
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR erf (),
> +.BR erff (),
> +and
> +.BR erfl ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  C99, POSIX.1-2001.
>  The variant returning
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
My next Linux/UNIX system programming course:
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
