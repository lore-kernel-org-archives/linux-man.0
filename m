From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] wmemcmp.3: ATTRIBUTES: Note function that is thread-safe
Date: Fri, 08 Nov 2013 06:00:39 +1300
Message-ID: <527BC737.7020905@gmail.com>
References: <1383639360-26508-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383639360-26508-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/05/13 21:16, Peng Haitao wrote:
> The function wmemcmp() is thread safe.

Thanks, Peng Haitao. Applied.

Cheers,

Michael



> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/wmemcmp.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/wmemcmp.3 b/man3/wmemcmp.3
> index 4b67f90..5b523ac 100644
> --- a/man3/wmemcmp.3
> +++ b/man3/wmemcmp.3
> @@ -12,7 +12,7 @@
>  .\"   Dinkumware C library reference http://www.dinkumware.com/
>  .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.org/online.html
>  .\"
> -.TH WMEMCMP 3  1999-07-25 "GNU" "Linux Programmer's Manual"
> +.TH WMEMCMP 3  2013-11-05 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  wmemcmp \- compare two arrays of wide-characters
>  .SH SYNOPSIS
> @@ -67,6 +67,11 @@ wide-character
>  .I s1[i]
>  is less than
>  .IR s2[i] .
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR wmemcmp ()
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
