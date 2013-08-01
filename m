From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fmin.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 01 Aug 2013 11:25:28 +0200
Message-ID: <51FA2988.1090102@gmail.com>
References: <1375151726-24538-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375151726-24538-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/30/13 04:35, Peng Haitao wrote:
> The functions fmin(), fminf() and fminl() are thread safe.


Applied. Thanks,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/fmin.3 | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/fmin.3 b/man3/fmin.3
> index 517a2e3..74d78b0 100644
> --- a/man3/fmin.3
> +++ b/man3/fmin.3
> @@ -6,7 +6,7 @@
>  .\" Distributed under GPL
>  .\" %%%LICENSE_END
>  .\"
> -.TH FMIN 3 2010-09-20 "" "Linux Programmer's Manual"
> +.TH FMIN 3 2013-07-30 "" "Linux Programmer's Manual"
>  .SH NAME
>  fmin, fminf, fminl \- determine minimum of two floating-point numbers
>  .SH SYNOPSIS
> @@ -55,6 +55,14 @@ If both arguments are NaN, a NaN is returned.
>  No errors occur.
>  .SH VERSIONS
>  These functions first appeared in glibc in version 2.1.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR fmin (),
> +.BR fminf (),
> +and
> +.BR fminl ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  C99, POSIX.1-2001.
>  .SH SEE ALSO
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
