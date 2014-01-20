From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] strcmp.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 20 Jan 2014 13:22:42 +0100
Message-ID: <52DD1512.2000504@gmail.com>
References: <1390199755-5620-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390199755-5620-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied.  Thanks, Haitao.

Cheers,

Michael


On 01/20/2014 07:35 AM, Peng Haitao wrote:
> The functions strcmp() and strncmp() are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/strcmp.3 | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/strcmp.3 b/man3/strcmp.3
> index 684feae..04c3986 100644
> --- a/man3/strcmp.3
> +++ b/man3/strcmp.3
> @@ -29,7 +29,7 @@
>  .\" Modified Sat Jul 24 18:08:52 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
>  .\" Modified 2001-08-31, aeb
>  .\"
> -.TH STRCMP 3  2012-11-25 "" "Linux Programmer's Manual"
> +.TH STRCMP 3  2014-01-20 "" "Linux Programmer's Manual"
>  .SH NAME
>  strcmp, strncmp \- compare two strings
>  .SH SYNOPSIS
> @@ -76,6 +76,13 @@ less than, equal to, or greater than zero if
>  bytes thereof) is found, respectively, to be less than, to
>  match, or be greater than
>  .IR s2 .
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR strcmp ()
> +and
> +.BR strncmp ()
> +functions are thread-safe.
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
