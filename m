From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] readdir.3: Modify thread-safety information
Date: Tue, 30 Dec 2014 14:28:22 +0100
Message-ID: <54A2A876.2040607@gmail.com>
References: <1419488539-4621-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1419488539-4621-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/25/2014 07:22 AM, Ma Shimiao wrote:
> As annotation in glibc manual is more detailed, change the
> thread-safety information to be same as glibc manual.


Thanks, Ma Shimiao. Applied in the 'attributes_reformat_2' branch.

Cheers,

Michael




> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/readdir.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/readdir.3 b/man3/readdir.3
> index 556da62..b67e31a 100644
> --- a/man3/readdir.3
> +++ b/man3/readdir.3
> @@ -154,7 +154,7 @@ l l l.
>  Interface	Attribute	Value
>  T{
>  .BR readdir ()
> -T}	Thread safety	MT-Unsafe
> +T}	Thread safety	MT-Unsafe race:dirstream
>  T{
>  .BR readdir_r ()
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
