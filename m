From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iconv.3: Modify thread-safety information
Date: Mon, 19 Jan 2015 10:17:07 +0100
Message-ID: <54BCCB93.6040902@gmail.com>
References: <1413272397-8505-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413272397-8505-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 10/14/2014 09:39 AM, Peng Haitao wrote:
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>

I missed applying this. Thankfully, Ma Shimiao noticed. Applied now.

Thanks

Michael


> ---
>  man3/iconv.3      | 10 ++++++++--
>  man3/iconv_open.3 |  2 --
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/man3/iconv.3 b/man3/iconv.3
> index 0dfcd7d..7a8d785 100644
> --- a/man3/iconv.3
> +++ b/man3/iconv.3
> @@ -140,7 +140,6 @@ An incomplete multibyte sequence has been encountered in the input.
>  .SH VERSIONS
>  This function is available in glibc since version 2.1.
>  .SH ATTRIBUTES
> -.SS Multithreading (see pthreads(7))
>  For an explanation of the terms used in this section, see
>  .BR attributes (7).
>  .TS
> @@ -150,8 +149,15 @@ l l l.
>  Interface	Attribute	Value
>  T{
>  .BR iconv ()
> -T}	Thread safety	MT-Safe
> +T}	Thread safety	MT-Safe race:cd
>  .TE
> +.PP
> +The
> +.BR iconv ()
> +function is MT-Safe, as long as callers arrange for
> +mutual exclusion on the
> +.I cd
> +argument.
>  .SH CONFORMING TO
>  POSIX.1-2001.
>  .SH NOTES
> diff --git a/man3/iconv_open.3 b/man3/iconv_open.3
> index 40ceeec..61845ae 100644
> --- a/man3/iconv_open.3
> +++ b/man3/iconv_open.3
> @@ -76,8 +76,6 @@ the state is in the initial state.
>  Using
>  .BR iconv (3)
>  modifies the descriptor's conversion state.
> -(This implies that a conversion
> -descriptor can not be used in multiple threads simultaneously.)
>  To bring the state back to the initial state, use
>  .BR iconv (3)
>  with NULL as
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
