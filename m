From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iswblank.3: ATTRIBUTES: Note function that is thread
 safe with exceptions
Date: Mon, 10 Feb 2014 11:06:40 +0100
Message-ID: <52F8A4B0.7030808@gmail.com>
References: <1392013239-31138-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392013239-31138-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thank you, Haitao.

Applied.

Cheers,

Michael


On 02/10/2014 07:20 AM, Peng Haitao wrote:
> The function iswblank() is thread safe with exceptions.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/iswblank.3 | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/iswblank.3 b/man3/iswblank.3
> index 34126ae..2d29484 100644
> --- a/man3/iswblank.3
> +++ b/man3/iswblank.3
> @@ -13,7 +13,7 @@
>  .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.org/online.html
>  .\"   ISO/IEC 9899:1999
>  .\"
> -.TH ISWBLANK 3  2010-09-20 "GNU" "Linux Programmer's Manual"
> +.TH ISWBLANK 3  2014-02-10 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  iswblank \- test for whitespace wide character
>  .SH SYNOPSIS
> @@ -66,6 +66,14 @@ function returns nonzero
>  if \fIwc\fP is a wide character
>  belonging to the wide-character class "blank".
>  Otherwise it returns zero.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR iswblank ()
> +function is thread-safe with exceptions.
> +It can be safely used in multithreaded applications, as long as
> +.BR setlocale (3)
> +is not called to change the locale during its execution.
>  .SH CONFORMING TO
>  POSIX.1-2001.
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
