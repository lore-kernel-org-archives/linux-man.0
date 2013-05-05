From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] syscall(2): document s390/s390x calling convention
Date: Sun,  5 May 2013 17:01:50 -0400
Message-ID: <1367787710-15455-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man2/syscall.2 | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/man2/syscall.2 b/man2/syscall.2
index 69faf3e..219dd09 100644
--- a/man2/syscall.2
+++ b/man2/syscall.2
@@ -161,8 +161,10 @@ blackfin	excpt 0x0	P0	R0
 i386	int $0x80	eax	eax
 ia64	break 0x100000	r15	r10/r8
 parisc	ble 0x100(%sr2, %r0)	r20	r28
+s390	svc 0	r1	r2	NR may be passed directly with
+s390x	svc 0	r1	r2	"svc NR" if NR is less than 256
 sparc/32	t 0x10	g1	o0
-sparc/64	t 0x6d	g1	o0	
+sparc/64	t 0x6d	g1	o0
 x86_64	syscall	rax	rax
 .TE
 .if t \{\
@@ -184,6 +186,8 @@ blackfin	R0	R1	R2	R3	R4	R5	-
 i386	ebx	ecx	edx	esi	edi	ebp	-
 ia64	r11	r9	r10	r14	r15	r13	-
 parisc	r26	r25	r24	r23	r22	r21	-
+s390	r2	r3	r4	r5	r6	r7	-
+s390x	r2	r3	r4	r5	r6	r7	-
 sparc/32	o0	o1	o2	o3	o4	o5	-
 sparc/64	o0	o1	o2	o3	o4	o5	-
 x86_64	rdi	rsi	rdx	r10	r8	r9	-
-- 
1.8.2.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
