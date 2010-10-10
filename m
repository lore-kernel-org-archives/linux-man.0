From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: subpage_prot() man page
Date: Sun, 10 Oct 2010 07:53:35 +0200
Message-ID: <AANLkTi=GZ5hxhbG7Frak-Hb+PC8=4uXcnBEgpcbCrmPG@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[Reseending with corrected subject line for Paul's benefit]
[Was: man pages for undocumented system calls]

Stephan,

Thanks for the idea for this page. However, there was much that was
missing, or not quite correct, so I wrote the version below. If you
have any comments or additions, please let me know

Paul, would you be willing to review this page for the system call
that you added?

Thanks,

Michael


=2E\" Copyright (c) 2010 Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
=2E\" based on a proposal from Stephan Mueller <smueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
=2E\"
=2E\" Permission is granted to make and distribute verbatim copies of t=
his
=2E\" manual provided the copyright notice and this permission notice a=
re
=2E\" preserved on all copies.
=2E\"
=2E\" Permission is granted to copy and distribute modified versions of
=2E\" this manual under the conditions for verbatim copying, provided t=
hat
=2E\" the entire resulting derived work is distributed under the terms =
of
=2E\" a permission notice identical to this one.
=2E\"
=2E\" Since the Linux kernel and libraries are constantly changing, thi=
s
=2E\" manual page may be incorrect or out-of-date. =A0The author(s) ass=
ume.
=2E\" no responsibility for errors or omissions, or for damages resulti=
ng.
=2E\" from the use of the information contained herein. =A0The author(s=
) may.
=2E\" not have taken the same level of care in the production of this.
=2E\" manual, which is licensed free of charge, as they might when work=
ing.
=2E\" professionally.
=2E\"
=2E\" Formatted or processed versions of this manual, if unaccompanied =
by
=2E\" the source, must acknowledge the copyright and authors of this wo=
rk.
=2E\"
=2E\" Various pieces of text taken from the kernel source and the comme=
ntary
=2E\" in kernel commit fa28237cfcc5827553044cbd6ee52e33692b0faa
=2E\" both written by Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
=2E\"
=2ETH SUBPAGE_PROT 2 2010-10-09 "Linux" "Linux Programmer's Manual"
=2ESH NAME
subpage_prot \- copy a subpage protection map into the kernel
=2ESH SYNOPSIS
=2Enf
=2EBI "long subpage_prot(unsigned long " addr ", unsigned long " len ,
=2EBI " =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0uint32_t *" map ");
=2Efi
=2ESH DESCRIPTION
The PowerPC-specific
=2EBR subpage_prot ()
system call provides the facility to control the access
permissions on individual 4kB subpages on systems configured with
a page size of 64kB.

The protection map is applied to the memory pages in the region startin=
g at
=2EI addr
and continuing for
=2EI len
bytes.
Both of these arguments must be aligned to a 64-kB boundary.

The protection map is specified in the buffer pointed to by
=2EIR map .
The map has 2 bits per 4kB subpage;
thus each 32-bit word specifies the protections of 16 4kB subpages
inside a 64kB page
(so, the number of 32-bit words pointed to by
=2EI map
should equate to the number of 64-kB pages specified by
=2EIR len ).
Each 2-bit field in the protection map is either 0 to allow any access,
1 to prevent writes, or 2 or 3 to prevent all accesses.
=2ESH RETURN VALUE
On success,
=2EBR subpage_prot ()
returns 0.
Otherwise, one of the negated =A0error codes specified below is returne=
d.
=2ESH ERRORS
=2ETP
=2EB EINVAL
The
=2EI addr
or
=2EI len
arguments are incorrect.
Both of these arguments must be aligned to a multiple of the system pag=
e size,
and they must not refer to a region outside of the
address space of the process or to a region that consists of huge pages=
=2E
=2ETP
=2EB EFAULT
The buffer referred to by
=2EI map
is not accessible.
=2ETP
=2EB ENOMEM
Out of memory.
=2ESH VERSIONS
This system call is provided on the PowerPC architecture
since Linux 2.6.25.
The system call is provided only if the kernel is configured with
=2EBR CONFIG_PPC_64K_PAGES .
No library support is provided.
=2ESH CONFORMING TO
This system call is Linux-specific.
=2ESH NOTES
Normal page protections (at the 64-kB page level) also apply;
the subpage protection mechanism is an additional constraint,
so putting 0 in a 2-bit field won't allow writes to a page that is othe=
rwise
write-protected.
=2ESS Rationale
This system call is provided to assist writing emulators that
operate using 64-kB pages on PowerPC systems.
When emulating systems such as x86, which uses a smaller page size,
the emulator can no longer use the memory-management unit (MMU)
and normal system calls for controlling page protections.
(The emulator could emulate the MMU by checking and possibly remapping
the address for each memory access in software, but that is slow.)
The idea is that the emulator supplies an array of protection masks
to apply to a specified range of virtual addresses.
These masks are applied at the level where hardware page-table entries =
(PTEs)
are inserted into the hardware page table based on the Linux PTEs,
so the Linux PTEs are not affected.
=2E\" Perhaps we don't need to document this implementation detail:
=2E\"
=2E\" Implicit in this is that the regions of the address space that ar=
e
=2E\" protected are switched to use 4k hardware pages rather than 64k
=2E\" hardware pages (on machines with hardware 64k page support).
=2E\" In fact the whole process is switched to use 4k hardware pages wh=
en the
=2E\" subpage_prot system call is used, but this could be improved in f=
uture
=2E\" to switch only the affected segments.
=2ESH SEE ALSO
=2EBR mprotect (2),
=2EBR syscall (2);
=2Ebr
the kernel source file
=2EIR Documentation/vm/hugetlbpage.txt .


--
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
