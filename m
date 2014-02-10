From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iswcntrl.3: ATTRIBUTES: Note function that is thread
 safe with exceptions
Date: Mon, 10 Feb 2014 11:07:16 +0100
Message-ID: <52F8A4D4.2090201@gmail.com>
References: <1392024193-9435-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392024193-9435-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Thanks. Applied.

Cheers,

Michael

On 02/10/2014 10:23 AM, Peng Haitao wrote:
> The function iswcntrl() is thread safe with exceptions.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/iswcntrl.3 | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/iswcntrl.3 b/man3/iswcntrl.3
> index 660aabc..ea5e4cb 100644
> --- a/man3/iswcntrl.3
> +++ b/man3/iswcntrl.3
> @@ -13,7 +13,7 @@
>  .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.org/online.html
>  .\"   ISO/IEC 9899:1999
>  .\"
> -.TH ISWCNTRL 3  1999-07-25 "GNU" "Linux Programmer's Manual"
> +.TH ISWCNTRL 3  2014-02-10 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  iswcntrl \- test for control wide character
>  .SH SYNOPSIS
> @@ -51,6 +51,14 @@ function returns nonzero if
>  is a
>  wide character belonging to the wide-character class "cntrl".
>  Otherwise it returns zero.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR iswcntrl ()
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
