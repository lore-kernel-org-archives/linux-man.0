From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pthread_attr_setstacksize.3: ATTRIBUTES: Note functions
 that are thread-safe
Date: Thu, 08 May 2014 11:42:07 +0200
Message-ID: <536B516F.5070404@gmail.com>
References: <1399343589-10740-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399343589-10740-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thank you, Haitao. Applied.

Cheers,

Michael


On 05/06/2014 04:33 AM, Peng Haitao wrote:
> The functions pthread_attr_setstacksize() and
> pthread_attr_getstacksize() are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/pthread_attr_setstacksize.3 | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/pthread_attr_setstacksize.3 b/man3/pthread_attr_setstacksize.3
> index eb6b44e..2412988 100644
> --- a/man3/pthread_attr_setstacksize.3
> +++ b/man3/pthread_attr_setstacksize.3
> @@ -23,7 +23,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH PTHREAD_ATTR_SETSTACKSIZE 3 2012-03-15 "Linux" "Linux Programmer's Manual"
> +.TH PTHREAD_ATTR_SETSTACKSIZE 3 2014-05-06 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  pthread_attr_setstacksize, pthread_attr_getstacksize \- set/get stack size
>  attribute in thread attributes object
> @@ -80,6 +80,13 @@ if
>  is not a multiple of the system page size.
>  .SH VERSIONS
>  These functions are provided by glibc since version 2.1.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR pthread_attr_setstacksize ()
> +and
> +.BR pthread_attr_getstacksize ()
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
