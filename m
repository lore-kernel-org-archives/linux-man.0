From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] makecontext.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 14 Apr 2014 12:26:57 +0200
Message-ID: <534BB7F1.700@gmail.com>
References: <1397436640-14157-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397436640-14157-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied.

Cheers,

Michael


On 04/14/2014 02:50 AM, Peng Haitao wrote:
> The functions makecontext() and swapcontext() are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/makecontext.3 | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/makecontext.3 b/man3/makecontext.3
> index dfb1ee6..1e0e991 100644
> --- a/man3/makecontext.3
> +++ b/man3/makecontext.3
> @@ -25,7 +25,7 @@
>  .\"
>  .\" 2006-08-02, mtk, Added example program
>  .\"
> -.TH MAKECONTEXT 3 2013-02-12 "GNU" "Linux Programmer's Manual"
> +.TH MAKECONTEXT 3 2014-04-14 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  makecontext, swapcontext \- manipulate user context
>  .SH SYNOPSIS
> @@ -102,6 +102,13 @@ Insufficient stack space left.
>  and
>  .BR swapcontext ()
>  are provided in glibc since version 2.1.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR makecontext ()
> +and
> +.BR swapcontext ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  SUSv2, POSIX.1-2001.
>  POSIX.1-2008 removes the specifications of
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
