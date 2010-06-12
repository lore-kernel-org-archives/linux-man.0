From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] [2/4] Add a migrate_pages(2) page
Date: Sat, 12 Jun 2010 17:31:28 +0200
Message-ID: <AANLkTimDkszrFdmzZdG1VMzwHNLzRxqaFsZrMOFJ1z4w@mail.gmail.com>
References: <20100320429.026463287@firstfloor.org> <20100320152929.12751B19E8@basil.firstfloor.org>
	<AANLkTiltMCXRd9jKI5Rd9b6Kt-t_zIHuOtkq0-IMGVyS@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTiltMCXRd9jKI5Rd9b6Kt-t_zIHuOtkq0-IMGVyS-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christoph Lameter <cl-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Andi, (and Christoph),


On Fri, Jun 11, 2010 at 5:38 PM, Michael Kerrisk
<mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> Andi,
>
> On Sat, Mar 20, 2010 at 5:29 PM, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrote:
>>
>> Based on move_pages.
>>
>> Signed-off-by: Andi Kleen <ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>>
>> Index: man-pages-3.24/man2/migrate_pages.2
>
> Thanks for this page!
>
> I made some language edits, and add a couple of errors in the (still
> incomplete) ERRORS section.
>
> Could you please review, to make sure my changes are okay?
>
> Also, if you have any insights on the FIXME related to "current
> cpset", let me know.

I just now noticed Christoph's note to your earlier mail submitting
this page. I've changed as Christoph suggested. Here's the new page
below, if you care to review it.

.\" Hey Emacs! This file is -*- nroff -*- source.
.\"
.\" Copyright 2009 Intel Coporation
.\"                Author: Andi Kleen
.\" Based on the move_pages manpage which was
.\" This manpage is Copyright (C) 2006 Silicon Graphics, Inc.
.\"                               Christoph Lameter
.\"
.\" Permission is granted to make and distribute verbatim copies of this
.\" manual provided the copyright notice and this permission notice are
.\" preserved on all copies.
.\"
.\" Permission is granted to copy and distribute modified versions of this
.\" manual under the conditions for verbatim copying, provided that the
.\" entire resulting derived work is distributed under the terms of a
.\" permission notice identical to this one.
.TH MIGRATE_PAGES 2 2010-06-11 "Linux" "Linux Programmer's Manual"
.SH NAME
migrate_pages \- move all pages in a process to another set of nodes
.SH SYNOPSIS
.nf
.B #include <numaif.h>
.sp
.BI "long migrate_pages(int " pid ", unsigned long " maxnode,
.BI "                   const unsigned long * " old_nodes,
.BI "                   const unsigned long * " new_nodes);
.fi
.sp
Link with \fI\-lnuma\fP.
.SH DESCRIPTION
.BR migrate_pages ()
moves all pages of the process
.I pid
that are in memory nodes
.I old_nodes
to the memory nodes in
.I new_nodes.
Pages not located in any node in
.I old_nodes
will not be migrated.
As far as possible,
the kernel maintains the relative topology relationship inside
.I old_nodes
during the migration to
.IR new_nodes .

The
.I old_nodes
and
.I new_nodes
arguments are pointers to bit masks of node numbers, with up to
.I maxnode
bits in each mask.
These masks are maintained as arrays of unsigned
.I long
integers (in the last
.I long
integer, the bits beyond those specified by
.I maxnode
are ignored).
The
.I maxnode
argument is the maximum node number in the bit mask plus one (this is the same
as in
.BR mbind (2),
but different from
.BR select (2))

The
.I pid
argument is the ID of the process whose pages are to be moved.
To move pages in another process,
the caller must be privileged
.RB ( CAP_SYS_NICE )
or the real or effective user ID of the calling process must match the
real or saved-set user ID of the target process.
If
.I pid
is 0, then
.BR migrate_pages ()
moves pages of the calling process.

Pages shared with another process will only be moved if the initiating
process has the
.B CAP_SYS_NICE
privilege.
.SH "RETURN VALUE"
On success
.BR migrate_pages ()
returns zero.
On error, it returns \-1, and sets
.I errno
to indicate the error.
.SH ERRORS
.TP
.B EPERM
Insufficient privilege
.RB ( CAP_SYS_NICE )
to move pages of the process specified by
.IR pid ,
or insufficient privilege
.RB ( CAP_SYS_NICE )
to access the specified target nodes.
.TP
.B ESRCH
No process matching
.I pid
could be found.
.\" FIXME There are other errors
.SH VERSIONS
The
.BR migrate_pages ()
system call first appeared on Linux in version 2.6.16.
.SH CONFORMING TO
This system call is Linux-specific.
.SH "NOTES"
For information on library support, see
.BR numa (7).

Use
.BR get_mempolicy (2)
with the
.B MPOL_F_MEMS_ALLOWED
flag to obtain the set of nodes that are allowed by
the calling process's cpuset.
Note that this information is subject to change at any
time by manual or automatic reconfiguration of the cpuset.

Use of
.BR migrate_pages ()
may result in pages whose location
(node) violates the memory policy established for the
specified addresses (see
.BR mbind (2))
and/or the specified process (see
.BR set_mempolicy (2)).
That is, memory policy does not constrain the destination
nodes used by
.BR migrate_pages ().

The
.I <numaif.h>
header is not included with glibc, but requires installing
.I libnuma-devel
or a similar package.
.SH "SEE ALSO"
.BR get_mempolicy (2),
.BR mbind (2),
.BR set_mempolicy (2),
.BR numa (3),
.BR numa_maps (5),
.BR cpuset (7),
.BR numa (7),
.BR migratepages (8),
.BR numa_stat (8)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
