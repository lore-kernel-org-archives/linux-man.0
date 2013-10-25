From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] flock.2: update documentation path
Date: Sat, 26 Oct 2013 11:05:23 +1300
Message-ID: <526AEB23.1000109@gmail.com>
References: <1381265274-5450-1-git-send-email-maxin.john@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381265274-5450-1-git-send-email-maxin.john-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: maxin.john-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Maxin B. John" <maxin.john-AM1FMPraTHU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 09.10.2013 09:47, maxin.john-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: "Maxin B. John" <maxin.john-AM1FMPraTHU@public.gmane.org>
> 
> Update the Kernel Documentation path for flock
> 
> Signed-off-by: Maxin B. John <maxin.john-AM1FMPraTHU@public.gmane.org>
> ---
>  man2/flock.2 |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/man2/flock.2 b/man2/flock.2
> index ee3e1c1..838cc7e 100644
> --- a/man2/flock.2
> +++ b/man2/flock.2
> @@ -208,7 +208,7 @@ and occurs on many other implementations.)
>  .BR open (2),
>  .BR lockf (3)
>  
> -.I Documentation/filesystem/locks.txt
> +.I Documentation/filesystems/locks.txt
>  in the Linux kernel source tree
>  .RI ( Documentation/locks.txt
>  in older kernels)

Applied. 

Thanks,

Michael




-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
My next Linux/UNIX system programming course:
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
