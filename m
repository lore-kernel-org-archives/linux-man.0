From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getcontext.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 10 Apr 2014 21:19:17 +0200
Message-ID: <5346EEB5.6070909@gmail.com>
References: <1396948545-14244-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396948545-14244-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao.

Applied.

Cheers,

Michael

On 04/08/2014 11:15 AM, Peng Haitao wrote:
> The functions getcontext() and setcontext() are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getcontext.3 | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/getcontext.3 b/man3/getcontext.3
> index 78e0aab..142f768 100644
> --- a/man3/getcontext.3
> +++ b/man3/getcontext.3
> @@ -22,7 +22,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH GETCONTEXT 3 2009-03-15 "Linux" "Linux Programmer's Manual"
> +.TH GETCONTEXT 3 2014-04-08 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  getcontext, setcontext \- get or set the user context
>  .SH SYNOPSIS
> @@ -150,6 +150,13 @@ On error, both return \-1 and set
>  appropriately.
>  .SH ERRORS
>  None defined.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR getcontext ()
> +and
> +.BR setcontext ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  SUSv2, POSIX.1-2001.
>  POSIX.1-2008 removes the specification of
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
