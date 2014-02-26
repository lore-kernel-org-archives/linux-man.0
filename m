From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] strpbrk.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 26 Feb 2014 10:31:18 +0100
Message-ID: <530DB466.30501@gmail.com>
References: <1393320530-16052-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393320530-16052-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied.

On 02/25/2014 10:28 AM, Peng Haitao wrote:
> The function strpbrk() is thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/strpbrk.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/strpbrk.3 b/man3/strpbrk.3
> index 7e3519d..0ae1c3a 100644
> --- a/man3/strpbrk.3
> +++ b/man3/strpbrk.3
> @@ -27,7 +27,7 @@
>  .\"     Lewine's _POSIX Programmer's Guide_ (O'Reilly & Associates, 1991)
>  .\"     386BSD man pages
>  .\" Modified Sat Jul 24 18:01:24 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
> -.TH STRPBRK 3  2012-05-10 "" "Linux Programmer's Manual"
> +.TH STRPBRK 3  2014-02-25 "" "Linux Programmer's Manual"
>  .SH NAME
>  strpbrk \- search a string for any of a set of bytes
>  .SH SYNOPSIS
> @@ -53,6 +53,11 @@ that matches one of the bytes in
>  .IR accept ,
>  or NULL
>  if no such byte is found.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR strpbrk ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  SVr4, 4.3BSD, C89, C99.
>  .SH SEE ALSO
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
