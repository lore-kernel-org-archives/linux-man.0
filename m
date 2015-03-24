From: Jann Horn <jann@thejh.net>
Subject: [PATCH v2 2/2] syscall.2: add x32 ABI
Date: Tue, 24 Mar 2015 19:40:43 +0100
Message-ID: <20150324184043.GC5677@pc.thejh.net>
References: <20150316180154.GA10663@pc.thejh.net>
 <CAGXu5j+mjC4HQWbJVSDb+gSTud=R1+UCBJBY8ysQuj9NETrSEQ@mail.gmail.com>
 <20150316233457.GA9227@pc.thejh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150316233457.GA9227@pc.thejh.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>
Cc: Michael Kerrisk <mtk.manpages@gmail.com>, linux-man <linux-man@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, "H. Peter Anvin" <hpa@zytor.com>
List-Id: linux-man@vger.kernel.org

[added H. Peter Anvin to CC for this patch because he
seems to have contributed large parts of the X32 code]

---
 man2/syscall.2 | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/man2/syscall.2 b/man2/syscall.2
index ef8f3cf..1f25255 100644
--- a/man2/syscall.2
+++ b/man2/syscall.2
@@ -170,12 +170,18 @@ s390	svc 0	r1	r2	See below
 s390x	svc 0	r1	r2	See below
 sparc/32	t 0x10	g1	o0
 sparc/64	t 0x6d	g1	o0
-x86_64	syscall	rax	rax
+x86_64	syscall	rax	rax	See below
+x32	syscall	rax	rax	See below
 .TE
 .PP
 For s390 and s390x, NR (the system call number)
 may be passed directly with "svc NR" if it is less than 256.
 
+The x32 ABI uses the same instruction as the x86_64 ABI and is used on
+the same processors. To differentiate between them, the bitmask
+.I __X32_SYSCALL_BIT
+is bitwise-ORed into the syscall number for syscalls under the x32 ABI.
+
 On a few architectures,
 a register is used to indicate simple boolean failure of the system call:
 ia64 uses
@@ -210,6 +216,7 @@ s390x       r2    r3    r4    r5    r6    r7    -
 sparc/32    o0    o1    o2    o3    o4    o5    -
 sparc/64    o0    o1    o2    o3    o4    o5    -
 x86_64      rdi   rsi   rdx   r10   r8    r9    -
+x32         rdi   rsi   rdx   r10   r8    r9    -
 .TE
 .PP
 The mips/o32 system call convention passes
-- 
2.1.4
