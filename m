From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] stdarg.3: ATTRIBUTES: Note macros that are thread-safe
Date: Thu, 12 Dec 2013 16:13:34 +1300
Message-ID: <52A929DE.5010602@gmail.com>
References: <1386668840-2571-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386668840-2571-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/10/13 22:47, Peng Haitao wrote:
> The macros va_start(), va_arg(), va_end() and va_copy() are
> thread safe.


Thanks! Applied.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/stdarg.3 | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/stdarg.3 b/man3/stdarg.3
> index fb81772..cc170b5 100644
> --- a/man3/stdarg.3
> +++ b/man3/stdarg.3
> @@ -40,7 +40,7 @@
>  .\" Converted for Linux, Mon Nov 29 15:11:11 1993, faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org
>  .\" Additions, 2001-10-14, aeb
>  .\"
> -.TH STDARG 3  2013-03-15 "" "Linux Programmer's Manual"
> +.TH STDARG 3  2013-12-10 "" "Linux Programmer's Manual"
>  .SH NAME
>  stdarg, va_start, va_arg, va_end, va_copy \- variable argument lists
>  .SH SYNOPSIS
> @@ -226,6 +226,15 @@ Some systems that do not supply
>  have
>  .B __va_copy
>  instead, since that was the name used in the draft proposal.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR va_start (),
> +.BR va_arg (),
> +.BR va_end (),
> +and
> +.BR va_copy ()
> +macros are thread-safe.
>  .SH CONFORMING TO
>  The
>  .BR va_start (),
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
