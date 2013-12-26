From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sigpause.3: ATTRIBUTES: Note function that is thread-safe
Date: Fri, 27 Dec 2013 07:45:14 +1300
Message-ID: <52BC793A.7030605@gmail.com>
References: <1387162289-16590-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387162289-16590-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/16/13 15:51, Peng Haitao wrote:
> The function sigpause() is thread safe.


Thanks, Peng Haitao! Applied.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/sigpause.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/sigpause.3 b/man3/sigpause.3
> index b21ff69..cfa702b 100644
> --- a/man3/sigpause.3
> +++ b/man3/sigpause.3
> @@ -22,7 +22,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH SIGPAUSE 3 2010-09-12 "Linux" "Linux Programmer's Manual"
> +.TH SIGPAUSE 3 2013-12-16 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  sigpause \- atomically release blocked signals and wait for interrupt
>  .SH SYNOPSIS
> @@ -53,6 +53,11 @@ with
>  .I errno
>  set to
>  .BR EINTR .
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR sigpause ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  The System V version of
>  .BR sigpause ()
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
