From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ftok.3: ATTRIBUTES: Note function that is thread-safe
Date: Sat, 26 Oct 2013 11:18:57 +1300
Message-ID: <526AEE51.6080802@gmail.com>
References: <1381126860-14943-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381126860-14943-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07.10.2013 19:21, Peng Haitao wrote:
> The function ftok() is thread safe.

Thanks, Peng Haitao.

Applied.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/ftok.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/ftok.3 b/man3/ftok.3
> index 925c301..6a48109 100644
> --- a/man3/ftok.3
> +++ b/man3/ftok.3
> @@ -26,7 +26,7 @@
>  .\"	Changed data type of proj_id; minor fixes
>  .\"	aeb: further fixes; added notes.
>  .\"
> -.TH FTOK 3 2001-11-28 "GNU" "Linux Programmer's Manual"
> +.TH FTOK 3 2013-10-07 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  ftok \- convert a pathname and a project identifier to a System V IPC key
>  .SH SYNOPSIS
> @@ -67,6 +67,11 @@ On failure \-1 is returned, with
>  indicating the error as for the
>  .BR stat (2)
>  system call.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR ftok ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  POSIX.1-2001.
>  .SH NOTES
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
My next Linux/UNIX system programming course:
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
