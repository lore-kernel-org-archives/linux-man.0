From: Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] clone.2: Adjust syscall prototype and expand CLONE_SETTLS
 description
Date: Tue, 23 Aug 2016 23:06:07 -0400
Message-ID: <20160824030607.GA2596@Kenos-MacBook-Pro-2.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The prototype for the system call was added in 81f10dad, but looking at the
kernel's fork.c, I believe the relevant definition is

SYSCALL_DEFINE5(clone, unsigned long, clone_flags, unsigned long, newsp,
int __user *, parent_tidptr,
int __user *, child_tidptr,
unsigned long, tls)

so the last argument is the tls argument, not a pt_regs argument.
I stumbled upon this while trying to understand CLONE_SETTLS, so I expanded
that description a little to cover other architectures.
---
 man2/clone.2 | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/man2/clone.2 b/man2/clone.2
index b867961..7c80e63 100644
--- a/man2/clone.2
+++ b/man2/clone.2
@@ -51,14 +51,14 @@ clone, __clone2 \- create a child process
 
 .BI "int clone(int (*" "fn" ")(void *), void *" child_stack ,
 .BI "          int " flags ", void *" "arg" ", ... "
-.BI "          /* pid_t *" ptid ", struct user_desc *" tls \
+.BI "          /* pid_t *" ptid ", void *" newtls \
 ", pid_t *" ctid " */ );"
 
 /* Prototype for the raw system call */
 
 .BI "long clone(unsigned long " flags ", void *" child_stack ,
 .BI "          void *" ptid ", void *" ctid ,
-.BI "          struct pt_regs *" regs );
+.BI "          unsigned long " newtls );
 .fi
 .SH DESCRIPTION
 .BR clone ()
@@ -544,11 +544,25 @@ then trace the child also (see
 .BR ptrace (2)).
 .TP
 .BR CLONE_SETTLS " (since Linux 2.5.32)"
-The
+The TLS (Thread Local Storage) descriptor is set to
+.I newtls.
+
+The interpretation of
+.I newtls
+and the resulting effect is architecture dependent.
+On x86,
 .I newtls
-argument is the new TLS (Thread Local Storage) descriptor.
+is interpreted as a
+.IR "struct user_desc *"
 (See
-.BR set_thread_area (2).)
+.BR set_thread_area (2)).
+On x86_64 it is the new value to be set for the %fs base register
+(See the
+.I ARCH_SET_FS
+argument to
+.BR arch_prctl (2)).
+On architectures with a dedicated TLS register, it is the new value
+of that register.
 .TP
 .BR CLONE_SIGHAND " (since Linux 2.0)"
 If
@@ -813,7 +827,7 @@ The raw system call interface on x86 and many other architectures is roughly:
 
 .BI "long clone(unsigned long " flags ", void *" child_stack ,
 .BI "           void *" ptid ", void *" ctid ,
-.BI "           struct pt_regs *" regs );
+.BI "           unsigned long " newtls );
 
 .fi
 .in
-- 
2.8.1
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
