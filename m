From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] logb.3: ATTRIBUTES: Note functions that are thread-safe
Date: Sun, 02 Mar 2014 07:21:20 +0100
Message-ID: <5312CDE0.3010200@gmail.com>
References: <1393562967-27456-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393562967-27456-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied. Thanks, Haitao.

Cheers,

Michael

On 02/28/2014 05:49 AM, Peng Haitao wrote:
> The functions logb(), logbf() and logbl() are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/logb.3 | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/logb.3 b/man3/logb.3
> index 1a92270..4943bf4 100644
> --- a/man3/logb.3
> +++ b/man3/logb.3
> @@ -26,7 +26,7 @@
>  .\"
>  .\" Inspired by a page by Walter Harms created 2002-08-10
>  .\"
> -.TH LOGB 3 2010-09-20 "" "Linux Programmer's Manual"
> +.TH LOGB 3 2014-02-28 "" "Linux Programmer's Manual"
>  .SH NAME
>  logb, logbf, logbl \- get exponent of a floating-point value
>  .SH SYNOPSIS
> @@ -140,6 +140,14 @@ These functions do not set
>  .\" .BR logb ()
>  .\" function occurs in 4.3BSD.
>  .\" see IEEE.3 in the 4.3BSD manual
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR logb (),
> +.BR logbf (),
> +and
> +.BR logbl ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  C99, POSIX.1-2001.
>  .SH SEE ALSO
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
