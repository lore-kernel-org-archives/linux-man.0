From: "Gabriel F. T. Gomes" <gftg-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 2/2] __ppc_set_ppr_low.3: Document new glibc function
Date: Wed,  5 Aug 2015 16:29:07 -0300
Message-ID: <1438802947-4372-2-git-send-email-gftg@linux.vnet.ibm.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gftg-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, tuliom-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, krisman-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org
List-Id: linux-man@vger.kernel.org

GNU C Library 2.18 adds functions that provide access to the Program
Priority Register (PPR).

Signed-off-by: Gabriel F. T. Gomes <gftg-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
---
 man3/__ppc_set_ppr_low.3     |  1 +
 man3/__ppc_set_ppr_med.3     | 96 ++++++++++++++++++++++++++++++++++++++++++++
 man3/__ppc_set_ppr_med_low.3 |  1 +
 3 files changed, 98 insertions(+)
 create mode 100644 man3/__ppc_set_ppr_low.3
 create mode 100644 man3/__ppc_set_ppr_med.3
 create mode 100644 man3/__ppc_set_ppr_med_low.3

diff --git a/man3/__ppc_set_ppr_low.3 b/man3/__ppc_set_ppr_low.3
new file mode 100644
index 0000000..a6d6cf3
--- /dev/null
+++ b/man3/__ppc_set_ppr_low.3
@@ -0,0 +1 @@
+.so man3/__ppc_set_ppr_med.3
diff --git a/man3/__ppc_set_ppr_med.3 b/man3/__ppc_set_ppr_med.3
new file mode 100644
index 0000000..a6b6506
--- /dev/null
+++ b/man3/__ppc_set_ppr_med.3
@@ -0,0 +1,96 @@
+.\" Copyright (c) 2015, IBM Corporation.
+.\"
+.\" %%%LICENSE_START(VERBATIM)
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
+.\" %%%LICENSE_END
+.\"
+.\" Process this file with
+.\" groff -man -Tascii foo.1
+.\"
+.TH __PPC_SET_PPR_MED 3 2015-08-05 "GNU C Library" "Linux\
+Programmer's Manual"
+.SH NAME
+__ppc_set_ppr_med, __ppc_set_ppr_low, __ppc_set_ppr_med_low \-
+Set the Program Priority Register
+.SH SYNOPSIS
+.B #include <sys/platform/ppc.h>
+.sp
+.B void __ppc_set_ppr_med(void);
+.br
+.B void __ppc_set_ppr_low(void);
+.br
+.B void __ppc_set_ppr_med_low(void);
+.SH DESCRIPTION
+The functions
+.BR __ppc_set_ppr_med (),
+.BR __ppc_set_ppr_low ()
+and
+.BR __ppc_set_ppr_med_low ()
+provide access to the
+.I Program Priority Register
+(PPR).
+.P
+The PPR is a 64-bit register that controls the program's priority.
+By adjusting the PPR value the programmer may improve system
+throughput by causing the system resources to be used more
+efficiently, especially in contention situations.
+The three unprivileged states available are covered by the functions
+.BR __ppc_set_ppr_med (),
+.BR __ppc_set_ppr_low ()
+and
+.BR __ppc_set_ppr_med_low ().
+More information available in Power ISA 2.06b - Book II - Section 3.1.
+.P
+.BR __ppc_set_ppr_med ()
+sets the Program Priority Register to medium value (default).
+.P
+.BR __ppc_set_ppr_low ()
+sets the Program Priority Register to low value.
+.P
+.BR __ppc_set_ppr_med_low ()
+sets the Program Priority Register to medium low value.
+.SH VERSIONS
+GNU C Library added support for
+.BR __ppc_set_ppr_med (),
+.BR __ppc_set_ppr_low ()
+and
+.BR __ppc_set_ppr_med_low ()
+in version 2.18.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.ad l
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR __ppc_set_ppr_med (),
+.BR __ppc_set_ppr_low (),
+.BR __ppc_set_ppr_med_low ()
+T}	Thread safety	MT-Safe
+.TE
+.ad
+.SH CONFORMING TO
+These functions are nonstandard GNU extensions.
+.SH SEE ALSO
+.BR __ppc_yield (3)
diff --git a/man3/__ppc_set_ppr_med_low.3 b/man3/__ppc_set_ppr_med_low.3
new file mode 100644
index 0000000..a6d6cf3
--- /dev/null
+++ b/man3/__ppc_set_ppr_med_low.3
@@ -0,0 +1 @@
+.so man3/__ppc_set_ppr_med.3
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
