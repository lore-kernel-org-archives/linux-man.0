From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] raise.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 10 Mar 2014 15:09:47 +0100
Message-ID: <531DC7AB.4090705@gmail.com>
References: <1394428226-22993-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394428226-22993-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied.

Cheers,

Michael


On 03/10/2014 06:10 AM, Peng Haitao wrote:
> The function raise() is thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/raise.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/raise.3 b/man3/raise.3
> index 851fa0e..d2a450c 100644
> --- a/man3/raise.3
> +++ b/man3/raise.3
> @@ -26,7 +26,7 @@
>  .\" Modified Sat Jul 24 18:40:56 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
>  .\" Modified 1995 by Mike Battersby (mib-s/yHM3Pchp9WG/WdbR7gnQ@public.gmane.org)
>  .\"
> -.TH RAISE 3  2012-04-20 "GNU" "Linux Programmer's Manual"
> +.TH RAISE 3  2014-03-10 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  raise \- send a signal to the caller
>  .SH SYNOPSIS
> @@ -61,6 +61,11 @@ will return only after the signal handler has returned.
>  .SH RETURN VALUE
>  .BR raise ()
>  returns 0 on success, and nonzero for failure.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR raise ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  C89, C99, POSIX.1-2001.
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
