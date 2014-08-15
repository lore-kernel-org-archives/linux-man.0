From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] vdso(7): add new i386 vdso symbols in linux-3.15
Date: Fri, 15 Aug 2014 21:20:10 +0200
Message-ID: <53EE5D6A.20104@gmail.com>
References: <1406997983-23266-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406997983-23266-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Mike,

Thanks. I've applied this patch, but I want to check a point.
The subject line mentions Linux 3.15, but the version symbols
in the patch say, LINUX_2.6. Is that correct?

Cheers,

Michael


On 08/02/2014 06:46 PM, Mike Frysinger wrote:
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
>  man7/vdso.7 | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/man7/vdso.7 b/man7/vdso.7
> index 157bd17..6341183 100644
> --- a/man7/vdso.7
> +++ b/man7/vdso.7
> @@ -439,6 +439,11 @@ _
>  __kernel_sigreturn	LINUX_2.5
>  __kernel_rt_sigreturn	LINUX_2.5
>  __kernel_vsyscall	LINUX_2.5
> +.\" Added in 7a59ed415f5b57469e22e41fc4188d5399e0b194 and updated
> +.\" in 37c975545ec63320789962bf307f000f08fabd48.
> +__vdso_clock_gettime	LINUX_2.6
> +__vdso_gettimeofday	LINUX_2.6
> +__vdso_time	LINUX_2.6
>  .TE
>  .if t \{\
>  .in
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
