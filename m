From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/5] kexec_load.2: tfix
Date: Wed, 3 Feb 2016 08:26:24 +0100
Message-ID: <56B1ABA0.1050407@gmail.com>
References: <1454446248-448-1-git-send-email-jwilk@jwilk.net>
 <1454446248-448-2-git-send-email-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454446248-448-2-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/02/2016 09:50 PM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

Thanks, Jakub. Applied.

Cheers,

Michael


> ---
>  man2/kexec_load.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/kexec_load.2 b/man2/kexec_load.2
> index 2509e2c..ad47a72 100644
> --- a/man2/kexec_load.2
> +++ b/man2/kexec_load.2
> @@ -60,7 +60,7 @@ The following values can be specified in
>  Execute the new kernel automatically on a system crash.
>  This "crash kernel" is loaded into an area of reserved memory that
>  is determined at boot time using the
> -.I craskkernel
> +.I crashkernel
>  kernel command-line parameter.
>  The location of this reserved memory is exported to user space via the
>  .I /proc/iomem
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
