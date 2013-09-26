From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] cproj.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 26 Sep 2013 15:15:47 +0200
Message-ID: <52443383.4080006@gmail.com>
References: <1379473790-6594-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379473790-6594-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 18.09.2013 05:09, Peng Haitao wrote:
> The functions cproj(), cprojf() and cprojl() are thread safe.

Applied. 

Thanks,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/cproj.3 | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/cproj.3 b/man3/cproj.3
> index f80b404..8f70462 100644
> --- a/man3/cproj.3
> +++ b/man3/cproj.3
> @@ -4,7 +4,7 @@
>  .\" Distributed under GPL
>  .\" %%%LICENSE_END
>  .\"
> -.TH CPROJ 3 2010-06-10 "" "Linux Programmer's Manual"
> +.TH CPROJ 3 2013-09-18 "" "Linux Programmer's Manual"
>  .SH NAME
>  cproj, cprojf, cprojl \- project into Riemann Sphere
>  .SH SYNOPSIS
> @@ -29,6 +29,14 @@ Every complex infinite value is projected to a single infinite value,
>  namely to positive infinity on the real axis.
>  .SH VERSIONS
>  These functions first appeared in glibc in version 2.1.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR cproj (),
> +.BR cprojf (),
> +and
> +.BR cprojl ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  C99.
>  .SH NOTES
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
My next Linux/UNIX system programming course:
http://blog.man7.org/2013/09/linuxunix-system-programming-course.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
