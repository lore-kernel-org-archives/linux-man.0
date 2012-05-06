From: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Subject: [patch], syscalls(2): Table too wide for line length, use text
 blocks
Date: Sun, 6 May 2012 20:10:24 +0000
Message-ID: <20120506201024.GA1067@rhi.hi.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Package: man-pages
Version: 3.40
Severity: minor
Tags: patch

  From "groff -ww ..." (or "man --warnings=w ..."):

warning: around line 157: table wider than line width

  Have to use text blocks.  Move some text to its correct column.
  Split text to two columns to avoid hyphenation.

  Patch:

--- syscalls.2	2012-04-26 22:58:36.000000000 +0000
+++ syscalls.2.new	2012-05-06 03:51:43.000000000 +0000
@@ -164,8 +164,9 @@
 \fBadjtimex\fP(2)
 \fBalarm\fP(2)
 \fBalloc_hugepages\fP(2)	2.5.36	Removed in 2.5.44
-\fBbdflush\fP(2)		Deprecated (does nothing)
-		since 2.6
+\fBbdflush\fP(2)		T{
+Deprecated (does nothing) since 2.6
+T}
 \fBbind\fP(2)
 \fBbrk\fP(2)
 \fBcacheflush\fP(2)	1.2	Not on i386
@@ -185,7 +186,7 @@
 \fBclose\fP(2)
 \fBconnect\fP(2)
 \fBcreat\fP(2)
-\fBcreate_module\fP(2)	Removed in 2.6
+\fBcreate_module\fP(2)		Removed in 2.6
 \fBdelete_module\fP(2)
 \fBdup\fP(2)
 \fBdup2\fP(2)
@@ -235,7 +236,7 @@
 \fBftruncate64\fP(2)	2.4
 \fBfutex\fP(2)	2.6
 \fBfutimesat\fP(2)	2.6.16
-\fBget_kernel_syms\fP(2)	Removed in 2.6
+\fBget_kernel_syms\fP(2)		Removed in 2.6
 \fBget_mempolicy\fP(2)	2.6.6
 \fBget_robust_list\fP(2)	2.6.17
 \fBget_thread_area\fP(2)	2.6
@@ -365,8 +366,9 @@
 .\" , PowerPC, ARM; not i386
 \fBpciconfig_write\fP(2)	2.0.26; 2.2	Not on i386
 .\" , PowerPC, ARM; not i386
-\fBperf_event_open\fP(2)	2.6.31	Was called perf_counter_open()
-		in 2.6.31; renamed in 2.6.32
+\fBperf_event_open\fP(2)	2.6.31	T{
+Was called perf_counter_open() in 2.6.31; renamed in 2.6.32
+T}
 \fBpersonality\fP(2)	1.2
 .\" \fBperfctr\fP(2)	???	Sparc32, Sparc64
 .\" \fBperfmonctl\fP(2)	???	ia64
@@ -376,8 +378,9 @@
 \fBpoll\fP(2)	2.2
 \fBppoll\fP(2)	2.6.16
 \fBprctl\fP(2)	2.2
-\fBpread64\fP(2)		Added as "pread" in 2.2;
-		renamed "pread64" in 2.6
+\fBpread64\fP(2)		T{
+Added as "pread" in 2.2; renamed "pread64" in 2.6
+T}
 \fBpreadv\fP(2)	2.6.30
 \fBprlimit\fP(2)	2.6.36
 \fBprocess_vm_readv(2)\fP	3.2
@@ -385,8 +388,9 @@
 \fBpselect6\fP(2)	2.6.16
 .\" Implements \fBpselect\fP(2)
 \fBptrace\fP(2)
-\fBpwrite64\fP(2)		Added as "pwrite" in 2.2;
-		renamed "pwrite64" in 2.6
+\fBpwrite64\fP(2)		T{
+Added as "pwrite" in 2.2; renamed "pwrite64" in 2.6
+T}
 \fBpwritev\fP(2)	2.6.30
 \fBquery_module\fP(2)	2.2	Removed in 2.6
 \fBquotactl\fP(2)
@@ -442,8 +446,9 @@
 \fBset_robust_list\fP(2)	2.6.17
 \fBset_thread_area\fP(2)	2.6
 \fBset_tid_address\fP(2)	2.6
-\fBset_zone_reclaim\fP(2)	2.6.13	Removed in 2.6.16 (was never
-		available to userspace)
+\fBset_zone_reclaim\fP(2)	2.6.13	T{
+Removed in 2.6.16 (was never available to userspace)
+T}
 .\" See http://lkml.org/lkml/2005/8/1/83
 .\" "[PATCH] remove sys_set_zone_reclaim()"
 \fBsetdomainname\fP(2)
@@ -504,17 +509,19 @@
 \fBstatfs\fP(2)
 \fBstatfs64\fP(2)	2.6
 \fBstime\fP(2)
-\fBsubpage_prot\fP(2)	2.6.25	PowerPC if CONFIG_PPC_64K_PAGES
+\fBsubpage_prot\fP(2)	2.6.25	PowerPC if
+		CONFIG_PPC_64K_PAGES
 \fBswapoff\fP(2)
 \fBswapon\fP(2)
 \fBsymlink\fP(2)
 \fBsymlinkat\fP(2)	2.6.16
 \fBsync\fP(2)
 \fBsync_file_range\fP(2)	2.6.17
-\fBsync_file_range2\fP(2)	2.6.22	Architecture-specific variant
+\fBsync_file_range2\fP(2)	2.6.22	T{
+Architecture-specific variant of \fBsync_file_range\fP(2)
+T}
 .\" PowerPC, ARM, tile
 .\" First appeared on ARM, as arm_sync_file_range(), but later renamed
-		of \fBsync_file_range\fP(2)
 .\" \fBsys_debug_setcontext\fP(2)	???	PowerPC if CONFIG_PPC32
 \fBsyncfs\fP(2)	2.6.39
 \fBsysfs\fP(2)	1.2

-- 
Bjarni I. Gislason
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
