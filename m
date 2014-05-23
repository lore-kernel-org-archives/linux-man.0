From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pthread_setaffinity_np.3: ATTRIBUTES: Note functions
 that are thread-safe
Date: Fri, 23 May 2014 10:32:33 +0200
Message-ID: <537F07A1.3050205@gmail.com>
References: <1400830546-8448-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400830546-8448-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks. Applied!

Cheers,

Michael


On 05/23/2014 09:35 AM, Peng Haitao wrote:
> The functions pthread_setaffinity_np() and
> pthread_getaffinity_np() are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/pthread_setaffinity_np.3 | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/pthread_setaffinity_np.3 b/man3/pthread_setaffinity_np.3
> index 6ff5108..6878dfd 100644
> --- a/man3/pthread_setaffinity_np.3
> +++ b/man3/pthread_setaffinity_np.3
> @@ -23,7 +23,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH PTHREAD_SETAFFINITY_NP 3 2014-05-21 "Linux" "Linux Programmer's Manual"
> +.TH PTHREAD_SETAFFINITY_NP 3 2014-05-23 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  pthread_setaffinity_np, pthread_getaffinity_np \- set/get
>  CPU affinity of a thread
> @@ -118,6 +118,13 @@ No thread with the ID
>  could be found.
>  .SH VERSIONS
>  These functions are provided by glibc since version 2.3.4.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR pthread_setaffinity_np ()
> +and
> +.BR pthread_getaffinity_np ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  These functions are nonstandard GNU extensions;
>  hence the suffix "_np" (nonportable) in the names.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
