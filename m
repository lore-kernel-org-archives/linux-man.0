From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] flockfile.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 23 Jul 2013 13:27:17 +0200
Message-ID: <51EE6895.6050902@gmail.com>
References: <1374546324-17481-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374546324-17481-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/23/13 04:25, Peng Haitao wrote:
> The functions flockfile(), ftrylockfile() and funlockfile() are
> thread safe.


Thanks. Applied.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/flockfile.3 | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/flockfile.3 b/man3/flockfile.3
> index 5f1a1f6..0989038 100644
> --- a/man3/flockfile.3
> +++ b/man3/flockfile.3
> @@ -22,7 +22,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH FLOCKFILE 3  2008-08-29 "" "Linux Programmer's Manual"
> +.TH FLOCKFILE 3  2013-07-23 "" "Linux Programmer's Manual"
>  .SH NAME
>  flockfile, ftrylockfile, funlockfile \- lock FILE for stdio
>  .SH SYNOPSIS
> @@ -124,6 +124,14 @@ function returns zero for success
>  (the lock was obtained), and nonzero for failure.
>  .SH ERRORS
>  None.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR flockfile (),
> +.BR ftrylockfile (),
> +and
> +.BR funlockfile ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  POSIX.1-2001.
>  .SH AVAILABILITY
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
