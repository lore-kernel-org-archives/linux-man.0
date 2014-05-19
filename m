From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pthread_setschedprio.3: ATTRIBUTES: Note function that
 is thread-safe
Date: Mon, 19 May 2014 06:50:16 +0200
Message-ID: <53798D88.1090809@gmail.com>
References: <1400465420-18027-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400465420-18027-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thank you, Haitao. Applied.

Cheers,

Michael


On 05/19/2014 04:10 AM, Peng Haitao wrote:
> The function pthread_setschedprio() is thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/pthread_setschedprio.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/pthread_setschedprio.3 b/man3/pthread_setschedprio.3
> index 6910f60..334c456 100644
> --- a/man3/pthread_setschedprio.3
> +++ b/man3/pthread_setschedprio.3
> @@ -23,7 +23,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH PTHREAD_SETSCHEDPRIO 3 2008-11-06 "Linux" "Linux Programmer's Manual"
> +.TH PTHREAD_SETSCHEDPRIO 3 2014-05-19 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  pthread_setschedprio \- set scheduling priority of a thread
>  .SH SYNOPSIS
> @@ -80,6 +80,11 @@ to an unsupported value") error for
>  .BR pthread_setschedparam (3).
>  .SH VERSIONS
>  This function is available in glibc since version 2.3.4.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR pthread_setschedprio ()
> +function is thread-safe.
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
