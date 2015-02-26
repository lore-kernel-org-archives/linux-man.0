From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getgrent.3: Add explanation for grent
Date: Thu, 26 Feb 2015 08:34:21 +0100
Message-ID: <54EECC7D.3070606@gmail.com>
References: <1424841432-18853-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424841432-18853-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
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
>  man3/getgrent.3 | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/man3/getgrent.3 b/man3/getgrent.3
> index 7a39198..00d90ea 100644
> --- a/man3/getgrent.3
> +++ b/man3/getgrent.3
> @@ -183,6 +183,19 @@ T{
>  .BR endgrent ()
>  T}	Thread safety	MT-Unsafe race:grent locale
>  .TE
> +
> +[[
> +In the above table,
> +.I grent
> +in
> +.I race:grent
> +signifies that if any of the functions
> +.BR setgrent (),
> +.BR getgrent (),
> +or
> +.BR endgrent ()
> +are used in parallel in different threads of a program, then data races could occur.
> +]]
>  .SH CONFORMING TO
>  SVr4, 4.3BSD, POSIX.1-2001.
>  .SH SEE ALSO
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
