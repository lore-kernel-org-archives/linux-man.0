From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] swab.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 26 Feb 2014 10:23:37 +0100
Message-ID: <530DB299.1020707@gmail.com>
References: <1393308246-498-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393308246-498-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied.


On 02/25/2014 07:04 AM, Peng Haitao wrote:
> The function swab() is thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/swab.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/swab.3 b/man3/swab.3
> index 9c4ef7a..007f685 100644
> --- a/man3/swab.3
> +++ b/man3/swab.3
> @@ -28,7 +28,7 @@
>  .\"     386BSD man pages
>  .\" Modified Sat Jul 24 17:52:15 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
>  .\" Modified 2001-12-15, aeb
> -.TH SWAB 3  2001-12-15 "" "Linux Programmer's Manual"
> +.TH SWAB 3  2014-02-25 "" "Linux Programmer's Manual"
>  .SH NAME
>  swab \- swap adjacent bytes
>  .SH SYNOPSIS
> @@ -69,6 +69,11 @@ should be even.)
>  The
>  .BR swab ()
>  function returns no value.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR swab ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  SVr4, 4.3BSD, POSIX.1-2001.
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
