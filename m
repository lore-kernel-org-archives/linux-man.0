From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] random_r.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 01 Apr 2014 20:15:19 +0200
Message-ID: <533B0237.2000207@gmail.com>
References: <1395735702-6364-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395735702-6364-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org" <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org" <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Thanks, Haitao! Applied.

Cheers,

Michael


On 03/25/2014 09:24 AM, penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org wrote:
> The functions random_r(), srandom_r(), initstate_r() and
> setstate_r() are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/random_r.3 | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/random_r.3 b/man3/random_r.3
> index 829eb81..92fe430 100644
> --- a/man3/random_r.3
> +++ b/man3/random_r.3
> @@ -23,7 +23,7 @@
>  .\" %%%LICENSE_END
>  .\"
>  .\"
> -.TH RANDOM_R 3  2013-04-19 "GNU" "Linux Programmer's Manual"
> +.TH RANDOM_R 3  2014-03-25 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  random_r, srandom_r, initstate_r, setstate_r \- reentrant
>  random number generator
> @@ -125,6 +125,15 @@ or
>  argument to
>  .BR random_r ()
>  was NULL.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR random_r (),
> +.BR srandom_r (),
> +.BR initstate_r (),
> +and
> +.BR setstate_r ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  These functions are nonstandard glibc extensions.
>  .\" These functions appear to be on Tru64, but don't seem to be on
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
