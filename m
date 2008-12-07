From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: [PATCH] ld.so.8: Document LD_AUDIT and LD_POINTER_GUARD
Date: Sun, 7 Dec 2008 19:28:28 +0100
Message-ID: <20081207182828.GM10491@machine.or.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

I was using existing comments, mailing list posts, and mainly the glibc
source code as a reference. I'm not sure if LD_AUDIT is 100% compatible
with Solaris but aside of the header names, it appears to be, based on
quick comparison.

Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>

diff --git a/man8/ld.so.8 b/man8/ld.so.8
index 6ca9a8c..69827f9 100644
--- a/man8/ld.so.8
+++ b/man8/ld.so.8
@@ -1,5 +1,9 @@
 .\" This is in the public domain
-.TH LD.SO 8 2008-10-27 "GNU" "Linux Programmer's Manual"
+.\"
+.\" 2008-12-07 Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
+.\"    Document LD_AUDIT and LD_POINTER_GUARD
+.\"
+.TH LD.SO 8 2008-12-07 "GNU" "Linux Programmer's Manual"
 .SH NAME
 ld.so, ld-linux.so* \- dynamic linker/loader
 .SH SYNOPSIS
@@ -177,13 +181,25 @@ Version of
 for a.out binaries only.
 Old versions of ld\-linux.so.1 also supported
 .BR LD_ELF_PRELOAD .
-.\" FIXME
-.\" Document LD_AUDIT ("Install audit libraries for glibc")
-.\" new in glibc 2.4
-.\" ignored in set-user-ID and set-group-ID programs
-.\"
-.\" For some info, see Solaris Linker and Libraries Guide,
-.\" "Runtime Linker Auditing Interface"
+.TP
+.B LD_AUDIT
+(glibc since 2.4)
+A colon-separated list of additional, user-specified, ELF shared libraries
+to be loaded before all others in a separate linker namespace.
+.B LD_AUDIT
+is ignored for set-user-ID/set-group-ID binaries.
+
+The dynamic linker will notify the audit
+libraries at so-called auditing checkpoints, like loading a new library,
+resolving a symbol or calling a symbol from another shared object, by
+calling an appropriate function within the audit library (the functions
+start all with an
+.B la_
+prefix and are prototyped in
+.BR "<link.h> " and " <bits/link.h>").
+The auditing interface is compatible with Solaris as described in its
+.IR "Linker and Libraries Guide" ,
+chapter Runtime Linker Auditing Interface.
 .TP
 .B LD_BIND_NOT
 (glibc since 2.1.95)
@@ -240,18 +256,18 @@ For security reasons, since glibc 2.4,
 is ignored for set-user-ID/set-group-ID binaries.
 .\" Only used if $ORIGIN can't be determined by normal means
 .\" (from the origin path saved at load time, or from /proc/self/exe)?
-.\"
-.\" FIXME
-.\" Document LD_POINTER_GUARD
-.\" Since glibc 2.4
-.\" Set to 0 to disable pointer guarding
-.\" Any other value enables pointer guarding, which is also the default.
-.\" Pointer guarding is a security mechanism(?) to minimize the
-.\" the risk of having usable pointer in the event of a buffer overrun
-.\" or stack smashing attack(?).
-.\" http://article.gmane.org/gmane.comp.gdb.patches/41147/match=ld_pointer_guard
-.\" http://sourceware.org/ml/gdb-patches/2008-04/msg00252.html
-.\" http://www.cygwin.com/ml/libc-alpha/2006-01/msg00011.html
+.TP
+.B LD_POINTER_GUARD
+(glibc since 2.4)
+Set to 0 to disable pointer guarding.
+Any other value enables pointer guarding, which is also the default.
+Pointer guarding is a security mechanism where some pointers to code
+stored in writable program memory (return address saved by
+.BR setjmp (3)
+or function pointers used by various glibc internals) are mangled
+semi-randomly to make it more difficult for an attacker to hijack
+these to their own code in the event of a buffer overrun or stack
+smashing attack.
 .TP
 .B LD_PROFILE
 (glibc since 2.1)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
