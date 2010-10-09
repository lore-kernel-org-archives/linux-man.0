From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man pages for undocumented system calls
Date: Sat, 9 Oct 2010 08:32:52 +0200
Message-ID: <AANLkTin2Bem8pU9E94iEYdXWVFT9Cbh11+xnrpG9iaNJ@mail.gmail.com>
References: <201010081306.17014.stephan.mueller@atsec.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201010081306.17014.stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[Was: man pages for undocumented system calls]

Stephan,

Thanks for the idea for this page. However, there was much that was
missing, or not quite correct, so I wrote the version below. If you
have any comments or additions, please let me know

Paul, would you be willing to review this page for the system call
that you added?

Thanks,

Michael


.\" Copyright (c) 2010 Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
.\" based on a proposal from Stephan Mueller <smueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
.\"
.\" Permission is granted to make and distribute verbatim copies of this
.\" manual provided the copyright notice and this permission notice are
.\" preserved on all copies.
.\"
.\" Permission is granted to copy and distribute modified versions of
.\" this manual under the conditions for verbatim copying, provided that
.\" the entire resulting derived work is distributed under the terms of
.\" a permission notice identical to this one.
.\"
.\" Since the Linux kernel and libraries are constantly changing, this
.\" manual page may be incorrect or out-of-date.  The author(s) assume.
.\" no responsibility for errors or omissions, or for damages resulting.
.\" from the use of the information contained herein.  The author(s) may.
.\" not have taken the same level of care in the production of this.
.\" manual, which is licensed free of charge, as they might when working.
.\" professionally.
.\"
.\" Formatted or processed versions of this manual, if unaccompanied by
.\" the source, must acknowledge the copyright and authors of this work.
.\"
.\" Various pieces of text taken from the kernel source and the commentary
.\" in kernel commit fa28237cfcc5827553044cbd6ee52e33692b0faa
.\" both written by Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
.\"
.TH SUBPAGE_PROT 2 2010-10-09 "Linux" "Linux Programmer's Manual"
.SH NAME
subpage_prot \- copy a subpage protection map into the kernel
.SH SYNOPSIS
.nf
.BI "long subpage_prot(unsigned long " addr ", unsigned long " len ,
.BI "                  uint32_t *" map ");
.fi
.SH DESCRIPTION
The PowerPC-specific
.BR subpage_prot ()
system call provides the facility to control the access
permissions on individual 4kB subpages on systems configured with
a page size of 64kB.

The protection map is applied to the memory pages in the region starting at
.I addr
and continuing for
.I len
bytes.
Both of these arguments must be aligned to a 64-kB boundary.

The protection map is specified in the buffer pointed to by
.IR map .
The map has 2 bits per 4kB subpage;
thus each 32-bit word specifies the protections of 16 4kB subpages
inside a 64kB page
(so, the number of 32-bit words pointed to by
.I map
should equate to the number of 64-kB pages specified by
.IR len ).
Each 2-bit field in the protection map is either 0 to allow any access,
1 to prevent writes, or 2 or 3 to prevent all accesses.
.SH RETURN VALUE
On success,
.BR subpage_prot ()
returns 0.
Otherwise, one of the negated  error codes specified below is returned.
.SH ERRORS
.TP
.B EINVAL
The
.I addr
or
.I len
arguments are incorrect.
Both of these arguments must be aligned to a multiple of the system page size,
and they must not refer to a region outside of the
address space of the process or to a region that consists of huge pages.
.TP
.B EFAULT
The buffer referred to by
.I map
is not accessible.
.TP
.B ENOMEM
Out of memory.
.SH VERSIONS
This system call is provided on the PowerPC architecture
since Linux 2.6.25.
The system call is provided only if the kernel is configured with
.BR CONFIG_PPC_64K_PAGES .
No library support is provided.
.SH CONFORMING TO
This system call is Linux-specific.
.SH NOTES
Normal page protections (at the 64-kB page level) also apply;
the subpage protection mechanism is an additional constraint,
so putting 0 in a 2-bit field won't allow writes to a page that is otherwise
write-protected.
.SS Rationale
This system call is provided to assist writing emulators that
operate using 64-kB pages on PowerPC systems.
When emulating systems such as x86, which uses a smaller page size,
the emulator can no longer use the memory-management unit (MMU)
and normal system calls for controlling page protections.
(The emulator could emulate the MMU by checking and possibly remapping
the address for each memory access in software, but that is slow.)
The idea is that the emulator supplies an array of protection masks
to apply to a specified range of virtual addresses.
These masks are applied at the level where hardware page-table entries (PTEs)
are inserted into the hardware page table based on the Linux PTEs,
so the Linux PTEs are not affected.
.\" Perhaps we don't need to document this implementation detail:
.\"
.\" Implicit in this is that the regions of the address space that are
.\" protected are switched to use 4k hardware pages rather than 64k
.\" hardware pages (on machines with hardware 64k page support).
.\" In fact the whole process is switched to use 4k hardware pages when the
.\" subpage_prot system call is used, but this could be improved in future
.\" to switch only the affected segments.
.SH SEE ALSO
.BR mprotect (2),
.BR syscall (2);
.br
the kernel source file
.IR Documentation/vm/hugetlbpage.txt .


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
