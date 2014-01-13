From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] stpcpy.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 13 Jan 2014 21:42:33 +1300
Message-ID: <52D3A6F9.5080404@gmail.com>
References: <1389592868-11320-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389592868-11320-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/13/2014 07:01 PM, Peng Haitao wrote:
> The function stpcpy() is thread safe.

Applied. Thanks, Haitao.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/stpcpy.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/stpcpy.3 b/man3/stpcpy.3
> index 09d74b7..4718a96 100644
> --- a/man3/stpcpy.3
> +++ b/man3/stpcpy.3
> @@ -22,7 +22,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH STPCPY 3  2012-03-15 "GNU" "Linux Programmer's Manual"
> +.TH STPCPY 3  2014-01-13 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  stpcpy \- copy a string returning a pointer to its end
>  .SH SYNOPSIS
> @@ -68,6 +68,11 @@ of the string
>  .I dest
>  (that is, the address of the terminating null byte)
>  rather than the beginning.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR stpcpy ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  This function was added to POSIX.1-2008.
>  Before that, it was not part of
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
