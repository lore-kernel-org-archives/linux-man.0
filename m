From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pthread_kill_other_threads_np.3: ATTRIBUTES: Note function
 that is thread-safe
Date: Tue, 13 May 2014 10:31:33 +0200
Message-ID: <5371D865.9090505@gmail.com>
References: <1399958075-3827-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399958075-3827-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied. Thanks, Haitao.

Cheers,

Michael

On 05/13/2014 07:14 AM, Peng Haitao wrote:
> The function pthread_kill_other_threads_np() is thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/pthread_kill_other_threads_np.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/pthread_kill_other_threads_np.3 b/man3/pthread_kill_other_threads_np.3
> index 0cfde7e..a52594f 100644
> --- a/man3/pthread_kill_other_threads_np.3
> +++ b/man3/pthread_kill_other_threads_np.3
> @@ -23,7 +23,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH PTHREAD_KILL_OTHER_THREADS_NP 3 2010-09-09 "Linux" "Linux Programmer's Manual"
> +.TH PTHREAD_KILL_OTHER_THREADS_NP 3 2014-05-13 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  pthread_kill_other_threads_np \- terminate all other threads in process
>  .SH SYNOPSIS
> @@ -44,6 +44,11 @@ to-be-terminated threads are ignored,
>  and the cleanup handlers are not called in those threads.
>  .\" .SH VERSIONS
>  .\" Available since glibc 2.0
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR pthread_kill_other_threads_np ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  This function is a nonstandard GNU extension;
>  hence the suffix "_np" (nonportable) in the name.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
