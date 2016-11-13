From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] mprotect.2: Add information regarding
 PROT_{SEM,SAO,GROWSUP,GROWSDOWN}
Date: Sun, 13 Nov 2016 22:33:23 +0300
Message-ID: <20161113193323.GA19910@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The note regarding PROT_SEM is done based on observation that it is not
actually used in mprotect code (as far as i understood it).

---
 man2/mprotect.2 | 58 +++++++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 50 insertions(+), 8 deletions(-)

diff --git a/man2/mprotect.2 b/man2/mprotect.2
index 440fa65..4c3a1e2 100644
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
@@ -75,6 +69,38 @@ The memory can be modified.
 .TP
 .B PROT_EXEC
 The memory can be executed.
+'\" 882ad449046cec136c484dd2b3659fb4c683e0a3
+.TP
+.BR PROT_SEM " (since Linux 2.5.7)"
+The memory can be used for atomic operations. It was introduced as part of
+.BR futex (2)
+implementation (in order), but not actually used in any currently supported
+architecture so far.
+'\" aba46c5027cb59d98052231b36efcbbde9c77a1d ef3d3246a0d06be622867d21af25f997aeeb105f
+.TP
+.BR PROT_SAO " (since Linux 2.6.26)"
+The memory should have strong access ordering. This feature is specific to
+PowerPC architecture (version 2.06 of architecture specification adds SAO CPU
+feature, and is available on POWER 7 and newer, for example).
+.PP
+'\" c1dd59582e5b518983b0f4db66f0f8a969139c1b
+Additionally (since Linux 2.6.0),
+.I prot
+can have one of the following flags set:
+.TP 1.1i
+.B PROT_GROWSUP
+Apply protection mode to the whole VMA, which grows up (it should be mapped with
+.B MAP_GROWSUP
+flag set, which itself is available on IA-64 only, or be stack segment on
+HP PARISC).
+.TP
+.B PROT_GROWSDOWN
+Apply protection mode to the whole VMA, which grows down (it should be mapped
+with
+.B MAP_GROWSDOWN
+flag set).
+.PP
+This is especially useful for stacks and other mappings which can grow.
 .PP
 Like
 .BR mprotect (),
@@ -122,7 +148,23 @@ or not a multiple of the system page size.
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
+Invalid flags specified in
+.IR prot .
+.TP
+.BR EINVAL
+(PowerPC architecture)
+.B PROT_SAO
+specified in
+.IR prot ,
+but SAO hardware feature is no available.
 .TP
 .B ENOMEM
 Internal kernel structures could not be allocated.
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
