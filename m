From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] strstr.3: ATTRIBUTES: Note function that is thread safe
 with exceptions
Date: Thu, 16 Jan 2014 12:16:35 +1300
Message-ID: <52D716D3.2040008@gmail.com>
References: <1389770622-19332-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389770622-19332-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/15/2014 08:23 PM, Peng Haitao wrote:
> The function strstr() is thread safe.
> The function strcasestr() is thread safe with exceptions.

Thanks. Applied.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/strstr.3 | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/strstr.3 b/man3/strstr.3
> index ba03f19..c667da5 100644
> --- a/man3/strstr.3
> +++ b/man3/strstr.3
> @@ -30,7 +30,7 @@
>  .\" Added history, aeb, 980113.
>  .\" 2005-05-05 mtk: added strcasestr()
>  .\"
> -.TH STRSTR 3  2014-01-04 "GNU" "Linux Programmer's Manual"
> +.TH STRSTR 3  2014-01-15 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  strstr, strcasestr \- locate a substring
>  .SH SYNOPSIS
> @@ -62,6 +62,18 @@ but ignores the case of both arguments.
>  .SH RETURN VALUE
>  These functions return a pointer to the beginning of the
>  located substring, or NULL if the substring is not found.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR strstr ()
> +function is thread-safe.
> +.LP
> +The
> +.BR strcasestr ()
> +function is thread-safe with exceptions.
> +It can be safely used in multithreaded applications, as long as
> +.BR setlocale (3)
> +is not called to change the locale.
>  .SH CONFORMING TO
>  The
>  .BR strstr ()
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
