From: Jann Horn <jann@thejh.net>
Subject: [PATCH] seccomp.2: Explain arch checking, value (non-)truncation,
 expand example
Date: Mon, 16 Mar 2015 19:01:54 +0100
Message-ID: <20150316180154.GA10663@pc.thejh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Kerrisk <mtk.manpages@gmail.com>
Cc: linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>
List-Id: linux-man@vger.kernel.org

Document some more-or-less surprising things about seccomp.
I'm not sure whether changing the example code like that is a
good idea - maybe that part of the patch should be left out?

Demo code for the X32 issue:
https://gist.github.com/thejh/c5b670a816bbb9791a6d

Demo code for full 64bit registers being visible in seccomp
if the i386 ABI is used on a 64bit system:
https://gist.github.com/thejh/c37b27aefc44ab775db5

---
 man2/seccomp.2 | 72 +++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 66 insertions(+), 6 deletions(-)

diff --git a/man2/seccomp.2 b/man2/seccomp.2
index 702ceb8..307a408 100644
--- a/man2/seccomp.2
+++ b/man2/seccomp.2
@@ -223,6 +223,47 @@ struct seccomp_data {
 .fi
 .in
 
+Because the numbers of system calls vary between architectures and
+some architectures (e.g. X86-64) allow user-space code to use
+the calling conventions of multiple architectures, it is usually
+necessary to verify the value of the
+.IR arch
+field.
+
+The
+.IR arch
+field is not unique for all calling conventions. The X86-64 ABI and
+the X32 ABI both use
+.BR AUDIT_ARCH_X86_64
+as
+.IR arch ,
+and they run on the same processors. Instead, the mask
+.BR __X32_SYSCALL_BIT
+is used on the system call number to tell the two ABIs apart.
+This means that in order to create a seccomp-based
+blacklist for system calls performed through the X86-64 ABI,
+it is necessary to not only check that
+.IR arch
+equals
+.BR AUDIT_ARCH_X86_64 ,
+but also to explicitly reject all syscalls that contain
+.BR __X32_SYSCALL_BIT
+in
+.IR nr .
+
+When checking values from
+.IR args
+against a blacklist, keep in mind that arguments are often
+silently truncated before being processed, but after the seccomp
+check. For example, this happens if the i386 ABI is used on an
+X86-64 kernel: Although the kernel will normally not look beyond
+the 32 lowest bits of the arguments, the values of the full
+64-bit registers will be present in the seccomp data. A less
+surprising example is that if any 64-bit ABI is used to perform
+a syscall that takes an argument of type int, the
+more-significant half of the argument register is ignored by
+the syscall, but visible in the seccomp data.
+
 A seccomp filter returns a 32-bit value consisting of two parts:
 the most significant 16 bits
 (corresponding to the mask defined by the constant
@@ -584,38 +625,57 @@ cecilia
 #include <linux/seccomp.h>
 #include <sys/prctl.h>
 
+#define X32_SYSCALL_BIT 0x40000000
+
 static int
 install_filter(int syscall_nr, int t_arch, int f_errno)
 {
+    int forbidden_bitmask = 0;
+    /* assume that AUDIT_ARCH_X86_64 means the normal X86-64 ABI */
+    if (t_arch == AUDIT_ARCH_X86_64)
+        forbidden_bitmask = X32_SYSCALL_BIT;
+
     struct sock_filter filter[] = {
         /* [0] Load architecture from 'seccomp_data' buffer into
                accumulator */
         BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
                  (offsetof(struct seccomp_data, arch))),
 
-        /* [1] Jump forward 4 instructions if architecture does not
+        /* [1] Jump forward 7 instructions if architecture does not
                match 't_arch' */
-        BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, t_arch, 0, 4),
+        BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, t_arch, 0, 7),
 
         /* [2] Load system call number from 'seccomp_data' buffer into
                accumulator */
         BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
                  (offsetof(struct seccomp_data, nr))),
 
-        /* [3] Jump forward 1 instruction if system call number
+        /* [3] Determine ABI from system call number - only needed for X86-64
+               in blacklist usecases */
+        BPF_STMT(BPF_ALU | BPF_AND | BPF_K, forbidden_bitmask),
+
+        /* [4] Check ABI - only needed for X86-64 in blacklist usecases */
+        BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, 0, 0, 4),
+
+        /* [5] Load system call number from 'seccomp_data' buffer into
+               accumulator */
+        BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
+                 (offsetof(struct seccomp_data, nr))),
+
+        /* [6] Jump forward 1 instruction if system call number
                does not match 'syscall_nr' */
         BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, syscall_nr, 0, 1),
 
-        /* [4] Matching architecture and system call: don't execute
+        /* [7] Matching architecture and system call: don't execute
 	       the system call, and return 'f_errno' in 'errno' */
         BPF_STMT(BPF_RET | BPF_K,
                  SECCOMP_RET_ERRNO | (f_errno & SECCOMP_RET_DATA)),
 
-        /* [5] Destination of system call number mismatch: allow other
+        /* [8] Destination of system call number mismatch: allow other
                system calls */
         BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_ALLOW),
 
-        /* [6] Destination of architecture mismatch: kill process */
+        /* [9] Destination of architecture mismatch: kill process */
         BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_KILL),
     };
 
-- 
2.1.4
