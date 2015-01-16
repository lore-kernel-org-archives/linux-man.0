From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getpass.3: Modify thread-safety information
Date: Fri, 16 Jan 2015 09:13:42 +0100
Message-ID: <54B8C836.8080804@gmail.com>
References: <1421287386-13242-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421287386-13242-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/15/2015 03:03 AM, Ma Shimiao wrote:
> As annotation in glibc manual is more detailed, change the
> thread-safety information to be the same as glibc manual.


Thanks, Ma Shimiao. Applied.

Cheers,

Michael


> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getpass.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/getpass.3 b/man3/getpass.3
> index fb13819..181ba2b 100644
> --- a/man3/getpass.3
> +++ b/man3/getpass.3
> @@ -103,7 +103,7 @@ l l l.
>  Interface	Attribute	Value
>  T{
>  .BR getpass ()
> -T}	Thread safety	MT-Unsafe
> +T}	Thread safety	MT-Unsafe term
>  .TE
>  .SH CONFORMING TO
>  Present in SUSv2, but marked LEGACY.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
