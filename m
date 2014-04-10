From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getutmp.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 10 Apr 2014 21:18:46 +0200
Message-ID: <5346EE96.5070207@gmail.com>
References: <1396936679-3146-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396936679-3146-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao.

Applied.

Cheers,

Michael

On 04/08/2014 07:57 AM, Peng Haitao wrote:
> The functions getutmp() and getutmpx() are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getutmp.3 | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/getutmp.3 b/man3/getutmp.3
> index 4c5e366..35f2124 100644
> --- a/man3/getutmp.3
> +++ b/man3/getutmp.3
> @@ -23,7 +23,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH GETUTMP 3 2014-03-09 "Linux" "Linux Programmer's Manual"
> +.TH GETUTMP 3 2014-04-08 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  getutmp, getutmpx \- copy utmp structure to utmpx, and vice versa
>  .SH SYNOPSIS
> @@ -52,6 +52,13 @@ function performs the converse operation.
>  These functions do not return a value.
>  .SH VERSIONS
>  These functions first appeared in glibc in version 2.1.1.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR getutmp ()
> +and
> +.BR getutmpx ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  These functions are nonstandard, but appear on a few other systems,
>  such as Solaris and NetBSD.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
