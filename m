From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] isgreater.3: ATTRIBUTES: Note macros that are thread-safe
Date: Wed, 29 Jan 2014 10:41:12 +0100
Message-ID: <52E8CCB8.5080709@gmail.com>
References: <1390805763-28013-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390805763-28013-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied. Thanks, Haitao.

Cheers,

Michael



On 01/27/2014 07:56 AM, Peng Haitao wrote:
> The macros isgreater(), isgreaterequal(), isless(),
> islessequal(), islessgreater() and isunordered() are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/isgreater.3 | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/isgreater.3 b/man3/isgreater.3
> index d241fde..fc761c1 100644
> --- a/man3/isgreater.3
> +++ b/man3/isgreater.3
> @@ -7,7 +7,7 @@
>  .\" 2002-07-27 Walter Harms
>  .\" this was done with the help of the glibc manual
>  .\"
> -.TH ISGREATER 3  2012-05-06 "" "Linux Programmer's Manual"
> +.TH ISGREATER 3  2014-01-27 "" "Linux Programmer's Manual"
>  .SH NAME
>  isgreater, isgreaterequal, isless, islessequal, islessgreater,
>  isunordered \- floating-point relational tests without exception for NaN
> @@ -122,6 +122,17 @@ or
>  is NaN and 0 otherwise.
>  .SH ERRORS
>  No errors occur.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR isgreater (),
> +.BR isgreaterequal (),
> +.BR isless (),
> +.BR islessequal (),
> +.BR islessgreater (),
> +and
> +.BR isunordered ()
> +macros are thread-safe.
>  .SH CONFORMING TO
>  C99, POSIX.1-2001.
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
