From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] strtod.3: ATTRIBUTES: Note functions that are thread
 safe with exceptions
Date: Mon, 20 Jan 2014 13:23:14 +0100
Message-ID: <52DD1532.9060009@gmail.com>
References: <1390205712-10266-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390205712-10266-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied.

Cheers,

Michael


On 01/20/2014 09:15 AM, Peng Haitao wrote:
> The functions strtod(), strtof() and strtold() are thread safe
> with exceptions.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/strtod.3 | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/strtod.3 b/man3/strtod.3
> index 8498a06..43efb50 100644
> --- a/man3/strtod.3
> +++ b/man3/strtod.3
> @@ -42,7 +42,7 @@
>  .\"   (michael-dcCOIfDdh9paP0f+8Gpiu5H8eBQqjErGxu+e+x4sQ7A@public.gmane.org)
>  .\" Added strof, strtold, aeb, 2001-06-07
>  .\"
> -.TH STRTOD 3 2010-09-20 "Linux" "Linux Programmer's Manual"
> +.TH STRTOD 3 2014-01-20 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  strtod, strtof, strtold \- convert ASCII string to floating-point number
>  .SH SYNOPSIS
> @@ -157,6 +157,18 @@ is stored in
>  .TP
>  .B ERANGE
>  Overflow or underflow occurred.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR strtod (),
> +.BR strtof (),
> +and
> +.BR strtold ()
> +functions are thread-safe with exceptions.
> +These functions can be safely used in multithreaded applications,
> +as long as
> +.BR setlocale (3)
> +is not called to change the locale.
>  .SH CONFORMING TO
>  C89 describes
>  .BR strtod (),
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
