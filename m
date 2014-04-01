From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getloadavg.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 01 Apr 2014 21:49:37 +0200
Message-ID: <533B1851.4020402@gmail.com>
References: <1396331684-27349-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396331684-27349-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks. Applied!

Cheers,

Michael

On 04/01/2014 07:54 AM, Peng Haitao wrote:
> The function getloadavg() is thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getloadavg.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/getloadavg.3 b/man3/getloadavg.3
> index 2510439..cad44f1 100644
> --- a/man3/getloadavg.3
> +++ b/man3/getloadavg.3
> @@ -31,7 +31,7 @@
>  .\"
>  .\" 2007-12-08, mtk, Converted from mdoc to man macros
>  .\"
> -.TH GETLOADAVG 3 2007-12-08 "Linux" "Linux Programmer's Manual"
> +.TH GETLOADAVG 3 2014-04-01 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  getloadavg \- get system load averages
>  .SH SYNOPSIS
> @@ -62,6 +62,11 @@ the number of samples actually retrieved is returned.
>  .\" 4.3BSD Reno .
>  .SH VERSIONS
>  This function is available in glibc since version 2.2.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR getloadavg ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  Not in POSIX.1-2001.
>  Present on the BSDs and Solaris.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
