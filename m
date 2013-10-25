From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] atan.3: ATTRIBUTES: Note functions that are thread-safe
Date: Sat, 26 Oct 2013 11:19:49 +1300
Message-ID: <526AEE85.6060308@gmail.com>
References: <1381139308-10987-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381139308-10987-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07.10.2013 22:48, Peng Haitao wrote:
> The functions atan(), atanf() and atanl() are thread safe.


Applied.

Thanks,

Michael



> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/atan.3 | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/atan.3 b/man3/atan.3
> index 7eb8218..9f5a173 100644
> --- a/man3/atan.3
> +++ b/man3/atan.3
> @@ -32,7 +32,7 @@
>  .\" Modified 2002-07-27 by Walter Harms
>  .\" 	(walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org)
>  .\"
> -.TH ATAN 3  2010-09-20 "" "Linux Programmer's Manual"
> +.TH ATAN 3  2013-10-07 "" "Linux Programmer's Manual"
>  .SH NAME
>  atan, atanf, atanl \- arc tangent function
>  .SH SYNOPSIS
> @@ -93,6 +93,14 @@ is positive infinity (negative infinity), +pi/2 (\-pi/2) is returned.
>  .\" glibc 2.8 does not do this.
>  .SH ERRORS
>  No errors occur.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR atan (),
> +.BR atanf (),
> +and
> +.BR atanl ()
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
