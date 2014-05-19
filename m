From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pthread_sigqueue.3: ATTRIBUTES: Note function that is
 thread-safe
Date: Mon, 19 May 2014 08:16:38 +0200
Message-ID: <5379A1C6.5070804@gmail.com>
References: <1400476862-27216-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400476862-27216-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

pThanks, Haitao. APplied.

Cheers,

Michael


On 05/19/2014 07:21 AM, Peng Haitao wrote:
> The function pthread_sigqueue() is thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/pthread_sigqueue.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/pthread_sigqueue.3 b/man3/pthread_sigqueue.3
> index 9573998..84611ef 100644
> --- a/man3/pthread_sigqueue.3
> +++ b/man3/pthread_sigqueue.3
> @@ -22,7 +22,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH PTHREAD_SIGQUEUE 3 2012-08-19 "Linux" "Linux Programmer's Manual"
> +.TH PTHREAD_SIGQUEUE 3 2014-05-19 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  pthread_sigqueue \- queue a signal and data to a thread
>  .SH SYNOPSIS
> @@ -90,6 +90,11 @@ is not valid.
>  The
>  .BR pthread_sigqueue ()
>  function first appeared in glibc 2.11.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR pthread_sigqueue ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  This function is a GNU extension.
>  .SH SEE ALSO
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
