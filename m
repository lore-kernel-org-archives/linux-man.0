From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getpwent.3: Add explanation for pwent
Date: Thu, 26 Feb 2015 08:34:28 +0100
Message-ID: <54EECC84.5080809@gmail.com>
References: <1424841444-18901-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424841444-18901-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/25/2015 06:17 AM, Ma Shimiao wrote:
> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>


Thanks, Ma Shimiao. Applied.

Cheers,

Michael



> ---
>  man3/getpwent.3 | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/man3/getpwent.3 b/man3/getpwent.3
> index abcaec6..136b5ee 100644
> --- a/man3/getpwent.3
> +++ b/man3/getpwent.3
> @@ -172,6 +172,19 @@ T{
>  .BR endpwent ()
>  T}	Thread safety	MT-Unsafe race:pwent locale
>  .TE
> +
> +[[
> +In the above table,
> +.I pwent
> +in
> +.I race:pwent
> +signifies that if any of the functions
> +.BR setpwent (),
> +.BR getpwent (),
> +or
> +.BR endpwent ()
> +are used in parallel in different threads of a program, then data races could occur.
> +]]
>  .SH CONFORMING TO
>  SVr4, 4.3BSD, POSIX.1-2001.
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
