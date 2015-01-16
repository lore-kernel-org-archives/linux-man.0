From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] stdarg.3: Modify thread-safety information
Date: Fri, 16 Jan 2015 09:15:07 +0100
Message-ID: <54B8C88B.9050405@gmail.com>
References: <1421294449-22289-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421294449-22289-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/15/2015 05:00 AM, Ma Shimiao wrote:
> As annotation in glibc manual is more detailed, change the 
> thread-safety information to be the same as glibc manual.


Thanks, Ma Shimiao. Applied.

Cheers,

Michael


> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/stdarg.3 | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/stdarg.3 b/man3/stdarg.3
> index 0adbff8..62dc1f5 100644
> --- a/man3/stdarg.3
> +++ b/man3/stdarg.3
> @@ -236,10 +236,12 @@ l l l.
>  Interface	Attribute	Value
>  T{
>  .BR va_start (),
> -.BR va_arg (),
>  .BR va_end (),
>  .BR va_copy ()
>  T}	Thread safety	MT-Safe
> +T{
> +.BR va_arg ()
> +T}	Thread safety	MT-Safe race:ap
>  .TE
>  .SH CONFORMING TO
>  The
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
