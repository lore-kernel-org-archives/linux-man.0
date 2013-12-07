From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] wcswidth.3: ATTRIBUTES: Note function that is thread
 safe with exceptions
Date: Sat, 07 Dec 2013 14:43:50 -0800
Message-ID: <52A3A4A6.4060502@gmail.com>
References: <1384761031-31804-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384761031-31804-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/17/13 23:50, Peng Haitao wrote:
> The function wcswidth() is thread safe with exceptions.

Applied. Thanks, Peng Haitao.

Cheers,

Michael



> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/wcswidth.3 | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/wcswidth.3 b/man3/wcswidth.3
> index cf326be..0252b1b 100644
> --- a/man3/wcswidth.3
> +++ b/man3/wcswidth.3
> @@ -12,7 +12,7 @@
>  .\"   Dinkumware C library reference http://www.dinkumware.com/
>  .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.org/online.html
>  .\"
> -.TH WCSWIDTH 3  2010-09-10 "GNU" "Linux Programmer's Manual"
> +.TH WCSWIDTH 3  2013-11-18 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  wcswidth \- determine columns needed for a fixed-size wide-character string
>  .SH SYNOPSIS
> @@ -44,6 +44,14 @@ wide-character string
>  .IR s ,
>  truncated to at most length
>  .IR n .
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR wcswidth ()
> +function is thread-safe with exceptions.
> +It can be safely used in multithreaded applications, as long as
> +.BR setlocale (3)
> +is not called to change the locale.
>  .SH CONFORMING TO
>  POSIX.1-2001.
>  .SH NOTES
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
