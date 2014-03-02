From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] strcpy.3: ATTRIBUTES: Note functions that are thread-safe
Date: Sun, 02 Mar 2014 07:20:37 +0100
Message-ID: <5312CDB5.1070500@gmail.com>
References: <1393550095-14200-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393550095-14200-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied. Thanks, Haitao.

Cheers,

Michael

On 02/28/2014 02:14 AM, Peng Haitao wrote:
> The functions strcpy() and strncpy() are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/strcpy.3 | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/strcpy.3 b/man3/strcpy.3
> index 675b72e..da027c3 100644
> --- a/man3/strcpy.3
> +++ b/man3/strcpy.3
> @@ -32,7 +32,7 @@
>  .\" 2007-06-15, Marc Boyer <marc.boyer-oUYRw6/Rnm9Wj0EZb7rXcA@public.gmane.org> + mtk
>  .\"     Improve discussion of strncpy().
>  .\"
> -.TH STRCPY 3  2012-07-19 "GNU" "Linux Programmer's Manual"
> +.TH STRCPY 3  2014-02-28 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  strcpy, strncpy \- copy a string
>  .SH SYNOPSIS
> @@ -113,6 +113,13 @@ and
>  functions return a pointer to
>  the destination string
>  .IR dest .
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR strcpy ()
> +and
> +.BR strncpy ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  SVr4, 4.3BSD, C89, C99.
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
