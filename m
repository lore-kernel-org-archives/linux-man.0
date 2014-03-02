From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] strspn.3: ATTRIBUTES: Note functions that are thread-safe
Date: Sun, 02 Mar 2014 07:20:52 +0100
Message-ID: <5312CDC4.6010006@gmail.com>
References: <1393554070-18450-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393554070-18450-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied. Thanks, Haitao.

Cheers,

Michael

On 02/28/2014 03:21 AM, Peng Haitao wrote:
> The functions strspn() and strcspn() are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/strspn.3 | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/strspn.3 b/man3/strspn.3
> index 80eaf30..f05b8a2 100644
> --- a/man3/strspn.3
> +++ b/man3/strspn.3
> @@ -27,7 +27,7 @@
>  .\"     Lewine's _POSIX Programmer's Guide_ (O'Reilly & Associates, 1991)
>  .\"     386BSD man pages
>  .\" Modified Sat Jul 24 17:57:50 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
> -.TH STRSPN 3  2013-12-30 "" "Linux Programmer's Manual"
> +.TH STRSPN 3  2014-02-28 "" "Linux Programmer's Manual"
>  .SH NAME
>  strspn, strcspn \- get length of a prefix substring
>  .SH SYNOPSIS
> @@ -71,6 +71,13 @@ the initial segment of
>  .I s
>  which are not in the string
>  .IR reject .
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR strspn ()
> +and
> +.BR strcspn ()
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
