From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] strtoul.3: ATTRIBUTES: Note functions that are thread
 safe with exceptions
Date: Wed, 29 Jan 2014 10:40:43 +0100
Message-ID: <52E8CC9B.80306@gmail.com>
References: <1390787522-12070-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390787522-12070-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied. Thanks, Haitao.

Cheers,

Michael


On 01/27/2014 02:52 AM, Peng Haitao wrote:
> The functions strtoul(), strtoull() and strtouq() are thread safe
> with exceptions.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/strtoul.3 | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/strtoul.3 b/man3/strtoul.3
> index a40a99a..034f647 100644
> --- a/man3/strtoul.3
> +++ b/man3/strtoul.3
> @@ -30,7 +30,7 @@
>  .\" Fixed typo, aeb, 950823
>  .\" 2002-02-22, joey, mihtjel: Added strtoull()
>  .\"
> -.TH STRTOUL 3  2011-09-15 "GNU" "Linux Programmer's Manual"
> +.TH STRTOUL 3  2014-01-27 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  strtoul, strtoull, strtouq \- convert a string to an unsigned long integer
>  .SH SYNOPSIS
> @@ -162,6 +162,18 @@ to
>  .B EINVAL
>  in case
>  no conversion was performed (no digits seen, and 0 returned).
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR strtoul (),
> +.BR strtoull (),
> +and
> +.BR strtouq ()
> +functions are thread-safe with exceptions.
> +These functions can be safely used in multithreaded applications,
> +as long as
> +.BR setlocale (3)
> +is not called to change the locale during their execution.
>  .SH CONFORMING TO
>  .BR strtoul ()
>  conforms to SVr4, C89, C99 and POSIX-2001, and
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
