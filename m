From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pthread_attr_setschedpolicy.3: ATTRIBUTES: Note functions
 that are thread-safe
Date: Tue, 22 Apr 2014 16:43:59 +0200
Message-ID: <5356802F.8080002@gmail.com>
References: <1398059508-25489-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398059508-25489-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao.

Applied.

Cheers,

Michael
On 04/21/2014 07:51 AM, Peng Haitao wrote:
> The functions pthread_attr_setschedpolicy() and
> pthread_attr_getschedpolicy() are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/pthread_attr_setschedpolicy.3 | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/pthread_attr_setschedpolicy.3 b/man3/pthread_attr_setschedpolicy.3
> index fbd37ca..794aa92 100644
> --- a/man3/pthread_attr_setschedpolicy.3
> +++ b/man3/pthread_attr_setschedpolicy.3
> @@ -23,7 +23,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH PTHREAD_ATTR_SETSCHEDPOLICY 3 2013-06-21 "Linux" "Linux Programmer's Manual"
> +.TH PTHREAD_ATTR_SETSCHEDPOLICY 3 2014-04-21 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  pthread_attr_setschedpolicy, pthread_attr_getschedpolicy \- set/get
>  scheduling policy attribute in thread attributes object
> @@ -97,6 +97,13 @@ error ("attempt was made to set the attribute to an unsupported value") for
>  .BR pthread_attr_setschedpolicy ().
>  .\" .SH VERSIONS
>  .\" Available since glibc 2.0.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR pthread_attr_setschedpolicy ()
> +and
> +.BR pthread_attr_getschedpolicy ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  POSIX.1-2001.
>  .SH EXAMPLE
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
