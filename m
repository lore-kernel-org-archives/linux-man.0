From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] kcmp.2: tfix
Date: Mon, 20 Jun 2016 14:08:53 +0200
Message-ID: <f53f3ddc-a507-4524-8500-2cf78d863ae7@gmail.com>
References: <1466369536-2119-1-git-send-email-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466369536-2119-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/19/2016 10:52 PM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

Thanks, Jakub! Applied.

Cheers,

Michael

> ---
>  man2/kcmp.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/kcmp.2 b/man2/kcmp.2
> index 831fd9f..78843a0 100644
> --- a/man2/kcmp.2
> +++ b/man2/kcmp.2
> @@ -188,7 +188,7 @@ Insufficient permission to inspect process resources.
>  The
>  .B CAP_SYS_PTRACE
>  capability is required to inspect processes that you do not own.
> -Other ptrace limitations imay also apply, such as
> +Other ptrace limitations may also apply, such as
>  .BR CONFIG_SECURITY_YAMA ,
>  which, when
>  .I /proc/sys/kernel/yama/ptrace_scope
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
