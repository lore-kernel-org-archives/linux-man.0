From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] statvfs.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 26 Sep 2013 15:12:51 +0200
Message-ID: <524432D3.2000006@gmail.com>
References: <1380173612-13856-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380173612-13856-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 26.09.2013 07:33, Peng Haitao wrote:
> The functions statvfs() and fstatvfs() are thread safe.

Applied. Thanks,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/statvfs.3 | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/statvfs.3 b/man3/statvfs.3
> index 24d10d6..e36630f 100644
> --- a/man3/statvfs.3
> +++ b/man3/statvfs.3
> @@ -27,7 +27,7 @@
>  .\"
>  .\" Modified 2004-06-23 by Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  .\"
> -.TH STATVFS 3 2003-08-22 "Linux" "Linux Programmer's Manual"
> +.TH STATVFS 3 2013-09-26 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  statvfs, fstatvfs \- get filesystem statistics
>  .SH SYNOPSIS
> @@ -154,6 +154,13 @@ is not a directory.
>  .TP
>  .B EOVERFLOW
>  Some values were too large to be represented in the returned struct.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR statvfs ()
> +and
> +.BR fstatvfs ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  POSIX.1-2001.
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
