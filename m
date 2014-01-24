From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] strtol.3: ATTRIBUTES: Note functions that are thread
 safe with exceptions
Date: Fri, 24 Jan 2014 10:30:04 +0100
Message-ID: <52E2329C.1080804@gmail.com>
References: <1390554955-27025-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390554955-27025-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/24/2014 10:15 AM, Peng Haitao wrote:
> The functions strtol(), strtoll() and strtoq() are thread safe
> with exceptions.

Thanks. Applied.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/strtol.3 | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/strtol.3 b/man3/strtol.3
> index d314658..f6f0039 100644
> --- a/man3/strtol.3
> +++ b/man3/strtol.3
> @@ -28,7 +28,7 @@
>  .\"     386BSD man pages
>  .\" Modified Sun Jul 25 10:53:39 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
>  .\" Added correction due to nsd-f+vT++N9z3k@public.gmane.org (Nick Duffek) - aeb, 950610
> -.TH STRTOL 3  2013-02-10 "GNU" "Linux Programmer's Manual"
> +.TH STRTOL 3  2014-01-24 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  strtol, strtoll, strtoq \- convert a string to a long integer
>  .SH SYNOPSIS
> @@ -158,6 +158,18 @@ to
>  .B EINVAL
>  in case
>  no conversion was performed (no digits seen, and 0 returned).
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR strtol (),
> +.BR strtoll (),
> +and
> +.BR strtoq ()
> +functions are thread-safe with exceptions.
> +These functions can be safely used in multithreaded applications,
> +as long as
> +.BR setlocale (3)
> +is not called to change the locale during their execution.
>  .SH CONFORMING TO
>  .BR strtol ()
>  conforms to SVr4, 4.3BSD, C89, C99 and POSIX.1-2001, and
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
