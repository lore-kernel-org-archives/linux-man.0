From: Kyle Huey <me-OhBmq/TcCDJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] arch_prctl.2: Note new support on x86-32, ARCH_[GET|SET]_CPUID.
Date: Wed, 24 May 2017 10:22:03 -0700
Message-ID: <20170524172203.30545-1-khuey@kylehuey.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Kyle Huey <khuey-OhBmq/TcCDJWk0Htik3J/w@public.gmane.org>
---
 man2/arch_prctl.2 | 78 +++++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 56 insertions(+), 22 deletions(-)

diff --git a/man2/arch_prctl.2 b/man2/arch_prctl.2
index 678aada19..6c1d6f606 100644
--- a/man2/arch_prctl.2
+++ b/man2/arch_prctl.2
@@ -24,31 +24,52 @@
 .\"
 .TH ARCH_PRCTL 2 2016-10-08 "Linux" "Linux Programmer's Manual"
 .SH NAME
-arch_prctl \- set architecture-specific thread state
+arch_prctl \- set architecture-specific process or thread state
 .SH SYNOPSIS
 .nf
 .B #include <asm/prctl.h>
 .br
 .B #include <sys/prctl.h>
 .sp
-.BI "int arch_prctl(int " code ", unsigned long " addr );
-.BI "int arch_prctl(int " code ", unsigned long *" addr );
+.BI "int arch_prctl(int " option ", unsigned long " arg2 );
+.BI "int arch_prctl(int " option ", unsigned long *" arg2 );
 .fi
 .SH DESCRIPTION
 The
 .BR arch_prctl ()
 function sets architecture-specific process or thread state.
-.I code
+.I option
 selects a subfunction
 and passes argument
-.I addr
+.I arg2
 to it;
-.I addr
-is interpreted as either an
-.I "unsigned long"
-for the "set" operations, or as an
-.IR "unsigned long\ *" ,
-for the "get" operations.
+The interpretation of 
+.I arg2
+depends on which subfunction is invoked.
+.LP
+Subfunctions for both x86-64 and x86-32 are:
+.TP
+.B ARCH_GET_CPUID " (since Linux 4.12)"
+Return the state of the flag determining whether the
+.I cpuid
+instruction can be executed by the process.
+.IR arg2
+is ignored.
+.TP
+.B ARCH_SET_CPUID " (since Linux 4.12)"
+Set the state of the flag determining whether the
+.i cpuid
+instruction can be executed by the process.
+.IR arg2
+is interpreted as a boolean. This flag defaults to true (i.e.
+.i cpuid
+enabled). Pass 0 to disable the
+.I cpuid
+instruction or 1 to reenable it. If the value of the flag is 0 attempting to execute the
+.I cpuid
+instruction will generate a
+.B SIGSEGV.
+This flag is propagated across fork but reset on exec.
 .LP
 Subfunctions for x86-64 are:
 .TP
@@ -56,7 +77,7 @@ Subfunctions for x86-64 are:
 Set the 64-bit base for the
 .I FS
 register to
-.IR addr .
+.IR arg2 .
 .TP
 .B ARCH_GET_FS
 Return the 64-bit base value for the
@@ -64,13 +85,13 @@ Return the 64-bit base value for the
 register of the current thread in the
 .I unsigned long
 pointed to by
-.IR addr .
+.IR arg2 .
 .TP
 .B ARCH_SET_GS
 Set the 64-bit base for the
 .I GS
 register to
-.IR addr .
+.IR arg2 .
 .TP
 .B ARCH_GET_GS
 Return the 64-bit base value for the
@@ -78,35 +99,48 @@ Return the 64-bit base value for the
 register of the current thread in the
 .I unsigned long
 pointed to by
-.IR addr .
+.IR arg2 .
 .SH RETURN VALUE
 On success,
-.BR arch_prctl ()
-returns 0; on error, \-1 is returned, and
+.BR ARCH_GET_CPUID
+returns a non-negative value indicating the state of the
+.I cpuid
+enabled flag. All other
+.I option
+values return 0 on success.
+On error, \-1 is returned, and
 .I errno
 is set to indicate the error.
 .SH ERRORS
 .TP
 .B EFAULT
-.I addr
+.I arg2
 points to an unmapped address or is outside the process address space.
 .TP
 .B EINVAL
-.I code
+.I option
 is not a valid subcommand.
 .TP
+.B ENODEV
+.I option
+is
+.B ARCH_SET_CPUID
+and
+.I cpuid
+faulting is not supported on this machine.
+.TP
 .B EPERM
-.I addr
+.I arg2
 is outside the process address space.
 .\" .SH AUTHOR
 .\" Man page written by Andi Kleen.
 .SH CONFORMING TO
 .BR arch_prctl ()
-is a Linux/x86-64 extension and should not be used in programs intended
+is a Linux/x86 extension and should not be used in programs intended
 to be portable.
 .SH NOTES
 .BR arch_prctl ()
-is supported only on Linux/x86-64 for 64-bit programs currently.
+is supported only on Linux/x86 currently.
 
 The 64-bit base changes when a new 32-bit segment selector is loaded.
 
-- 
2.13.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
