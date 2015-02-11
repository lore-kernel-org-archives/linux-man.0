From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getpwent.3: Modify thread-safety information
Date: Wed, 11 Feb 2015 08:12:47 +0100
Message-ID: <54DB00EF.6050500@gmail.com>
References: <1423554661-26010-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423554661-26010-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/10/2015 08:51 AM, Ma Shimiao wrote:
> As annotation in glibc manual is more detailed, change the 
> thread-safety information to be the same as glibc manual.

Thanks, Ma Shimiao. Applied.

By the way, how many pages still have remaining difference from 
the glibc manual to be resolved?

Cheers,

Michael

> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getpwent.3 | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/man3/getpwent.3 b/man3/getpwent.3
> index 8cfa9b4..c07dea1 100644
> --- a/man3/getpwent.3
> +++ b/man3/getpwent.3
> @@ -156,16 +156,17 @@ For an explanation of the terms used in this section, see
>  .BR attributes (7).
>  .TS
>  allbox;
> -lbw22 lb lb
> +lbw11 lb lbw41
>  l l l.
>  Interface	Attribute	Value
>  T{
>  .BR getpwent ()
> -T}	Thread safety	MT-Unsafe
> +T}	Thread safety	MT-Unsafe race:pwent race:pwentbuf locale
>  T{
>  .BR setpwent (),
> +.br
>  .BR endpwent ()
> -T}	Thread safety	MT-Safe
> +T}	Thread safety	MT-Unsafe race:pwent locale
>  .TE
>  .SH CONFORMING TO
>  SVr4, 4.3BSD, POSIX.1-2001.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
