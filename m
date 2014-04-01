From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] random.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 01 Apr 2014 20:15:05 +0200
Message-ID: <533B0229.2030704@gmail.com>
References: <1395730035-1946-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395730035-1946-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org" <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org" <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Thanks, Haitao! Applied.

Cheers,

Michael


On 03/25/2014 07:49 AM, penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org wrote:
> The functions random(), srandom(), initstate() and setstate()
> are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/random.3 | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/random.3 b/man3/random.3
> index e1a8e17..dc6fa9f 100644
> --- a/man3/random.3
> +++ b/man3/random.3
> @@ -30,7 +30,7 @@
>  .\" Modified Sat Jul 24 18:13:39 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
>  .\" Modified Sun Aug 20 21:47:07 2000, aeb
>  .\"
> -.TH RANDOM 3  2013-04-19 "GNU" "Linux Programmer's Manual"
> +.TH RANDOM 3  2014-03-25 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  random, srandom, initstate, setstate \- random number generator
>  .SH SYNOPSIS
> @@ -149,6 +149,15 @@ was NULL.
>  .B EINVAL
>  A state array of less than 8 bytes was specified to
>  .BR initstate ().
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR random (),
> +.BR srandom (),
> +.BR initstate (),
> +and
> +.BR setstate ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  4.3BSD, POSIX.1-2001.
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
