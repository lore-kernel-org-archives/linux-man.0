From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pthread_attr_setguardsize.3: ATTRIBUTES: Note functions
 that are thread-safe
Date: Mon, 14 Apr 2014 12:27:23 +0200
Message-ID: <534BB80B.2070507@gmail.com>
References: <1397452792-28469-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397452792-28469-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied.

Cheers,

Michael


On 04/14/2014 07:19 AM, Peng Haitao wrote:
> The functions pthread_attr_setguardsize() and
> pthread_attr_getguardsize() are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/pthread_attr_setguardsize.3 | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/pthread_attr_setguardsize.3 b/man3/pthread_attr_setguardsize.3
> index 7c31e50..801aae9 100644
> --- a/man3/pthread_attr_setguardsize.3
> +++ b/man3/pthread_attr_setguardsize.3
> @@ -23,7 +23,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH PTHREAD_ATTR_SETGUARDSIZE 3 2008-10-24 "Linux" "Linux Programmer's Manual"
> +.TH PTHREAD_ATTR_SETGUARDSIZE 3 2014-04-14 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  pthread_attr_setguardsize, pthread_attr_getguardsize \- set/get guard size
>  attribute in thread attributes object
> @@ -103,6 +103,13 @@ On Linux these functions always succeed
>  handle a possible error return).
>  .SH VERSIONS
>  These functions are provided by glibc since version 2.1.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR pthread_attr_setguardsize ()
> +and
> +.BR pthread_attr_getguardsize ()
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
