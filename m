From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] seccomp.2: Note that memory area is read-only
Date: Sat, 18 Apr 2015 13:17:28 +0200
Message-ID: <CAKgNAkihzKkmAOaK2mMLUm4LNiX0pjx=pctR3gUVyPjDSkL1wg@mail.gmail.com>
References: <5522A66F.9060606@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5522A66F.9060606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "CC: Kees Cook" <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Kees,

Ping!

Cheers,

Michael



On 6 April 2015 at 17:29, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Kees,
>
> I recently was asked about the point below, and had to go check the code
> to be sure, since the man page said nothing. It would be good to have
> a confirmation: the seccomp_data buffer supplied to a seccomp BPF program
> is read-only, right? (That is, one can't write to the buffer in order to
> change the arguments that a system call actually receives.)
>
> A small man page patch below.
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
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
