From: "Tulio Magno Quites Machado Filho" <tuliom-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] __ppc_get_timebase.3: Document a new glibc function
Date: Wed, 22 Aug 2012 15:08:02 -0300
Message-ID: <1345658882-16060-1-git-send-email-tuliom@linux.vnet.ibm.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rsa-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org, Tulio Magno Quites Machado Filho <tuliom-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Glibc 2.16 was released with a new function for the PowerPC architecture
that can read its Time Base Register.
It was included by commit d9dc34cd.

Signed-off-by: Tulio Magno Quites Machado Filho <tuliom-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
---
 man3/__ppc_get_timebase.3 |   48 +++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 48 insertions(+), 0 deletions(-)
 create mode 100644 man3/__ppc_get_timebase.3

diff --git a/man3/__ppc_get_timebase.3 b/man3/__ppc_get_timebase.3
new file mode 100644
index 0000000..b73c138
--- /dev/null
+++ b/man3/__ppc_get_timebase.3
@@ -0,0 +1,48 @@
+.\" Copyright (c) 2012, IBM Corporation.
+.\"
+.\" Permission is granted to make and distribute verbatim copies of this
+.\" manual provided the copyright notice and this permission notice are
+.\" preserved on all copies.
+.\"
+.\" Permission is granted to copy and distribute modified versions of
+.\" this manual under the conditions for verbatim copying, provided that
+.\" the entire resulting derived work is distributed under the terms of
+.\" a permission notice identical to this one.
+.\"
+.\" Since the Linux kernel and libraries are constantly changing, this
+.\" manual page may be incorrect or out-of-date.  The author(s) assume.
+.\" no responsibility for errors or omissions, or for damages resulting.
+.\" from the use of the information contained herein.  The author(s) may.
+.\" not have taken the same level of care in the production of this.
+.\" manual, which is licensed free of charge, as they might when working.
+.\" professionally.
+.\"
+.\" Formatted or processed versions of this manual, if unaccompanied by
+.\" the source, must acknowledge the copyright and authors of this work.
+
+.TH __PPC_GET_TIMEBASE 3 2012-08-13 "GNU C Library" "Linux Programmer's\
+Manual"
+.SH NAME
+__ppc_get_timebase \- Get the current value of the Time Base Register on
+PowerPC architecture
+.SH SYNOPSIS
+.B #include <sys/platform/ppc.h>
+.sp
+.BI "uint64_t __ppc_get_timebase(void)"
+.SH DESCRIPTION
+.BR __ppc_get_timebase()
+reads the current value of the Time Base Register and returns its value.
+The Time Base Register is a 64-bit register presented in PowerPC processors
+that stores a monotonically incremented value updated at a system-dependent
+frequency that may be different from the processor frequency.
+.SH RETURN VALUE
+Returns an unsigned integer with 64-bit in size that represents the current
+value of the Time Base Register.
+.SH VERSIONS
+The GNU C Library support for __ppc_get_timebase has been provided since
+version 2.16.
+.SH CONFORMING TO
+This function is a nonstandard GNU extension.
+.SH SEE ALSO
+.BR time (2),
+.BR usleep (3)
-- 
1.7.7.6

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
