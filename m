From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iswctype.3: ATTRIBUTES: Note function that is thread-safe
Date: Sat, 22 Feb 2014 10:21:45 +0100
Message-ID: <53086C29.10306@gmail.com>
References: <1392341143-24155-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392341143-24155-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks. Applied.

On 02/14/2014 02:25 AM, Peng Haitao wrote:
> The function iswctype() is thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/iswctype.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/iswctype.3 b/man3/iswctype.3
> index a7dfec4..28763ad 100644
> --- a/man3/iswctype.3
> +++ b/man3/iswctype.3
> @@ -13,7 +13,7 @@
>  .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.org/online.html
>  .\"   ISO/IEC 9899:1999
>  .\"
> -.TH ISWCTYPE 3  1999-07-25 "GNU" "Linux Programmer's Manual"
> +.TH ISWCTYPE 3  2014-02-14 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  iswctype \- wide-character classification
>  .SH SYNOPSIS
> @@ -54,6 +54,11 @@ the
>  has the designated
>  property.
>  Otherwise it returns 0.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR iswctype ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  C99.
>  .SH NOTES
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
