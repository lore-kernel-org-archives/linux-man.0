From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] toupper.3: Modify thread-safety information
Date: Tue, 03 Feb 2015 08:13:39 +0100
Message-ID: <54D07523.1010307@gmail.com>
References: <1422946438-13204-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422946438-13204-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Ma Shimiao. Applied in the mt_attributes branch.

Cheers,

Michael


On 02/03/2015 07:53 AM, Ma Shimiao wrote:
> After researching and talking, we think toupper() and tolower()
> should not be marked with locale.
> After changing, the markings match glbc markings.
> 
> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/toupper.3 | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/man3/toupper.3 b/man3/toupper.3
> index fd98245..e3abba0 100644
> --- a/man3/toupper.3
> +++ b/man3/toupper.3
> @@ -122,9 +122,8 @@ l l l.
>  Interface	Attribute	Value
>  T{
>  .BR toupper (),
> -.BR tolower ()
> -T}	Thread safety	MT-Safe locale
> -T{
> +.BR tolower (),
> +.br
>  .BR toupper_l (),
>  .BR tolower_l ()
>  T}	Thread safety	MT-Safe
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
