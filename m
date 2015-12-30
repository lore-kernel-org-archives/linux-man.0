From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] syscall(2): fix highlight of psr reg
Date: Wed, 30 Dec 2015 20:37:45 +0100
Message-ID: <56843289.80704@gmail.com>
References: <1451499578-28191-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1451499578-28191-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/30/2015 07:19 PM, Mike Frysinger wrote:
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
>  man2/syscall.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

D'oh! Thanks, Mike. Applied.

Cheers,

Michael



> diff --git a/man2/syscall.2 b/man2/syscall.2
> index 267f09c..f44aae4 100644
> --- a/man2/syscall.2
> +++ b/man2/syscall.2
> @@ -195,7 +195,7 @@ The actual error value is still contained in the return register.
>  On sparc, the carry bit
>  .RI ( csr )
>  in the processor status register
> -.IR ( psr )
> +.RI ( psr )
>  is used instead of a full register.
>  .IP [2]
>  .I NR
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
