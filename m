From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] wctype.3: ATTRIBUTES: Note function that is thread safe
 with exceptions
Date: Fri, 08 Nov 2013 05:59:06 +1300
Message-ID: <527BC6DA.2040100@gmail.com>
References: <1383534079-15697-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383534079-15697-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/04/13 16:01, Peng Haitao wrote:
> The function wctype() is thread safe with exceptions.

Thanks, Peng Haitao. Applied.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/wctype.3 | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/wctype.3 b/man3/wctype.3
> index 45ab1be..61ed00a 100644
> --- a/man3/wctype.3
> +++ b/man3/wctype.3
> @@ -13,7 +13,7 @@
>  .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.org/online.html
>  .\"   ISO/IEC 9899:1999
>  .\"
> -.TH WCTYPE 3  1999-07-25 "GNU" "Linux Programmer's Manual"
> +.TH WCTYPE 3  2013-11-04 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  wctype \- wide-character classification
>  .SH SYNOPSIS
> @@ -71,6 +71,14 @@ if the
>  is valid.
>  Otherwise it returns
>  .IR "(wctype_t) 0" .
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR wctype ()
> +function is thread-safe with exceptions.
> +It can be safely used in multithreaded applications, as long as
> +.BR setlocale (3)
> +is not called to change the locale.
>  .SH CONFORMING TO
>  C99.
>  .SH NOTES
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
