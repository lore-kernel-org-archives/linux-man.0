From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] atoi.3: ATTRIBUTES: Note functions that are thread safe
 with exceptions
Date: Sat, 26 Oct 2013 11:22:58 +1300
Message-ID: <526AEF42.700@gmail.com>
References: <1381717154-15132-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381717154-15132-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 14.10.2013 15:19, Peng Haitao wrote:
> The functions atoi(), atol() and atoll() are thread safe with
> exceptions.


Applied.

Thanks,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/atoi.3 | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/atoi.3 b/man3/atoi.3
> index ad830fd..598650a 100644
> --- a/man3/atoi.3
> +++ b/man3/atoi.3
> @@ -30,7 +30,7 @@
>  .\" Modified Sat Jul 24 21:38:42 1993, Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
>  .\" Modified Sun Dec 17 18:35:06 2000, Joseph S. Myers
>  .\"
> -.TH ATOI 3  2012-08-03 "GNU" "Linux Programmer's Manual"
> +.TH ATOI 3  2013-10-14 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  atoi, atol, atoll, atoq \- convert a string to an integer
>  .SH SYNOPSIS
> @@ -90,6 +90,18 @@ is an obsolete name for
>  .BR atoll ().
>  .SH RETURN VALUE
>  The converted value.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR atoi (),
> +.BR atol (),
> +and
> +.BR atoll ()
> +functions are thread-safe with exceptions.
> +These functions can be safely used in multithreaded applications,
> +as long as
> +.BR setlocale (3)
> +is not called to change the locale.
>  .SH CONFORMING TO
>  SVr4, POSIX.1-2001, 4.3BSD, C99.
>  C89 and
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
My next Linux/UNIX system programming course:
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
