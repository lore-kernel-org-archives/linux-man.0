From: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Subject: [PATCH] [2/3] Add missing migrate_pages manpage
Date: Fri,  6 Nov 2009 18:52:12 +0100 (CET)
Message-ID: <20091106175212.4368EB1627@basil.firstfloor.org>
References: <20091106652.255147301@firstfloor.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20091106652.255147301-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: cl-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Based on the move_pages manpage.
Also some minor improvements to move_pages.

Cc: cl-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org

diff -u man2/migrate_pages.2-o man2/migrate_pages.2
--- man2/migrate_pages.2-o	2009-11-06 18:06:33.000000000 +0100
+++ man2/migrate_pages.2	2009-11-06 18:34:09.000000000 +0100
@@ -0,0 +1,130 @@
+.\" Hey Emacs! This file is -*- nroff -*- source.
+.\"
+.\" Copyright 2009 Intel Coporation
+.\"                Author: Andi Kleen
+.\" Based on the move_pages manpage which was
+.\" This manpage is Copyright (C) 2006 Silicon Graphics, Inc.
+.\"                               Christoph Lameter
+.\"
+.\" Permission is granted to make and distribute verbatim copies of this
+.\" manual provided the copyright notice and this permission notice are
+.\" preserved on all copies.
+.\"
+.\" Permission is granted to copy and distribute modified versions of this
+.\" manual under the conditions for verbatim copying, provided that the
+.\" entire resulting derived work is distributed under the terms of a
+.\" permission notice identical to this one.
+.TH MIGRATE_PAGES 2 2009-11-01 "Linux" "Linux Programmer's Manual"
+.SH NAME
+migrate_pages \- move all pages in a process to another set of nodes
+.SH SYNOPSIS
+.nf
+.B #include <numaif.h>
+.sp
+.BI "long migrate_pages(int " pid ", unsigned long " maxnode", 
+.BI "                   const unsigned long * " old_nodes,
+.BI "                   const unsigned long * " new_nodes);
+.fi
+.sp
+Link with \fI\-lnuma\fP.
+.SH DESCRIPTION
+.BR migrate_pages ()
+moves all pages of the process
+.I pid
+that are in memory nodes
+.I old_nodes
+to
+.I new_nodes.
+Pages not placed in any node in
+.I old_nodes
+will not be migrated.
+The kernel keeps the relative topology relationship inside 
+.I old_nodes
+in 
+.I new_nodes
+as far as possible.
+
+.I old_nodes
+and
+.I new_nodes
+are pointers to bitmasks of node numbers, rounded to unsigned longs, with upto 
+.I maxnode
+bits.
+.I maxnode
+is the maximum node number in the bitmask plus one (this is the same 
+as in 
+.I mbind (2),
+but different from
+.I select (2))
+
+.I pid
+is the ID of the process in which pages are to be moved.
+To move pages in another process,
+the caller must be privileged
+.RB ( CAP_SYS_NICE )
+or the real or effective user ID of the calling process must match the
+real or saved-set user ID of the target process.
+If
+.I pid
+is 0 then
+.BR migrate_pages ()
+moves pages of the calling process.
+
+Pages shared with another process will only be moved if the initiating
+process has the
+.RB CAP_SYS_NICE
+privilege.
+.SH "RETURN VALUE"
+On success
+.BR migrate_pages ()
+returns zero.
+On error, it returns \-1, and sets
+.I errno
+to indicate the error.
+.\" .SH ERRORS
+.\" FIXME write me
+.SH VERSIONS
+.BR migrate_pages ()
+first appeared on Linux in version 2.6.16.
+.SH CONFORMING TO
+This system call is Linux-specific.
+.SH "NOTES"
+For information on library support, see
+.BR numa (7).
+
+Use
+.BR get_mempolicy (2)
+with the
+.B MPOL_F_MEMS_ALLOWED
+flag to obtain the set of nodes that are allowed by
+.\" FIXME Clarify "current cpuset".  Is that the cpuset of the caller
+.\" or the target?
+the current cpuset.
+Note that this information is subject to change at any
+time by manual or automatic reconfiguration of the cpuset.
+
+Use of this function may result in pages whose location
+(node) violates the memory policy established for the
+specified addresses (See
+.BR mbind (2)]
+and/or the specified process [See
+.BR set_mempolicy (2)).
+That is, memory policy does not constrain the destination
+nodes used by
+.BR migrate_pages ().
+
+The
+.I numaif.h
+header is not included with glibc, but requires installing
+.I libnuma-devel
+or a similar package.
+.SH "SEE ALSO"
+.BR get_mempolicy (2),
+.BR mbind (2),
+.BR set_mempolicy (2),
+.BR numa (3),
+.BR numa_maps (5),
+.BR cpuset (7),
+.BR numa (7),
+.BR migratepages (8),
+.BR numa_stat (8)
diff -u man2/move_pages.2-o man2/move_pages.2
--- man2/move_pages.2-o	2009-11-06 18:13:47.000000000 +0100
+++ man2/move_pages.2	2009-11-06 18:30:03.000000000 +0100
@@ -25,6 +25,8 @@
 .BI "long move_pages(int " pid ", unsigned long count, void **" pages ,
 .BI "                const int *" nodes ", int *" status ", int " flags );
 .fi
+.sp
+Link with \fI\-lnuma\fP.
 .SH DESCRIPTION
 .BR move_pages ()
 moves the specified
@@ -214,6 +216,12 @@
 That is, memory policy does not constrain the destination
 nodes used by
 .BR move_pages ().
+
+The
+.I numaif.h
+header is not included with glibc, but requires installing
+.I libnuma-devel
+or a similar package.
 .SH "SEE ALSO"
 .BR get_mempolicy (2),
 .BR mbind (2),
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
