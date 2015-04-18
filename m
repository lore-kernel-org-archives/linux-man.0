From: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [patch] seccomp.2: Note that memory area is read-only
Date: Sat, 18 Apr 2015 16:37:35 -0700
Message-ID: <CAGXu5jLriPDQR=BDDe7ztVua+-0wLDd-vsFZt5eu18ThYN69nA@mail.gmail.com>
References: <5522A66F.9060606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5522A66F.9060606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, Apr 6, 2015 at 8:29 AM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Kees,
>
> I recently was asked about the point below, and had to go check the code
> to be sure, since the man page said nothing. It would be good to have
> a confirmation: the seccomp_data buffer supplied to a seccomp BPF program
> is read-only, right? (That is, one can't write to the buffer in order to
> change the arguments that a system call actually receives.)

That's correct. If BPF even allows changing the data, it's not copied
back to the syscall when it runs. Anything wanting to do things like
that would need to use ptrace to catch the call an directly modify the
registers before continuing with the call.

>
> A small man page patch below.

Looks good, thanks!

-Kees

>
> Cheers,
>
> Michael
>
> --- a/man2/seccomp.2
> +++ b/man2/seccomp.2
> @@ -232,15 +232,15 @@ struct sock_filter {            /* Filter block */
>  };
>  .fi
>  .in
>
>  When executing the instructions, the BPF program operates on the
>  system call information made available (i.e., use the
>  .BR BPF_ABS
> -addressing mode) as a buffer of the following form:
> +addressing mode) as a (read-only) buffer of the following form:
>
>  .in +4n
>  .nf
>  struct seccomp_data {
>      int   nr;                   /* System call number */
>      __u32 arch;                 /* AUDIT_ARCH_* value
>                                     (see <linux/audit.h>) */
>
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/



-- 
Kees Cook
Chrome OS Security
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
