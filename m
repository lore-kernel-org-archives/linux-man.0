From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pthread_attr_setscope.3: ATTRIBUTES: Note functions that
 are thread-safe
Date: Tue, 22 Apr 2014 16:44:06 +0200
Message-ID: <53568036.3010800@gmail.com>
References: <1398068042-1995-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398068042-1995-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao.

Applied.

Cheers,

Michael


On 04/21/2014 10:14 AM, Peng Haitao wrote:
> The functions pthread_attr_setscope() and pthread_attr_getscope()
> are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/pthread_attr_setscope.3 | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/pthread_attr_setscope.3 b/man3/pthread_attr_setscope.3
> index e52fe5d..2effe6b 100644
> --- a/man3/pthread_attr_setscope.3
> +++ b/man3/pthread_attr_setscope.3
> @@ -23,7 +23,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH PTHREAD_ATTR_SETSCOPE 3 2013-04-19 "Linux" "Linux Programmer's Manual"
> +.TH PTHREAD_ATTR_SETSCOPE 3 2014-04-21 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  pthread_attr_setscope, pthread_attr_getscope \- set/get contention scope
>  attribute in thread attributes object
> @@ -116,6 +116,13 @@ An invalid value was specified in
>  specified the value
>  .BR PTHREAD_SCOPE_PROCESS ,
>  which is not supported on Linux.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR pthread_attr_setscope ()
> +and
> +.BR pthread_attr_getscope ()
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
