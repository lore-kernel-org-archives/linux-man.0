From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] stdio_ext.3: Modify thread-safety information
Date: Wed, 04 Feb 2015 07:10:39 +0100
Message-ID: <54D1B7DF.5000906@gmail.com>
References: <1423014690-8475-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423014690-8475-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/04/2015 02:51 AM, Ma Shimiao wrote:
> Change the thread safety information to be the same as glibc.

Applied.  Thanks, Ma Shimiao.

Cheers,

Michael


> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/stdio_ext.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/stdio_ext.3 b/man3/stdio_ext.3
> index bdf6194..7c3754b 100644
> --- a/man3/stdio_ext.3
> +++ b/man3/stdio_ext.3
> @@ -143,7 +143,7 @@ T{
>  .br
>  .BR __fpurge (),
>  .BR __fsetlocking ()
> -T}	Thread safety	MT-Unsafe
> +T}	Thread safety	MT-Safe race:stream
>  T{
>  .BR __flbf (),
>  .BR __freadable (),
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
