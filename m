From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] memmove.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 17 Mar 2014 15:01:04 +0100
Message-ID: <53270020.1060004@gmail.com>
References: <1395045166-15973-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395045166-15973-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org" <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org" <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Thanks, Haitao.

Applied.

Cheers,

Michael

On 03/17/2014 09:35 AM, penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org wrote:
> The function memmove() is thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/memmove.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/memmove.3 b/man3/memmove.3
> index 3cea74d..c649e4e 100644
> --- a/man3/memmove.3
> +++ b/man3/memmove.3
> @@ -27,7 +27,7 @@
>  .\"     Lewine's _POSIX Programmer's Guide_ (O'Reilly & Associates, 1991)
>  .\"     386BSD man pages
>  .\" Modified Sat Jul 24 18:49:59 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
> -.TH MEMMOVE 3  1993-04-10 "GNU" "Linux Programmer's Manual"
> +.TH MEMMOVE 3  2014-03-17 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  memmove \- copy memory area
>  .SH SYNOPSIS
> @@ -59,6 +59,11 @@ The
>  .BR memmove ()
>  function returns a pointer to
>  .IR dest .
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR memmove ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  SVr4, 4.3BSD, C89, C99, POSIX.1-2001.
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
