From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sched_setattr.2: Remove a const attribute
Date: Thu, 23 Jul 2015 09:40:23 +0200
Message-ID: <55B09A67.7090808@gmail.com>
References: <1433851901-25034-1-git-send-email-ju.orth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433851901-25034-1-git-send-email-ju.orth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julian Orth <ju.orth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Julian,

On 06/09/2015 02:11 PM, Julian Orth wrote:
> The attr argument of sched_setattr was documented as const but the
> kernel will modify the size field of this struct if it contains an
> invalid value. See the documentation of the size field for details.

Thanks! Patch applied.

Cheers,

Michael


> ---
>  man2/sched_setattr.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/sched_setattr.2 b/man2/sched_setattr.2
> index dff8e6d..df14ab4 100644
> --- a/man2/sched_setattr.2
> +++ b/man2/sched_setattr.2
> @@ -31,7 +31,7 @@ set and get scheduling policy and attributes
>  .nf
>  .B #include <sched.h>
>  
> -.BI "int sched_setattr(pid_t " pid ", const struct sched_attr *" attr ,
> +.BI "int sched_setattr(pid_t " pid ", struct sched_attr *" attr ,
>  .BI "                  unsigned int " flags );
>  
>  .BI "int sched_getattr(pid_t " pid ", struct sched_attr *" attr ,



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
