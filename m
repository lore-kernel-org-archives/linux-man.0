From: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] syscall.2: add arm64 and mips
Date: Sat, 17 Jan 2015 23:22:04 -0800
Message-ID: <20150118072204.GA12237@www.outflux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Added mips to tables. Extra column added for boolean error register, since
both ia64 and mips use this convention. Added explicit non-register argument
passing note for mips/o32.

Added arm64 to tables.

Signed-off-by: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 man2/syscall.2 | 47 +++++++++++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/man2/syscall.2 b/man2/syscall.2
index 3e76e56..05bf042 100644
--- a/man2/syscall.2
+++ b/man2/syscall.2
@@ -36,6 +36,8 @@
 .\"
 .\" 2002-03-20  Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
 .\"	- adopted for Linux
+.\" 2015-01-17, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
+.\"	Added mips and arm64.
 .\"
 .TH SYSCALL 2 2014-12-31 "Linux" "Linux Programmer's Manual"
 .SH NAME
@@ -148,29 +150,29 @@ The first table lists the instruction used to transition to kernel mode,
 so you might have to refer to
 .BR vdso (7)),
 the register used to indicate the system call number,
-and the register used to return the system call result.
+the register used to return the system call result,
+and the register used to indicate simple boolean failure of
+the system call.
 .if t \{\
 .ft CW
 \}
 .TS
-l l1 l l1 l.
-arch/ABI	instruction	syscall #	retval	Notes
+l l l l l l.
+arch/ABI	instruction	syscall #	retval	bool error	Notes
 _
-arm/OABI	swi NR	-	a1	NR is syscall #
-arm/EABI	swi 0x0	r7	r0
-blackfin	excpt 0x0	P0	R0
-i386	int $0x80	eax	eax
-ia64	break 0x100000	r15	r10/r8	T{
-bool error/
-.br
-errno value
-T}
-parisc	ble 0x100(%sr2, %r0)	r20	r28
-s390	svc 0	r1	r2	See below
-s390x	svc 0	r1	r2	See below
-sparc/32	t 0x10	g1	o0
-sparc/64	t 0x6d	g1	o0
-x86_64	syscall	rax	rax
+arm/OABI	swi NR	-	a1	-	NR is syscall #
+arm/EABI	swi 0x0	r7	r0	-
+arm64	svc #0	x8	x0	-
+blackfin	excpt 0x0	P0	R0	-
+i386	int $0x80	eax	eax	-
+ia64	break 0x100000	r15	r8	r10
+mips	syscall	v0	v0	a3
+parisc	ble 0x100(%sr2, %r0)	r20	r28	-
+s390	svc 0	r1	r2	-	See below
+s390x	svc 0	r1	r2	-	See below
+sparc/32	t 0x10	g1	o0	-
+sparc/64	t 0x6d	g1	o0	-
+x86_64	syscall	rax	rax	-
 .TE
 .PP
 For s390 and s390x, NR (the system call number)
@@ -185,14 +187,17 @@ The second table shows the registers used to pass the system call arguments.
 .ft CW
 \}
 .TS
-l l l l l l l l.
-arch/ABI	arg1	arg2	arg3	arg4	arg5	arg6	arg7
+l l l l l l l l l.
+arch/ABI	arg1	arg2	arg3	arg4	arg5	arg6	arg7	Notes
 _
 arm/OABI	a1	a2	a3	a4	v1	v2	v3
 arm/EABI	r0	r1	r2	r3	r4	r5	r6
+arm64	x0	x1	x2	x3	x4	x5	-
 blackfin	R0	R1	R2	R3	R4	R5	-
 i386	ebx	ecx	edx	esi	edi	ebp	-
 ia64	out0	out1	out2	out3	out4	out5	-
+mips/o32	a0	a1	a2	a3	-	-	-	See below
+mips/n32,64	a0	a1	a2	a3	a4	a5	-
 parisc	r26	r25	r24	r23	r22	r21	-
 s390	r2	r3	r4	r5	r6	r7	-
 s390x	r2	r3	r4	r5	r6	r7	-
@@ -200,6 +205,8 @@ sparc/32	o0	o1	o2	o3	o4	o5	-
 sparc/64	o0	o1	o2	o3	o4	o5	-
 x86_64	rdi	rsi	rdx	r10	r8	r9	-
 .TE
+.PP
+The mips/o32 syscall convention passes arguments 5 through 8 on the user stack.
 .if t \{\
 .in
 .ft P
-- 
1.9.1


-- 
Kees Cook
Chrome OS Security
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
