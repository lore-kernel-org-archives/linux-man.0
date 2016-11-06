From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] seccomp.2: document changed interaction with ptrace
Date: Sun, 6 Nov 2016 13:22:14 -0700
Message-ID: <a0d03b9a-2a2a-d641-92b2-575186f4071d@gmail.com>
References: <1478378436-7368-1-git-send-email-jann@thejh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478378436-7368-1-git-send-email-jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Jann,

On 11/05/2016 02:40 PM, Jann Horn wrote:
> Signed-off-by: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>

Thanks for this! I knew the behavior was planned to change here, but
had not tracked the details. Patch applied.

Cheers,

Michael

> ---
>  man2/seccomp.2 | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/seccomp.2 b/man2/seccomp.2
> index dc3d87d..8d36fdc 100644

> --- a/man2/seccomp.2
> +++ b/man2/seccomp.2
> @@ -455,8 +455,13 @@ requested by changing the system call to a valid system call number.
>  If the tracer asks to skip the system call, then the system call will
>  appear to return the value that the tracer puts in the return value register.
>  
> -The seccomp check will not be run again after the tracer is notified.
> -(This means that seccomp-based sandboxes
> +.\" This was changed in ce6526e8afa4.
> +.\" A related hole, using PTRACE_SYSCALL instead of SECCOMP_RET_TRACE, was
> +.\" changed in arch-specific commits, e.g. 93e35efb8de4 for X86 and
> +.\" 0f3912fd934c for ARM.
> +Before kernel 4.8, the seccomp check will not be run again after the tracer is
> +notified.
> +(This means that, on older kernels, seccomp-based sandboxes
>  .B "must not"
>  allow use of
>  .BR ptrace (2)\(emeven
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
