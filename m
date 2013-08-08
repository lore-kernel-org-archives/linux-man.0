From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fpclassify.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 08 Aug 2013 10:20:26 +0200
Message-ID: <520354CA.80709@gmail.com>
References: <1375778264-9177-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375778264-9177-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/06/13 10:37, Peng Haitao wrote:
> The functions fpclassify(), isfinite(), isnormal(), isnan(), and
> isinf() are thread safe.

Applied.

Thanks,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/fpclassify.3 | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/fpclassify.3 b/man3/fpclassify.3
> index d4414d3..86d3c3c 100644
> --- a/man3/fpclassify.3
> +++ b/man3/fpclassify.3
> @@ -7,7 +7,7 @@
>  .\" This was done with the help of the glibc manual.
>  .\"
>  .\" 2004-10-31, aeb, corrected
> -.TH FPCLASSIFY 3  2010-09-20 "" "Linux Programmer's Manual"
> +.TH FPCLASSIFY 3  2013-08-06 "" "Linux Programmer's Manual"
>  .SH NAME
>  fpclassify, isfinite, isnormal, isnan, isinf \- floating-point
>  classification macros
> @@ -115,6 +115,16 @@ returns 1 if
>  is positive infinity, and \-1 if
>  .I x
>  is negative infinity.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR fpclassify (),
> +.BR isfinite (),
> +.BR isnormal (),
> +.BR isnan (),
> +and
> +.BR isinf ()
> +macros are thread-safe.
>  .SH CONFORMING TO
>  C99, POSIX.1.
>  
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
