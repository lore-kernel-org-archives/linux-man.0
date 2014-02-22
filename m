From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sem_wait.3: ATTRIBUTES: Note functions that are thread-safe
Date: Sat, 22 Feb 2014 10:22:24 +0100
Message-ID: <53086C50.7050209@gmail.com>
References: <1392607800-18264-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392607800-18264-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied. Thanks,

On 02/17/2014 04:30 AM, Peng Haitao wrote:
> The functions sem_wait(), sem_trywait() and sem_timedwait() are
> thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/sem_wait.3 | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/sem_wait.3 b/man3/sem_wait.3
> index f157f62..113f250 100644
> --- a/man3/sem_wait.3
> +++ b/man3/sem_wait.3
> @@ -23,7 +23,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH SEM_WAIT 3 2012-05-13 "Linux" "Linux Programmer's Manual"
> +.TH SEM_WAIT 3 2014-02-17 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  sem_wait, sem_timedwait, sem_trywait \- lock a semaphore
>  .SH SYNOPSIS
> @@ -140,6 +140,14 @@ is less than 0, or greater than or equal to 1000 million.
>  The call timed out before the semaphore could be locked.
>  .\" POSIX.1-2001 also allows EDEADLK -- "A deadlock condition
>  .\" was detected", but this does not occur on Linux(?).
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR sem_wait (),
> +.BR sem_trywait (),
> +and
> +.BR sem_timedwait ()
> +functions are thread-safe.
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
