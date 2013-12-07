From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] wcsncat.3: ATTRIBUTES: Note function that is thread-safe
Date: Sat, 07 Dec 2013 14:50:52 -0800
Message-ID: <52A3A64C.4050208@gmail.com>
References: <1385348302-25775-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385348302-25775-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/24/13 18:58, Peng Haitao wrote:
> The function wcsncat() is thread safe.

Applied. Thanks, Peng Haitao.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/wcsncat.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/wcsncat.3 b/man3/wcsncat.3
> index 5f16f49..7422885 100644
> --- a/man3/wcsncat.3
> +++ b/man3/wcsncat.3
> @@ -13,7 +13,7 @@
>  .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.org/online.html
>  .\"   ISO/IEC 9899:1999
>  .\"
> -.TH WCSNCAT 3  2011-09-28 "GNU" "Linux Programmer's Manual"
> +.TH WCSNCAT 3  2013-11-25 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  wcsncat \- concatenate two wide-character strings
>  .SH SYNOPSIS
> @@ -48,6 +48,11 @@ wide characters at
>  .BR wcsncat ()
>  returns
>  .IR dest .
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR wcsncat ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  C99.
>  .SH SEE ALSO
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
