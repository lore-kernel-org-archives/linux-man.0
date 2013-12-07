From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] wmemcpy.3: ATTRIBUTES: Note function that is thread-safe
Date: Sat, 07 Dec 2013 14:37:59 -0800
Message-ID: <52A3A347.10507@gmail.com>
References: <1384136316-18422-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384136316-18422-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/10/13 18:18, Peng Haitao wrote:
> The function wmemcpy() is thread safe.

Applied. Thanks, Peng Haitao.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/wmemcpy.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/wmemcpy.3 b/man3/wmemcpy.3
> index 6c4756d..49f3ce4 100644
> --- a/man3/wmemcpy.3
> +++ b/man3/wmemcpy.3
> @@ -13,7 +13,7 @@
>  .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.org/online.html
>  .\"   ISO/IEC 9899:1999
>  .\"
> -.TH WMEMCPY 3  1999-07-25 "GNU" "Linux Programmer's Manual"
> +.TH WMEMCPY 3  2013-11-11 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  wmemcpy \- copy an array of wide-characters
>  .SH SYNOPSIS
> @@ -49,6 +49,11 @@ characters at
>  .BR wmemcpy ()
>  returns
>  .IR dest .
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR wmemcpy ()
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
