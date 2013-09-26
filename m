From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] euidaccess.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 26 Sep 2013 15:14:14 +0200
Message-ID: <52443326.3040308@gmail.com>
References: <1380080205-31571-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380080205-31571-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 25.09.2013 05:36, Peng Haitao wrote:
> The functions euidaccess() and eaccess() are thread safe.

Applied. Thanks,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/euidaccess.3 | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/euidaccess.3 b/man3/euidaccess.3
> index e86d798..ca25ed1 100644
> --- a/man3/euidaccess.3
> +++ b/man3/euidaccess.3
> @@ -22,7 +22,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH EUIDACCESS 3 2010-11-01 "" "Linux Programmer's Manual"
> +.TH EUIDACCESS 3 2013-09-25 "" "Linux Programmer's Manual"
>  .SH NAME
>  euidaccess, eaccess \- check effective user's permissions for a file
>  .SH SYNOPSIS
> @@ -70,6 +70,13 @@ As for
>  The
>  .BR eaccess ()
>  function was added to glibc in version 2.4.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR euidaccess ()
> +and
> +.BR eaccess ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  These functions are nonstandard.
>  Some other systems have an
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
