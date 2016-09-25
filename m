From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clone.2: Adjust syscall prototype and expand CLONE_SETTLS
 description
Date: Sun, 25 Sep 2016 20:06:48 +0200
Message-ID: <8e64a2c0-3085-343e-1a2f-808db3e4ddab@gmail.com>
References: <20160824030607.GA2596@Kenos-MacBook-Pro-2.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160824030607.GA2596-nTuEee01erudBw3G0RLmbfBZMHv189dXZkel5v8DVj8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Josh Triplett <josh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Keno,

On 08/24/2016 05:06 AM, Keno Fischer wrote:
> The prototype for the system call was added in 81f10dad, but looking at the
> kernel's fork.c, I believe the relevant definition is
> 
> SYSCALL_DEFINE5(clone, unsigned long, clone_flags, unsigned long, newsp,
> int __user *, parent_tidptr,
> int __user *, child_tidptr,
> unsigned long, tls)
> 
> so the last argument is the tls argument, not a pt_regs argument.
> I stumbled upon this while trying to understand CLONE_SETTLS, so I expanded
> that description a little to cover other architectures.

I applied this patch. Further work in progress, following Josh's comments.

Cheers,

Michael

> ---
>  man2/clone.2 | 26 ++++++++++++++++++++------
>  1 file changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/man2/clone.2 b/man2/clone.2
> index b867961..7c80e63 100644
> --- a/man2/clone.2
> +++ b/man2/clone.2
> @@ -51,14 +51,14 @@ clone, __clone2 \- create a child process
>  
>  .BI "int clone(int (*" "fn" ")(void *), void *" child_stack ,
>  .BI "          int " flags ", void *" "arg" ", ... "
> -.BI "          /* pid_t *" ptid ", struct user_desc *" tls \
> +.BI "          /* pid_t *" ptid ", void *" newtls \
>  ", pid_t *" ctid " */ );"
>  
>  /* Prototype for the raw system call */
>  
>  .BI "long clone(unsigned long " flags ", void *" child_stack ,
>  .BI "          void *" ptid ", void *" ctid ,
> -.BI "          struct pt_regs *" regs );
> +.BI "          unsigned long " newtls );
>  .fi
>  .SH DESCRIPTION
>  .BR clone ()
> @@ -544,11 +544,25 @@ then trace the child also (see
>  .BR ptrace (2)).
>  .TP
>  .BR CLONE_SETTLS " (since Linux 2.5.32)"
> -The
> +The TLS (Thread Local Storage) descriptor is set to
> +.I newtls.
> +
> +The interpretation of
> +.I newtls
> +and the resulting effect is architecture dependent.
> +On x86,
>  .I newtls
> -argument is the new TLS (Thread Local Storage) descriptor.
> +is interpreted as a
> +.IR "struct user_desc *"
>  (See
> -.BR set_thread_area (2).)
> +.BR set_thread_area (2)).
> +On x86_64 it is the new value to be set for the %fs base register
> +(See the
> +.I ARCH_SET_FS
> +argument to
> +.BR arch_prctl (2)).
> +On architectures with a dedicated TLS register, it is the new value
> +of that register.
>  .TP
>  .BR CLONE_SIGHAND " (since Linux 2.0)"
>  If
> @@ -813,7 +827,7 @@ The raw system call interface on x86 and many other architectures is roughly:
>  
>  .BI "long clone(unsigned long " flags ", void *" child_stack ,
>  .BI "           void *" ptid ", void *" ctid ,
> -.BI "           struct pt_regs *" regs );
> +.BI "           unsigned long " newtls );
>  
>  .fi
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
