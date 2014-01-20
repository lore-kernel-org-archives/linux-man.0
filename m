From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] strcat.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 20 Jan 2014 13:47:18 +0100
Message-ID: <52DD1AD6.6050300@gmail.com>
References: <1390188168-27926-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390188168-27926-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied. Thanks.

On 01/20/2014 04:22 AM, Peng Haitao wrote:
> The functions strcat() and strncat() are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/strcat.3 | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/strcat.3 b/man3/strcat.3
> index 87ee4a4..813ce03 100644
> --- a/man3/strcat.3
> +++ b/man3/strcat.3
> @@ -29,7 +29,7 @@
>  .\" Modified Sat Jul 24 18:11:47 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
>  .\" 2007-06-15, Marc Boyer <marc.boyer-oUYRw6/Rnm9Wj0EZb7rXcA@public.gmane.org> + mtk
>  .\"     Improve discussion of strncat().
> -.TH STRCAT 3  2012-07-19 "GNU" "Linux Programmer's Manual"
> +.TH STRCAT 3  2014-01-20 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  strcat, strncat \- concatenate two strings
>  .SH SYNOPSIS
> @@ -127,6 +127,13 @@ and
>  .BR strncat ()
>  functions return a pointer to the resulting string
>  .IR dest .
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR strcat ()
> +and
> +.BR strncat ()
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
