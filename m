From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] syscall(2): fix ia64 registers
Date: Sat, 28 Dec 2013 08:29:27 -0500
Message-ID: <1388237367-12871-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The original list of registers was created by confusing strace source
code -- this is for parsing legacy 32bit code (which is dead and no one
cares).  Update the list to reflect native ia64 syscall interface.

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man2/syscall.2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/syscall.2 b/man2/syscall.2
index de96c94..e712b41 100644
--- a/man2/syscall.2
+++ b/man2/syscall.2
@@ -159,7 +159,7 @@ arm/OABI	swi NR	-	a1	NR is syscall #
 arm/EABI	swi 0x0	r7	r0
 blackfin	excpt 0x0	P0	R0
 i386	int $0x80	eax	eax
-ia64	break 0x100000	r15	r10/r8
+ia64	break 0x100000	r15	r10/r8	bool error/errno value
 parisc	ble 0x100(%sr2, %r0)	r20	r28
 s390	svc 0	r1	r2	NR may be passed directly with
 s390x	svc 0	r1	r2	"svc NR" if NR is less than 256
@@ -184,7 +184,7 @@ arm/OABI	a1	a2	a3	a4	v1	v2	v3
 arm/EABI	r0	r1	r2	r3	r4	r5	r6
 blackfin	R0	R1	R2	R3	R4	R5	-
 i386	ebx	ecx	edx	esi	edi	ebp	-
-ia64	r11	r9	r10	r14	r15	r13	-
+ia64	out0	out1	out2	out3	out4	out5	-
 parisc	r26	r25	r24	r23	r22	r21	-
 s390	r2	r3	r4	r5	r6	r7	-
 s390x	r2	r3	r4	r5	r6	r7	-
-- 
1.8.4.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
