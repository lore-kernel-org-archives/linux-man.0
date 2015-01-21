From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] hsearch.3: Modify thread-safety information
Date: Wed, 21 Jan 2015 08:59:03 +0100
Message-ID: <54BF5C47.6070306@gmail.com>
References: <1421804065-629-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421804065-629-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/21/2015 02:34 AM, Ma Shimiao wrote:
> As annotation in glibc manual is more detailed, change the 
> thread-safety information to be the same as glibc manual.

Thanks, Ma Shimiao.

Applied.

Cheers,

Michael


> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/hsearch.3 | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/man3/hsearch.3 b/man3/hsearch.3
> index aced682..0f1af24 100644
> --- a/man3/hsearch.3
> +++ b/man3/hsearch.3
> @@ -233,19 +233,21 @@ For an explanation of the terms used in this section, see
>  .BR attributes (7).
>  .TS
>  allbox;
> -lbw38 lb lb
> +lbw25 lb lb
>  l l l.
>  Interface	Attribute	Value
>  T{
>  .BR hcreate (),
>  .BR hsearch (),
> +.br
>  .BR hdestroy ()
> -T}	Thread safety	MT-Unsafe
> +T}	Thread safety	MT-Unsafe race:hsearch
>  T{
>  .BR hcreate_r (),
>  .BR hsearch_r (),
> +.br
>  .BR hdestroy_r ()
> -T}	Thread safety	MT-Safe
> +T}	Thread safety	MT-Safe race:htab
>  .TE
>  .SH CONFORMING TO
>  The functions
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
