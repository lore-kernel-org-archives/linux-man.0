From: Johan Erlandsson <jeoerl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] syscall.2: correct registers for arm/EABI
Date: Fri, 9 Aug 2013 01:59:52 +0200
Message-ID: <CALiXj0DSRYwxa07h3uOgk7FB8BssaWmwWmnzLYwUvtaNqSgpsg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Registers was off by one.

Reference:
http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=3105/4
---
 man2/syscall.2 |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/syscall.2 b/man2/syscall.2
index 1cca9ce..a4a243d 100644
--- a/man2/syscall.2
+++ b/man2/syscall.2
@@ -156,7 +156,7 @@ l l1 l l1 l.
 arch/ABI       instruction     syscall #       retval  Notes
 _
 arm/OABI       swi NR  -       a1      NR is syscall #
-arm/EABI       swi 0x0 r7      r1
+arm/EABI       swi 0x0 r7      r0
 blackfin       excpt 0x0       P0      R0
 i386   int $0x80       eax     eax
 ia64   break 0x100000  r15     r10/r8
@@ -181,7 +181,7 @@ l l l l l l l l.
 arch/ABI       arg1    arg2    arg3    arg4    arg5    arg6    arg7
 _
 arm/OABI       a1      a2      a3      a4      v1      v2      v3
-arm/EABI       r1      r2      r3      r4      r5      r6      r7
+arm/EABI       r0      r1      r2      r3      r4      r5      r6
 blackfin       R0      R1      R2      R3      R4      R5      -
 i386   ebx     ecx     edx     esi     edi     ebp     -
 ia64   r11     r9      r10     r14     r15     r13     -
-- 
1.7.9.5
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
