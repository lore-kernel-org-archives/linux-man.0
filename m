From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] bsd_signal.3: ATTRIBUTES: Note function that is thread-safe
Date: Sat, 26 Oct 2013 11:26:29 +1300
Message-ID: <526AF015.4060509@gmail.com>
References: <1382409862-7364-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382409862-7364-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 22.10.2013 15:44, Peng Haitao wrote:
> The function bsd_signal() is thread safe.

Applied.

Thanks,

Michael



> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/bsd_signal.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/bsd_signal.3 b/man3/bsd_signal.3
> index c7738b3..d0f4108 100644
> --- a/man3/bsd_signal.3
> +++ b/man3/bsd_signal.3
> @@ -22,7 +22,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH BSD_SIGNAL 3 2009-03-15 "" "Linux Programmer's Manual"
> +.TH BSD_SIGNAL 3 2013-10-22 "" "Linux Programmer's Manual"
>  .SH NAME
>  bsd_signal \- signal handling with BSD semantics
>  .SH SYNOPSIS
> @@ -60,6 +60,11 @@ on error.
>  .SH ERRORS
>  As for
>  .BR signal (2).
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR bsd_signal ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  4.2BSD, POSIX.1-2001.
>  POSIX.1-2008 removes the specification of
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
My next Linux/UNIX system programming course:
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
