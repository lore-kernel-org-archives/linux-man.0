From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pthread_getcpuclockid.3: ATTRIBUTES: Note function that
 is thread-safe
Date: Fri, 23 May 2014 05:59:23 +0200
Message-ID: <537EC79B.80603@gmail.com>
References: <1400815736-28090-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400815736-28090-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao! Applied.

Cheers,

Michael


On 05/23/2014 05:28 AM, Peng Haitao wrote:
> The function pthread_getcpuclockid() is thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/pthread_getcpuclockid.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/pthread_getcpuclockid.3 b/man3/pthread_getcpuclockid.3
> index ed52c29..9f31331 100644
> --- a/man3/pthread_getcpuclockid.3
> +++ b/man3/pthread_getcpuclockid.3
> @@ -23,7 +23,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH PTHREAD_GETCPUCLOCKID 3 2009-02-08 "Linux" "Linux Programmer's Manual"
> +.TH PTHREAD_GETCPUCLOCKID 3 2014-05-23 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  pthread_getcpuclockid \- retrieve ID of a thread's CPU time clock
>  .SH SYNOPSIS
> @@ -62,6 +62,11 @@ No thread with the ID
>  could be found.
>  .SH VERSIONS
>  This function is available in glibc since version 2.2.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR pthread_getcpuclockid ()
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
