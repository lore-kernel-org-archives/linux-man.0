From: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Subject: Re: [patch] removing EINVAL error from cacheflush() man page
Date: Thu, 7 May 2009 12:08:45 +0100
Message-ID: <20090507110845.GA7567@linux-mips.org>
References: <9debc4410905070240w63b20e9q35e5e6d5f9c3f6e4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9debc4410905070240w63b20e9q35e5e6d5f9c3f6e4-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxin John <maxin.john-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, May 07, 2009 at 03:10:19PM +0530, Maxin John wrote:

The man page indeed deserved some polishing 15 years after I wrote it.
Guess I have to thank Maxin for kicking me to finally do that :-)

Unlike to his patch I've chosen to document the actual behaviour in the
BUGS section and elaborated on the history of the call on MIPS and
differences on other architectures.  In this context I found it preferable
to not delete the section about error returns for invalid cache args.

  Ralf

--- cacheflush.2.orig	2009-05-07 11:12:34.000000000 +0100
+++ cacheflush.2	2009-05-07 11:49:34.000000000 +0100
@@ -1,5 +1,6 @@
-.\" Written by Ralf Baechle (ralf-NfzSNkFSoiNlEiWPh9xO2Q@public.gmane.org),
+.\" Written by Ralf Baechle (ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org),
 .\" Copyright (c) 1994, 1995 Waldorf GMBH
+.\" Copyright (c) 2009 Wind River Systems
 .\"
 .\" This is free documentation; you can redistribute it and/or
 .\" modify it under the terms of the GNU General Public License as
@@ -21,7 +22,7 @@
 .\" Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111,
 .\" USA.
 .\"
-.TH CACHEFLUSH 2 2007-05-26 "Linux" "Linux Programmer's Manual"
+.TH CACHEFLUSH 2 2009-05-07 "Linux" "Linux Programmer's Manual"
 .SH NAME
 cacheflush \- flush contents of instruction and/or data cache
 .SH SYNOPSIS
@@ -73,18 +74,35 @@
 .BR BCACHE .
 .SH CONFORMING TO
 This Linux-specific system call is only available on MIPS based systems.
-.\" FIXME This system call was only on MIPS back in 1.2 days, but
-.\" by now it is on a number of other architectures (but not i386).
-.\" Investigate the details and update this page.
-It should not be used in programs intended to be portable.
+Historically the system calls was available on all MIPS UNIX variants
+including RISC/os, IRIX, Ultrix, NetBSD, OpenBSD and FreeBSD as well as
+some non-UNIX MIPS operating systems have implemented
+.BR cacheflush ()
+that the existence of this call in MIPS operating systems is a de-facto
+standard.
+.SH CAVEAT
+.BR cacheflush ()
+should not be used in programs intended to be portable.
+Linux on several other architectures does support a
+.BR cacheflush ()
+systems call but with different arguments.
 .\" Irix 6.5 appears to have a cacheflush() syscall -- mtk
 .SH BUGS
-The current implementation ignores the
+Kernels older than 2.6.11 ignores the
 .I addr
 and
 .I nbytes
 arguments.
-Therefore, the whole cache is always flushed.
+Therefore, the whole cache is always flushed making this function fairly
+expensive.
+
+This function is always behaving as if
+.BR BCACHE
+has been passed for the
+.I cache
+argument and does not do any error checking on the
+.I cache
+argument.
 .SH COLOPHON
 This page is part of release 3.09 of the Linux
 .I man-pages
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
