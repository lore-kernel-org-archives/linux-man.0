From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getpass.3:wsfix
Date: Tue, 30 Dec 2014 14:29:31 +0100
Message-ID: <54A2A8BB.7060206@gmail.com>
References: <1419922059-5924-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1419922059-5924-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Thanks, Ma Shimiao. Applied (in the 'master')

Cheers,

Michael




On 12/30/2014 07:47 AM, Ma Shimiao wrote:
> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getpass.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/getpass.3 b/man3/getpass.3
> index a3397c0..0f40652 100644
> --- a/man3/getpass.3
> +++ b/man3/getpass.3
> @@ -27,7 +27,7 @@ getpass \- get a password
>  .SH SYNOPSIS
>  .B #include <unistd.h>
>  .sp
> -.BI "char *getpass( const char *" prompt );
> +.BI "char *getpass(const char *" prompt );
>  .sp
>  .in -4n
>  Feature Test Macro Requirements for glibc (see
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
