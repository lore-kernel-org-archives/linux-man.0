From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] frexp.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 08 Aug 2013 10:20:13 +0200
Message-ID: <520354BD.4020009@gmail.com>
References: <1375767803-3761-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375767803-3761-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/06/13 07:43, Peng Haitao wrote:
> The functions frexp(), frexpf() and frexpl() are thread safe.

Applied.

Thanks,

Michael


> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/frexp.3 | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/frexp.3 b/man3/frexp.3
> index fdd8430..c75d545 100644
> --- a/man3/frexp.3
> +++ b/man3/frexp.3
> @@ -30,7 +30,7 @@
>  .\" Modified 2002-07-27 by Walter Harms
>  .\" 	(walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org)
>  .\"
> -.TH FREXP 3 2010-09-20 "" "Linux Programmer's Manual"
> +.TH FREXP 3 2013-08-06 "" "Linux Programmer's Manual"
>  .SH NAME
>  frexp, frexpf, frexpl \- convert floating-point number to fractional
>  and integral components
> @@ -105,6 +105,14 @@ positive infinity (negative infinity) is returned, and the value of
>  is unspecified.
>  .SH ERRORS
>  No errors occur.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR frexp (),
> +.BR frexpf (),
> +and
> +.BR frexpl ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  C99, POSIX.1-2001.
>  The variant returning
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
