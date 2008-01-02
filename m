From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: arch_prctl.2 changes
Date: Wed, 02 Jan 2008 10:54:11 +0100
Message-ID: <477B5F43.3070009@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Kleen <ak-l3A5Bk7waGM@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Andi,

I noticed some apparent inconsistencies in the arch_prctl.2 page
(http://www.kernel.org/doc/man-pages/online/pages/man2/arch_prctl.2.html ).
 The main issue is that 'addr' is interpreted as an unsigned long or as an
unsigned long *, depending on code.  (right?)

For man-pages-2.75, I have applied the following patch, which also updates
a few other minor points.  Does this look okay to you?

Cheers,

Michael

===================================================================
--- arch_prctl.2        (revision 3423)
+++ arch_prctl.2        (working copy)
@@ -21,24 +21,33 @@
 .\"
 .\" Formatted or processed versions of this manual, if unaccompanied by
 .\" the source, must acknowledge the copyright and authors of this work.
-.TH ARCH_PRCTL 2 2003-02-02 "Linux" "Linux Programmer's Manual"
+.TH ARCH_PRCTL 2 2007-12-26 "Linux" "Linux Programmer's Manual"
 .SH NAME
-arch_prctl \- set architecture specific thread state
+arch_prctl \- set architecture-specific thread state
 .SH SYNOPSIS
+.nf
 .B #include <asm/prctl.h>
 .br
 .B #include <sys/prctl.h>
 .sp
 .BI "int arch_prctl(int " code ", unsigned long " addr );
+.BI "int arch_prctl(int " code ", unsigned long *" addr );
+.fi
 .SH DESCRIPTION
 The
 .BR arch_prctl ()
-function sets architecture specific process or thread state.
+function sets architecture-specific process or thread state.
 .I code
 selects a subfunction
 and passes argument
 .I addr
-to it.
+to it;
+.I addr
+is interpreted as either an
+.I "unsigned long"
+for the "set" operations, or as an
+.IR "unsigned long *" ,
+for the "get" operations.
 .LP
 Sub functions for x86-64 are:
 .TP
@@ -53,9 +62,8 @@
 .I FS
 register of the current thread in the
 .I unsigned long
-pointed to by the
-.I address
-parameter.
+pointed to
+.IR addr .
 .TP
 .B ARCH_SET_GS
 Set the 64-bit base for the
@@ -68,11 +76,10 @@
 .I GS
 register of the current thread in the
 .I unsigned long
-pointed to by the
-.I address
-parameter.
+pointed to
+.IR addr .
 .SH RETURN VALUE
-On sucess,
+On success,
 .BR arch_prctl ()
 returns 0; on error, \-1 is returned, and
 .I errno
@@ -111,7 +118,7 @@
 .BR modify_ldt (2)
 or using the
 .BR set_thread_area (2)
-system call in a 2.5 kernel.
+system call in kernel 2.5 or later.
 .BR arch_prctl ()
 is only needed when you want to set bases that are larger than 4GB.
 Memory in the first 2GB of address space can be allocated by using
@@ -120,7 +127,7 @@
 .B MAP_32BIT
 flag.

-As of version 2.3.5, glibc provides no prototype for
+As of version 2.7, glibc provides no prototype for
 .BR arch_prctl ().
 You have to declare it yourself for now.
 This may be fixed in future glibc versions.


-
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
