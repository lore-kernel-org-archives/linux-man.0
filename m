From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sigprocmask.2: Expand/Clarify libc/kernel sigset_t
 difference
Date: Sun, 28 Aug 2016 17:48:59 +1200
Message-ID: <ae5dde8e-92d5-c9cd-c545-52797fd24e19@gmail.com>
References: <20160825032456.GA15347@Kenos-MacBook-Pro-2.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160825032456.GA15347-nTuEee01erudBw3G0RLmbfBZMHv189dXZkel5v8DVj8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Keno,

On 08/25/2016 03:24 PM, Keno Fischer wrote:
> Also move up the signature for rt_sigprocmask, similar to the way this is
> done in clone.2.
> 
> Due to the history of sigprocmask, there are various notions of what sigset_t
> refers to. This attempts to clarify the man page, by giving the major instances
> different names:
> - sigset_t is the glibc sigset_t (1024 bits)
> - kernel_sigset_t is the kernel's sigset_t (64 bits)
> - old_kernel_sigset_t is the pre-rt kernel's sigset_t (32 bits)
> 
> and explaining their difference in the NOTES. Even though the sources do
> not refer to the various sigset_t's by these names, I think it is
> important to be explicit, esp since sizeof(sigset_t) would give
> an incorrect value for `sigsetsize` if written in a source file that
> includes the libc headers.
> 
> Lastly, move the note on an incorrect `sigsetsize` causing EINVAL up to
> the ERRORS section, so everything is in one place.

Nice work! Patch applied. Thank you.

Cheers,

Michael


> ---
>  man2/sigprocmask.2 | 49 +++++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 39 insertions(+), 10 deletions(-)
> 
> diff --git a/man2/sigprocmask.2 b/man2/sigprocmask.2
> index 51f7933..907061f 100644
> --- a/man2/sigprocmask.2
> +++ b/man2/sigprocmask.2
> @@ -32,8 +32,19 @@ sigprocmask, rt_sigprocmask \- examine and change blocked signals
>  .SH SYNOPSIS
>  .B #include <signal.h>
>  .sp
> -.BI "int sigprocmask(int " how ", const sigset_t *" set ,
> -.BI "sigset_t *" oldset );
> +.nf
> +/* Prototype for the glibc wrapper function */
> +.BI "int sigprocmask(int " how ", const sigset_t *" set ", sigset_t *" oldset );
> +
> +/* Prototype for the underlying system call */
> +.BI "int rt_sigprocmask(int " how ", const kernel_sigset_t *" set ,
> +.BI "                   kernel_sigset_t *" oldset, " size_t " sigsetsize );
> +
> +/* Prototype for the legacy system call (deprecated) */
> +.BI "int sigprocmask(int " how ", const old_kernel_sigset_t *" set ,
> +.BI "                old_kernel_sigset_t *" oldset ); "
> +.fi
> +
>  .sp
>  .in -4n
>  Feature Test Macro Requirements for glibc (see
> @@ -111,9 +122,10 @@ or
>  argument points outside the process's allocated address space.
>  .TP
>  .B EINVAL
> -The value specified in
> +Either the value specified in
>  .I how
> -was invalid.
> +was invalid or the kernel does not support the size passed in
> +.I sigsetsize.
>  .SH CONFORMING TO
>  POSIX.1-2001, POSIX.1-2008.
>  .SH NOTES
> @@ -148,6 +160,16 @@ See
>  for details on manipulating signal sets.
>  .\"
>  .SS C library/kernel differences
> +
> +The kernel's definition of
> +.IR sigset_t
> +differs in size from that used
> +by the C library. In this man page the former is referred to as
> +.I kernel_sigset_t
> +(it is still named
> +.I sigset_t
> +in the kernel sources).
> +
>  The glibc wrapper function for
>  .BR sigprocmask ()
>  silently ignores attempts to block the two real-time signals that
> @@ -161,23 +183,30 @@ The original Linux system call was named
>  However, with the addition of real-time signals in Linux 2.2,
>  the fixed-size, 32-bit
>  .IR sigset_t
> +(referred to as
> +.IR old_kernel_sigset_t
> +in this man page)
>  type supported by that system call was no longer fit for purpose.
>  Consequently, a new system call,
>  .BR rt_sigprocmask (),
>  was added to support an enlarged
>  .IR sigset_t
> -type.
> +type
> +(referred to as
> +.IR kernel_sigset_t
> +in this man page
> +).
>  The new system call takes a fourth argument,
>  .IR "size_t sigsetsize" ,
>  which specifies the size in bytes of the signal sets in
>  .IR set
>  and
>  .IR oldset .
> -This argument is currently required to have the value
> -.IR sizeof(sigset_t)
> -(or the error
> -.B EINVAL
> -results).
> +This argument is currently required to have the value 8
> +(
> +.IR sizeof(kernel_sigset_t)
> +).
> +
>  The glibc
>  .BR sigprocmask ()
>  wrapper function hides these details from us, transparently calling
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
