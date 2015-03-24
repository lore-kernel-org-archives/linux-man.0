From: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH v2 1/2] seccomp.2: Explain blacklisting problems, expand
 example
Date: Tue, 24 Mar 2015 19:38:33 +0100
Message-ID: <20150324183833.GB5677@pc.thejh.net>
References: <20150316180154.GA10663@pc.thejh.net>
 <CAGXu5j+mjC4HQWbJVSDb+gSTud=R1+UCBJBY8ysQuj9NETrSEQ@mail.gmail.com>
 <20150316233457.GA9227@pc.thejh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150316233457.GA9227-J1fxOzX/cBvk1uMJSBkQmQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Will Drewry <wad-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/seccomp.2 | 73 +++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 67 insertions(+), 6 deletions(-)

diff --git a/man2/seccomp.2 b/man2/seccomp.2
index e2a5060..b596fb8 100644
--- a/man2/seccomp.2
+++ b/man2/seccomp.2
@@ -250,6 +250,55 @@ struct seccomp_data {
 .fi
 .in
 
+Because the numbers of system calls vary between architectures and
+some architectures (e.g. X86-64) allow user-space code to use
+the calling conventions of multiple architectures, it is usually
+necessary to verify the value of the
+.IR arch
+field.
+
+It is strongly recommended to use a whitelisting approach whenever
+possible because such an approach is more robust and simple.
+A blacklist will have to be updated whenever a potentially
+dangerous syscall is added (or a dangerous flag or option if those
+are blacklisted), and it is often possible to alter the
+representation of a value without altering its meaning, leading to
+a blacklist bypass.
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
+surprising example is that if the X86-64 ABI is used to perform
+a syscall that takes an argument of type int, the
+more-significant half of the argument register is ignored by
+the syscall, but visible in the seccomp data.
+
 A seccomp filter returns a 32-bit value consisting of two parts:
 the most significant 16 bits
 (corresponding to the mask defined by the constant
@@ -616,38 +665,50 @@ cecilia
 #include <linux/seccomp.h>
 #include <sys/prctl.h>
 
+#define X32_SYSCALL_BIT 0x40000000
+
 static int
 install_filter(int syscall_nr, int t_arch, int f_errno)
 {
+    unsigned int upper_nr_limit = 0xffffffff;
+    /* assume that AUDIT_ARCH_X86_64 means the normal X86-64 ABI */
+    if (t_arch == AUDIT_ARCH_X86_64)
+        upper_nr_limit = X32_SYSCALL_BIT - 1;
+
     struct sock_filter filter[] = {
         /* [0] Load architecture from 'seccomp_data' buffer into
                accumulator */
         BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
                  (offsetof(struct seccomp_data, arch))),
 
-        /* [1] Jump forward 4 instructions if architecture does not
+        /* [1] Jump forward 5 instructions if architecture does not
                match 't_arch' */
-        BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, t_arch, 0, 4),
+        BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, t_arch, 0, 5),
 
         /* [2] Load system call number from 'seccomp_data' buffer into
                accumulator */
         BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
                  (offsetof(struct seccomp_data, nr))),
 
-        /* [3] Jump forward 1 instruction if system call number
+        /* [3] Check ABI - only needed for X86-64 in blacklist usecases.
+               Use JGT instead of checking against the bitmask to avoid
+               having to reload the syscall number. */
+        BPF_JUMP(BPF_JMP | BPF_JGT | BPF_K, upper_nr_limit, 3, 0),
+
+        /* [4] Jump forward 1 instruction if system call number
                does not match 'syscall_nr' */
         BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, syscall_nr, 0, 1),
 
-        /* [4] Matching architecture and system call: don't execute
+        /* [5] Matching architecture and system call: don't execute
 	       the system call, and return 'f_errno' in 'errno' */
         BPF_STMT(BPF_RET | BPF_K,
                  SECCOMP_RET_ERRNO | (f_errno & SECCOMP_RET_DATA)),
 
-        /* [5] Destination of system call number mismatch: allow other
+        /* [6] Destination of system call number mismatch: allow other
                system calls */
         BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_ALLOW),
 
-        /* [6] Destination of architecture mismatch: kill process */
+        /* [7] Destination of architecture mismatch: kill process */
         BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_KILL),
     };
 
-- 
2.1.4


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
