From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iswalnum.3: ATTRIBUTES: Note function that is thread
 safe with exceptions
Date: Wed, 29 Jan 2014 11:30:52 +0100
Message-ID: <52E8D85C.3010501@gmail.com>
References: <1390893555-873-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390893555-873-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied.

Cheers

Michael


On 01/28/2014 08:19 AM, Peng Haitao wrote:
> The function iswalnum() is thread safe with exceptions.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/iswalnum.3 | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/iswalnum.3 b/man3/iswalnum.3
> index 89e98a2..aa7d069 100644
> --- a/man3/iswalnum.3
> +++ b/man3/iswalnum.3
> @@ -13,7 +13,7 @@
>  .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.org/online.html
>  .\"   ISO/IEC 9899:1999
>  .\"
> -.TH ISWALNUM 3  1999-07-25 "GNU" "Linux Programmer's Manual"
> +.TH ISWALNUM 3  2014-01-28 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  iswalnum \- test for alphanumeric wide character
>  .SH SYNOPSIS
> @@ -63,6 +63,14 @@ if
>  is a wide character
>  belonging to the wide-character class "alnum".
>  Otherwise it returns zero.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR iswalnum ()
> +function is thread-safe with exceptions.
> +It can be safely used in multithreaded applications, as long as
> +.BR setlocale (3)
> +is not called to change the locale during its execution.
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
