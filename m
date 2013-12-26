From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] toascii.3: ATTRIBUTES: Note function that is thread-safe
Date: Fri, 27 Dec 2013 07:24:14 +1300
Message-ID: <52BC744E.3000009@gmail.com>
References: <1387792209-26200-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387792209-26200-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/23/13 22:50, Peng Haitao wrote:
> The function toascii() is thread safe.

Thanks. Applied!

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/toascii.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/toascii.3 b/man3/toascii.3
> index 3a2c7d3..e632cf5 100644
> --- a/man3/toascii.3
> +++ b/man3/toascii.3
> @@ -24,7 +24,7 @@
>  .\"
>  .\" Added BUGS section, aeb, 950919
>  .\"
> -.TH TOASCII 3 2009-03-15 "GNU" "Linux Programmer's Manual"
> +.TH TOASCII 3 2013-12-23 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  toascii \- convert character to ASCII
>  .SH SYNOPSIS
> @@ -51,6 +51,11 @@ value that fits into the ASCII character set, by clearing the
>  high-order bits.
>  .SH RETURN VALUE
>  The value returned is that of the converted character.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR toascii ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  SVr4, BSD, POSIX.1-2001.
>  POSIX.1-2008 marks
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
