From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sockatmark.3: ATTRIBUTES: Note function that is thread-safe
Date: Sun, 02 Mar 2014 07:21:07 +0100
Message-ID: <5312CDD3.90003@gmail.com>
References: <1393557223-22476-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393557223-22476-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied. Thanks, Haitao.

Cheers,

Michael

On 02/28/2014 04:13 AM, Peng Haitao wrote:
> The function sockatmark() is thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/sockatmark.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/sockatmark.3 b/man3/sockatmark.3
> index b7e38ca..6a90f89 100644
> --- a/man3/sockatmark.3
> +++ b/man3/sockatmark.3
> @@ -22,7 +22,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH SOCKATMARK 3 2008-12-03 "Linux" "Linux Programmer's Manual"
> +.TH SOCKATMARK 3 2014-02-28 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  sockatmark \- determine whether socket is at out-of-band mark
>  .SH SYNOPSIS
> @@ -70,6 +70,11 @@ can be applied.
>  .SH VERSIONS
>  .BR sockatmark ()
>  was added to glibc in version 2.2.4.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR sockatmark ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  POSIX.1-2001.
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
