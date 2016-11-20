From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] mprotect.2: Added information regarding
 PROT_{SEM,SAO,GROWSUP,GROWSDOWN}
Date: Sun, 20 Nov 2016 22:39:48 +0100
Message-ID: <91214c03-05a1-ad11-7ac8-282dc4177cca@gmail.com>
References: <20161120011603.GA31811@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161120011603.GA31811@obsidian>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Eugene,

I've applied this patch, and tweaked a few pieces, but need 
help on one point.

On 11/20/2016 02:16 AM, Eugene Syromyatnikov wrote:
> Changes since v2:
>  * Commit IDs from historic repositories removed.
>  * Note regarding intended purpose of PROT_SEM written up.
>  * Comment format changed to .\"
>  * "VMA" renamed to "mapping"
>  * Removed note regarding PROT_GROWS*.
> 
> ---
>  man2/mprotect.2 | 63 +++++++++++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 55 insertions(+), 8 deletions(-)
> 
> diff --git a/man2/mprotect.2 b/man2/mprotect.2
> index 440fa65..8f4c09f 100644
> --- a/man2/mprotect.2
> +++ b/man2/mprotect.2
> @@ -30,12 +30,6 @@
>  .\" 2007-06-02, mtk: Fairly substantial rewrites and additions, and
>  .\" a much improved example program.
>  .\"
> -.\" FIXME The following protection flags need documenting:
> -.\"         PROT_SEM
> -.\"         PROT_GROWSDOWN
> -.\"         PROT_GROWSUP
> -.\"         PROT_SAO (PowerPC)
> -.\"
>  .TH MPROTECT 2 2015-07-23 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  mprotect, pkey_mprotect \- set protection on a region of memory
> @@ -60,7 +54,7 @@ that violates the protection, then the kernel generates a
>  signal for the process.
>  .PP
>  .I prot
> -is either
> +is a combination of the following access flags:
>  .B PROT_NONE
>  or a bitwise-or of the other values in the following list:
>  .TP 1.1i
> @@ -75,6 +69,40 @@ The memory can be modified.
>  .TP
>  .B PROT_EXEC
>  The memory can be executed.
> +.TP
> +.BR PROT_SEM " (since Linux 2.5.7)"
> +The memory can be used for atomic operations. It was introduced as part of
> +.BR futex (2)
> +implementation (in order to guarantee ability to perform atomic
> +operations required by its commands such as
> +.BR FUTEX_WAIT ),
> +but not actually used in any currently supported architecture so far.
> +.\" aba46c5027cb59d98052231b36efcbbde9c77a1d ef3d3246a0d06be622867d21af25f997aeeb105f
> +.TP
> +.BR PROT_SAO " (since Linux 2.6.26)"
> +The memory should have strong access ordering. This feature is specific to
> +PowerPC architecture (version 2.06 of architecture specification adds SAO CPU
> +feature, and it is available on POWER 7 or PowerPC A2, for example).
> +.PP
> +Additionally (since Linux 2.6.0),
> +.I prot
> +can have one of the following flags set:
> +.TP 1.1i
> +.\" mm/mmap.c:
> +.\"	vm_flags |= calc_vm_prot_bits(prot, pkey) | calc_vm_flag_bits(flags) |
> +.\"			mm->def_flags | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC;
> +.\" And calc_vm_flag_bits converts only GROWSDOWN/DENYWRITE/LOCKED.
> +.B PROT_GROWSUP
> +Apply protection mode up to the end of the mapping which grows up (it should be a
> +stack segment on HP PA-RISC, since there are no other ways to map a segment with
> +.B VM_GROWSUP
> +even if architecture has support for it.)

We need a different way to talk about VM_GROWSUP, since that is
a detail internal to the kernel. Do you have a suggestion?

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
