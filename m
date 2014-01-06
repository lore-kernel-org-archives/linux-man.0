From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sysv_signal.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 07 Jan 2014 00:51:48 +1300
Message-ID: <52CA98D4.3030108@gmail.com>
References: <1388987103-21272-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1388987103-21272-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/06/14 18:45, Peng Haitao wrote:
> The function sysv_signal() is thread safe.


Thanks. Applied.

Cheers,

Michael



> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/sysv_signal.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/sysv_signal.3 b/man3/sysv_signal.3
> index 957b9d5..3dd1e93 100644
> --- a/man3/sysv_signal.3
> +++ b/man3/sysv_signal.3
> @@ -22,7 +22,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH SYSV_SIGNAL 3 2007-05-04 "" "Linux Programmer's Manual"
> +.TH SYSV_SIGNAL 3 2014-01-06 "" "Linux Programmer's Manual"
>  .SH NAME
>  sysv_signal \- signal handling with System V semantics
>  .SH SYNOPSIS
> @@ -57,6 +57,11 @@ on error.
>  .SH ERRORS
>  As for
>  .BR signal (2).
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR sysv_signal ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  This function is nonstandard.
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
