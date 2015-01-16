From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getdate.3: Modify thread-safety information
Date: Fri, 16 Jan 2015 09:13:33 +0100
Message-ID: <54B8C82D.3080504@gmail.com>
References: <1421287359-13158-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421287359-13158-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/15/2015 03:02 AM, Ma Shimiao wrote:
> As annotation in glibc manual is more detailed, change the
> thread-safety information to be the same as glibc manual.


Thanks, Ma Shimiao. Applied.

Cheers,

Michael


> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getdate.3 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man3/getdate.3 b/man3/getdate.3
> index 11db129..0c9fb32 100644
> --- a/man3/getdate.3
> +++ b/man3/getdate.3
> @@ -203,10 +203,10 @@ l l l.
>  Interface	Attribute	Value
>  T{
>  .BR getdate ()
> -T}	Thread safety	MT-Unsafe
> +T}	Thread safety	MT-Unsafe race:getdate env locale
>  T{
>  .BR getdate_r ()
> -T}	Thread safety	MT-Safe
> +T}	Thread safety	MT-Safe env locale
>  .TE
>  .SH CONFORMING TO
>  POSIX.1-2001.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
