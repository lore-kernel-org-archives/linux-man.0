From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] wcsstr.3: ATTRIBUTES: Note function that is thread-safe
Date: Sat, 07 Dec 2013 14:42:17 -0800
Message-ID: <52A3A449.8010700@gmail.com>
References: <1384220562-17970-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384220562-17970-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/11/13 17:42, Peng Haitao wrote:
> The function wcsstr() is thread safe.

Applied. Thanks, Peng Haitao.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/wcsstr.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/wcsstr.3 b/man3/wcsstr.3
> index 19abfd9..c77c8bd 100644
> --- a/man3/wcsstr.3
> +++ b/man3/wcsstr.3
> @@ -13,7 +13,7 @@
>  .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.org/online.html
>  .\"   ISO/IEC 9899:1999
>  .\"
> -.TH WCSSTR 3  2011-09-28 "GNU" "Linux Programmer's Manual"
> +.TH WCSSTR 3  2013-11-12 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  wcsstr \- locate a substring in a wide-character string
>  .SH SYNOPSIS
> @@ -53,6 +53,11 @@ is the empty wide-character string,
>  the return value is always
>  .I haystack
>  itself.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR wcsstr ()
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
