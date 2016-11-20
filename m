From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3] mprotect.2: Added information regarding
 PROT_{SEM,SAO,GROWSUP,GROWSDOWN}
Date: Sun, 20 Nov 2016 04:16:03 +0300
Message-ID: <20161120011603.GA31811@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Changes since v2:
 * Commit IDs from historic repositories removed.
 * Note regarding intended purpose of PROT_SEM written up.
 * Comment format changed to .\"
 * "VMA" renamed to "mapping"
 * Removed note regarding PROT_GROWS*.

---
 man2/mprotect.2 | 63 +++++++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 55 insertions(+), 8 deletions(-)

diff --git a/man2/mprotect.2 b/man2/mprotect.2
index 440fa65..8f4c09f 100644
--- a/man2/mprotect.2
+++ b/man2/mprotect.2
@@ -30,12 +30,6 @@
 .\" 2007-06-02, mtk: Fairly substantial rewrites and additions, and
 .\" a much improved example program.
 .\"
-.\" FIXME The following protection flags need documenting:
-.\"         PROT_SEM
-.\"         PROT_GROWSDOWN
-.\"         PROT_GROWSUP
-.\"         PROT_SAO (PowerPC)
-.\"
 .TH MPROTECT 2 2015-07-23 "Linux" "Linux Programmer's Manual"
 .SH NAME
 mprotect, pkey_mprotect \- set protection on a region of memory
@@ -60,7 +54,7 @@ that violates the protection, then the kernel generates a
 signal for the process.
 .PP
 .I prot
-is either
+is a combination of the following access flags:
 .B PROT_NONE
 or a bitwise-or of the other values in the following list:
 .TP 1.1i
@@ -75,6 +69,40 @@ The memory can be modified.
 .TP
 .B PROT_EXEC
 The memory can be executed.
+.TP
+.BR PROT_SEM " (since Linux 2.5.7)"
+The memory can be used for atomic operations. It was introduced as part of
+.BR futex (2)
+implementation (in order to guarantee ability to perform atomic
+operations required by its commands such as
+.BR FUTEX_WAIT ),
+but not actually used in any currently supported architecture so far.
+.\" aba46c5027cb59d98052231b36efcbbde9c77a1d ef3d3246a0d06be622867d21af25f997aeeb105f
+.TP
+.BR PROT_SAO " (since Linux 2.6.26)"
+The memory should have strong access ordering. This feature is specific to
+PowerPC architecture (version 2.06 of architecture specification adds SAO CPU
+feature, and it is available on POWER 7 or PowerPC A2, for example).
+.PP
+Additionally (since Linux 2.6.0),
+.I prot
+can have one of the following flags set:
+.TP 1.1i
+.\" mm/mmap.c:
+.\"	vm_flags |= calc_vm_prot_bits(prot, pkey) | calc_vm_flag_bits(flags) |
+.\"			mm->def_flags | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC;
+.\" And calc_vm_flag_bits converts only GROWSDOWN/DENYWRITE/LOCKED.
+.B PROT_GROWSUP
+Apply protection mode up to the end of the mapping which grows up (it should be a
+stack segment on HP PA-RISC, since there are no other ways to map a segment with
+.B VM_GROWSUP
+even if architecture has support for it.)
+.TP
+.B PROT_GROWSDOWN
+Apply protection mode down to the beginning of the mapping which grows down (it
+should be stack segment or mapped with
+.B MAP_GROWSDOWN
+flag set.)
 .PP
 Like
 .BR mprotect (),
@@ -122,7 +150,26 @@ or not a multiple of the system page size.
 .RB ( pkey_mprotect ())
 \fIpkey\fP has not been allocated with
 .BR pkey_alloc (2)
-.\" Or: both PROT_GROWSUP and PROT_GROWSDOWN were specified in 'prot'.
+.TP
+.BR EINVAL
+Both
+.BR PROT_GROWSUP " and " PROT_GROWSDOWN
+were specified in
+.IR prot .
+.TP
+.BR EINVAL
+Invalid (other than
+.BR PROT_READ ", " PROT_WRITE ", " PROT_EXEC ", " PROT_SEM ", "
+.BR PROT_SAO " (on PowerPC only), " PROT_GROWSUP ", " PROT_GROWSDOWN )
+flags specified in
+.IR prot .
+.TP
+.BR EINVAL
+(PowerPC architecture)
+.B PROT_SAO
+specified in
+.IR prot ,
+but SAO hardware feature is not available.
 .TP
 .B ENOMEM
 Internal kernel structures could not be allocated.
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
