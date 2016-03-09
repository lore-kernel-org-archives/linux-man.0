From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] capget.2: capability.h is now in linux uapi + tfix
Date: Wed, 9 Mar 2016 01:21:00 +0100
Message-ID: <56DF6C6C.7010101@gmail.com>
References: <1444681546-28408-1-git-send-email-baloo@gandi.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444681546-28408-1-git-send-email-baloo-M8Sm6a3kpgNeoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arthur Gautier <baloo-M8Sm6a3kpgNeoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Arthur,

On 10/12/2015 10:25 PM, Arthur Gautier wrote:
> introduced in 607ca46e97a1b6594b29647d98a32d545c24bdff

I don't think this is correct. Yes, the kernel headers were reorganized,
but capget() and friends are still exposed in glibc's sys/capability.h
Did I miss something?

Cheers,

Michael

> Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Arthur Gautier <baloo-M8Sm6a3kpgNeoWH0uzbU5w@public.gmane.org>
> ---
>  man2/capget.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/capget.2 b/man2/capget.2
> index 40b8a4eda595..29f0bdb69514 100644
> --- a/man2/capget.2
> +++ b/man2/capget.2
> @@ -16,7 +16,7 @@
>  .SH NAME
>  capget, capset \- set/get capabilities of thread(s)
>  .SH SYNOPSIS
> -.B #include <sys/capability.h>
> +.B #include <linux/capability.h>
>  .sp
>  .BI "int capget(cap_user_header_t " hdrp ", cap_user_data_t " datap );
>  .sp
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
