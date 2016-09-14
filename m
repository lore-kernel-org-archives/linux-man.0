From: Kyle Huey <me-OhBmq/TcCDJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH (man-pages)] arch_prctl.2: Note new support on x86-32, ARCH_[GET|SET]_CPUID.
Date: Wed, 14 Sep 2016 14:10:09 -0700
Message-ID: <1473887410-18624-1-git-send-email-khuey@kylehuey.com>
References: <1473887291-18384-1-git-send-email-khuey@kylehuey.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473887291-18384-1-git-send-email-khuey-OhBmq/TcCDJWk0Htik3J/w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert O'Callahan <robert-7ok7fSEJICeEi8DpZVb4nw@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>, Andy Lutomirski <luto-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Kyle Huey <khuey-OhBmq/TcCDJWk0Htik3J/w@public.gmane.org>
---
 man2/arch_prctl.2 | 73 +++++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 60 insertions(+), 13 deletions(-)

diff --git a/man2/arch_prctl.2 b/man2/arch_prctl.2
index 989d369..c388797 100644
--- a/man2/arch_prctl.2
+++ b/man2/arch_prctl.2
@@ -22,7 +22,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH ARCH_PRCTL 2 2015-02-21 "Linux" "Linux Programmer's Manual"
+.TH ARCH_PRCTL 2 2016-09-14 "Linux" "Linux Programmer's Manual"
 .SH NAME
 arch_prctl \- set architecture-specific thread state
 .SH SYNOPSIS
@@ -31,8 +31,8 @@ arch_prctl \- set architecture-specific thread state
 .br
 .B #include <sys/prctl.h>
 .sp
-.BI "int arch_prctl(int " code ", unsigned long " addr );
-.BI "int arch_prctl(int " code ", unsigned long *" addr );
+.BI "int arch_prctl(int " code ", unsigned long " arg2 );
+.BI "int arch_prctl(int " code ", unsigned long *" arg2 );
 .fi
 .SH DESCRIPTION
 The
@@ -41,22 +41,47 @@ function sets architecture-specific process or thread state.
 .I code
 selects a subfunction
 and passes argument
-.I addr
+.I arg2
 to it;
-.I addr
+.I arg2
 is interpreted as either an
 .I "unsigned long"
 for the "set" operations, or as an
 .IR "unsigned long\ *" ,
 for the "get" operations.
 .LP
+Subfunctions for both x86-64 and x86-32 are:
+.TP
+.B ARCH_GET_CPUID " (since Linux 4.X)"
+Return the state of the flag determining whether the
+.I cpuid
+instruction can be executed by the process, in the
+.I unsigned long
+pointed to by
+.IR arg2 .
+.TP
+.B ARCH_SET_CPUID " (since Linux 4.X)"
+Set the state of the flag determining whether the
+.I cpuid
+instruction can be executed by the process. Pass
+.B ARCH_CPUID_ENABLE
+in
+.I arg2
+to allow it to be executed, or
+.B ARCH_CPUID_SIGSEGV
+to generate a
+.B SIGSEGV
+when the process tries to execute the
+.I cpuid
+instruction. This flag is propagated across fork and exec.
+.LP
 Subfunctions for x86-64 are:
 .TP
 .B ARCH_SET_FS
 Set the 64-bit base for the
 .I FS
 register to
-.IR addr .
+.IR arg2 .
 .TP
 .B ARCH_GET_FS
 Return the 64-bit base value for the
@@ -64,13 +89,13 @@ Return the 64-bit base value for the
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
@@ -78,7 +103,7 @@ Return the 64-bit base value for the
 register of the current thread in the
 .I unsigned long
 pointed to by
-.IR addr .
+.IR arg2 .
 .SH RETURN VALUE
 On success,
 .BR arch_prctl ()
@@ -87,26 +112,48 @@ returns 0; on error, \-1 is returned, and
 is set to indicate the error.
 .SH ERRORS
 .TP
+.B EACCES
+.I code
+is
+.B ARCH_SET_CPUID
+and
+.I arg2
+is
+.B ARCH_CPUID_ENABLE
+and cpuid was previously disabled with
+.B ARCH_CPUID_SIGSEGV
+and the
+.I no_new_privs
+bit is set on this thread.
+.TP
 .B EFAULT
-.I addr
+.I arg2
 points to an unmapped address or is outside the process address space.
 .TP
 .B EINVAL
 .I code
 is not a valid subcommand.
 .TP
+.B EINVAL
+.I code
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
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
