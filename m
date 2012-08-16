From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/3] ldd.1, syscalls.2, getutent.3, cpuid.4: ffix
Date: Wed, 15 Aug 2012 23:09:48 -0400
Message-ID: <1345086590-11949-2-git-send-email-taffit@debian.org>
References: <1345086590-11949-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1345086590-11949-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man1/ldd.1      |    2 +-
 man2/syscalls.2 |    4 ++--
 man3/getutent.3 |    2 +-
 man4/cpuid.4    |    4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/man1/ldd.1 b/man1/ldd.1
index cd34402..db1b5f4 100644
--- a/man1/ldd.1
+++ b/man1/ldd.1
@@ -20,7 +20,7 @@ specified on the command line.
 In the usual case,
 .B ldd
 invokes the standard dynamic linker (see
-.BR ld.so(8))
+.BR ld.so (8))
 with the
 .B LD_TRACE_LOADED_OBJECTS
 environment variable set to 1,
diff --git a/man2/syscalls.2 b/man2/syscalls.2
index 0f979dd..a6f5ac7 100644
--- a/man2/syscalls.2
+++ b/man2/syscalls.2
@@ -385,8 +385,8 @@ Added as "pread" in 2.2; renamed "pread64" in 2.6
 T}
 \fBpreadv\fP(2)	2.6.30
 \fBprlimit\fP(2)	2.6.36
-\fBprocess_vm_readv(2)\fP	3.2
-\fBprocess_vm_writev(2)\fP	3.2
+\fBprocess_vm_readv\fP(2)	3.2
+\fBprocess_vm_writev\fP(2)	3.2
 \fBpselect6\fP(2)	2.6.16
 .\" Implements \fBpselect\fP(2)
 \fBptrace\fP(2)
diff --git a/man3/getutent.3 b/man3/getutent.3
index 21bb823..e006095 100644
--- a/man3/getutent.3
+++ b/man3/getutent.3
@@ -212,7 +212,7 @@ Glibc adds reentrant versions
 .sp
 .nf
 .BR "#define _GNU_SOURCE" "    /* or _SVID_SOURCE or _BSD_SOURCE;
-.RB "\&                          see " feature_test_macros(7) " */"
+.RB "\&                          see " feature_test_macros "(7) */"
 .B #include <utmp.h>
 .sp
 .BI "int getutent_r(struct utmp *" ubuf ", struct utmp **" ubufp );
diff --git a/man4/cpuid.4 b/man4/cpuid.4
index 4cdc3e5..8168837 100644
--- a/man4/cpuid.4
+++ b/man4/cpuid.4
@@ -28,9 +28,9 @@ cpuid \- x86 CPUID access device
 CPUID provides an interface for querying information about the x86 CPU.
 
 This device is accessed by
-.B lseek (2)
+.BR lseek (2)
 or
-.B pread (2)
+.BR pread (2)
 to the appropriate CPUID level and reading in chunks of 16 bytes.
 A larger read size means multiple reads of consecutive levels.
 
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
