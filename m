From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] makecontext.3: Modify thread-safety information
Date: Mon, 19 Jan 2015 10:19:13 +0100
Message-ID: <54BCCC11.2030501@gmail.com>
References: <1421637334-6110-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421637334-6110-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/19/2015 04:15 AM, Ma Shimiao wrote:
> As annotation in glibc manual is more detailed, change the 
> thread-safety information to be the same as glibc manual.

Applied. Thank you, Ma Shimiao.

Cheers,

Michael


> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/makecontext.3 | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/man3/makecontext.3 b/man3/makecontext.3
> index 2c83f0e..8719367 100644
> --- a/man3/makecontext.3
> +++ b/man3/makecontext.3
> @@ -107,13 +107,15 @@ For an explanation of the terms used in this section, see
>  .BR attributes (7).
>  .TS
>  allbox;
> -lbw28 lb lb
> +lb lb lb
>  l l l.
>  Interface	Attribute	Value
>  T{
> -.BR makecontext (),
> +.BR makecontext ()
> +T}	Thread safety	MT-Safe race:ucp
> +T{
>  .BR swapcontext ()
> -T}	Thread safety	MT-Safe
> +T}	Thread safety	MT-Safe race:oucp race:ucp
>  .TE
>  .SH CONFORMING TO
>  SUSv2, POSIX.1-2001.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
