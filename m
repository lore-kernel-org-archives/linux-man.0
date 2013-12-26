From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sigqueue.3: ATTRIBUTES: Note function that is thread-safe
Date: Fri, 27 Dec 2013 07:45:37 +1300
Message-ID: <52BC7951.20106@gmail.com>
References: <1387171439-22283-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387171439-22283-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/16/13 18:23, Peng Haitao wrote:
> The function sigqueue() is thread safe.


Thanks, Peng Haitao! Applied.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/sigqueue.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/sigqueue.3 b/man3/sigqueue.3
> index b428501..7e9e2b4 100644
> --- a/man3/sigqueue.3
> +++ b/man3/sigqueue.3
> @@ -25,7 +25,7 @@
>  .\" added note on self-signaling, aeb, 2002-06-07
>  .\" added note on CAP_KILL, mtk, 2004-06-16
>  .\"
> -.TH SIGQUEUE 3 2012-03-25 "Linux" "Linux Programmer's Manual"
> +.TH SIGQUEUE 3 2013-12-16 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  sigqueue \- queue a signal and data to a process
>  .SH SYNOPSIS
> @@ -111,6 +111,11 @@ No process has a PID matching
>  .IR pid .
>  .SH VERSIONS
>  This system call first appeared in Linux 2.2.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR sigqueue ()
> +function is thread-safe.
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
