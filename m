From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] posix_openpt.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 04 Jun 2014 21:16:15 +0200
Message-ID: <538F707F.9030900@gmail.com>
References: <1401765741-18350-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401765741-18350-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Haitao,

Patch applied. Thank you!

Cheers,

Michael


On 06/03/2014 05:22 AM, Peng Haitao wrote:
> The function posix_openpt() is thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/posix_openpt.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/posix_openpt.3 b/man3/posix_openpt.3
> index c470e9a..a1e7c4b 100644
> --- a/man3/posix_openpt.3
> +++ b/man3/posix_openpt.3
> @@ -22,7 +22,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH POSIX_OPENPT 3 2012-04-20 "" "Linux Programmer's Manual"
> +.TH POSIX_OPENPT 3 2014-06-03 "" "Linux Programmer's Manual"
>  .SH NAME
>  posix_openpt \- open a pseudoterminal device
>  .SH SYNOPSIS
> @@ -74,6 +74,11 @@ See
>  Glibc support for
>  .BR posix_openpt ()
>  has been provided since version 2.2.1.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR posix_openpt ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  .BR posix_openpt ()
>  is part of the UNIX 98 pseudoterminal support (see
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
