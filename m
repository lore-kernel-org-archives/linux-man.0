From: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Subject: [PATCH] man-pages: ffix: Add a no-break space between a number and a
 unit (prefix)
Date: Fri, 18 Aug 2017 00:22:53 +0000
Message-ID: <20170818002253.GA20222@rhi.hi.is>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="mP3DRpeJDSE+ciuQ"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  A missing measuring unit is not added to a prefix (a subject for a later
patch?).

  Tables (fd.4): Units are removed from numbers as they belong to the header

Signed-off-by: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
---
 man2/arch_prctl.2          |  2 +-
 man2/ioctl_fideduperange.2 |  2 +-
 man2/ioctl_getfsmap.2      |  4 +--
 man2/kexec_load.2          |  2 +-
 man2/madvise.2             |  4 +--
 man2/mbind.2               |  4 +--
 man2/migrate_pages.2       |  2 +-
 man2/mlock.2               |  2 +-
 man2/mmap.2                |  2 +-
 man2/mmap2.2               |  2 +-
 man2/mprotect.2            |  2 +-
 man2/perf_event_open.2     |  2 +-
 man2/process_vm_readv.2    |  2 +-
 man2/set_mempolicy.2       |  2 +-
 man2/shmget.2              |  2 +-
 man2/subpage_prot.2        | 12 ++++----
 man3/btree.3               |  2 +-
 man3/pthread_attr_init.3   |  2 +-
 man3/pthread_create.3      |  2 +-
 man3/pthread_getattr_np.3  |  2 +-
 man3/regex.3               |  2 +-
 man4/cciss.4               |  2 +-
 man4/fd.4                  | 73 +++++++++++++++++++++++++---------------------
 man4/wavelan.4             |  2 +-
 man5/filesystems.5         |  2 +-
 man5/proc.5                | 40 ++++++++++++-------------
 man7/bootparam.7           |  6 ++--
 man7/ip.7                  |  2 +-
 man7/raw.7                 |  2 +-
 man7/tcp.7                 | 26 ++++++++---------
 man7/units.7               |  6 ++--
 man8/ld.so.8               |  4 +--
 32 files changed, 114 insertions(+), 109 deletions(-)

diff --git a/man2/arch_prctl.2 b/man2/arch_prctl.2
index 678aada19..1c79d5bb2 100644
--- a/man2/arch_prctl.2
+++ b/man2/arch_prctl.2
@@ -119,7 +119,7 @@ As an optimization, if a 32-bit TLS base address is used,
 may use a real TLS entry as if
 .BR set_thread_area (2)
 had been called, instead of manipulating the segment base register directly.
-Memory in the first 2GB of address space can be allocated by using
+Memory in the first 2\ GB of address space can be allocated by using
 .BR mmap (2)
 with the
 .B MAP_32BIT
diff --git a/man2/ioctl_fideduperange.2 b/man2/ioctl_fideduperange.2
index d0a43854b..2200f9ce8 100644
--- a/man2/ioctl_fideduperange.2
+++ b/man2/ioctl_fideduperange.2
@@ -116,7 +116,7 @@ and the struct
 array must not exceed the system page size.
 The maximum size of
 .IR src_length
-is filesystem dependent and is typically 16MiB.
+is filesystem dependent and is typically 16\ MiB.
 This limit will be enforced silently by the filesystem.
 By convention, the storage used by
 .IR src_fd
diff --git a/man2/ioctl_getfsmap.2 b/man2/ioctl_getfsmap.2
index 0c4612abe..0eabb399f 100644
--- a/man2/ioctl_getfsmap.2
+++ b/man2/ioctl_getfsmap.2
@@ -132,8 +132,8 @@ to uniquely index any filesystem mapping record.
 Classic non-sharing filesystems might be able to identify any record with only
 .RI "(" "device" ", " "physical" ", " "flags" ")."
 For example, if the low key is set to (8:0, 36864, 0, 0, 0), the filesystem will
-only return records for extents starting at or above 36KiB on disk.
-If the high key is set to (8:0, 1048576, 0, 0, 0), only records below 1MiB will
+only return records for extents starting at or above 36\ KiB on disk.
+If the high key is set to (8:0, 1048576, 0, 0, 0), only records below 1\ MiB will
 be returned.
 The format of
 .I fmr_device
diff --git a/man2/kexec_load.2 b/man2/kexec_load.2
index 2a0030803..f480f1ef8 100644
--- a/man2/kexec_load.2
+++ b/man2/kexec_load.2
@@ -316,7 +316,7 @@ is empty (length zero).
 .I kernel_fd
 does not refer to an open file, or the kernel can't load this file.
 Currently, the file must be a bzImage and contain an x86 kernel that
-is loadable above 4GiB in memory (see the kernel source file
+is loadable above 4\ GiB in memory (see the kernel source file
 .IR Documentation/x86/boot.txt ).
 .TP
 .B ENOMEM
diff --git a/man2/madvise.2 b/man2/madvise.2
index a5f20b2d1..45acb8cd7 100644
--- a/man2/madvise.2
+++ b/man2/madvise.2
@@ -336,8 +336,8 @@ naturally aligned to the huge page size (see
 This feature is primarily aimed at applications that use large mappings of
 data and access large regions of that memory at a time (e.g., virtualization
 systems such as QEMU).
-It can very easily waste memory (e.g., a 2MB mapping that only ever accesses
-1 byte will result in 2MB of wired memory instead of one 4KB page).
+It can very easily waste memory (e.g., a 2\ MB mapping that only ever accesses
+1 byte will result in 2\ MB of wired memory instead of one 4\ KB page).
 See the Linux kernel source file
 .I Documentation/vm/transhuge.txt
 for more details.
diff --git a/man2/mbind.2 b/man2/mbind.2
index 60b64ebd2..5816f3a0a 100644
--- a/man2/mbind.2
+++ b/man2/mbind.2
@@ -237,7 +237,7 @@ This optimizes for bandwidth instead of latency
 by spreading out pages and memory accesses to those pages across
 multiple nodes.
 To be effective the memory area should be fairly large,
-at least 1MB or bigger with a fairly uniform access pattern.
+at least 1\ MB or bigger with a fairly uniform access pattern.
 Accesses to a single page of the area will still be limited to
 the memory bandwidth of a single node.
 .TP
@@ -379,7 +379,7 @@ Or,
 .I maxnode
 exceeds a kernel-imposed limit.
 .\" As at 2.6.23, this limit is "a page worth of bits", e.g.,
-.\" 8 * 4096 bits, assuming a 4kB page size.
+.\" 8 * 4096 bits, assuming a 4 kB page size.
 Or,
 .I nodemask
 specifies one or more node IDs that are
diff --git a/man2/migrate_pages.2 b/man2/migrate_pages.2
index 02f3a83b6..7ba7a2020 100644
--- a/man2/migrate_pages.2
+++ b/man2/migrate_pages.2
@@ -107,7 +107,7 @@ The value specified by
 .I maxnode
 exceeds a kernel-imposed limit.
 .\" As at 3.5, this limit is "a page worth of bits", e.g.,
-.\" 8 * 4096 bits, assuming a 4kB page size.
+.\" 8 * 4096 bits, assuming a 4 kB page size.
 Or,
 .I old_nodes
 or
diff --git a/man2/mlock.2 b/man2/mlock.2
index 7437d60a2..6b7e9bbb8 100644
--- a/man2/mlock.2
+++ b/man2/mlock.2
@@ -242,7 +242,7 @@ pages in the address space of the process.
 Locking or unlocking a region would result in the total number of
 mappings with distinct attributes (e.g., locked versus unlocked)
 exceeding the allowed maximum.
-.\" I.e., the number of VMAs would exceed the 64kB maximum
+.\" I.e., the number of VMAs would exceed the 64 kB maximum
 (For example, unlocking a range in the middle of a currently locked
 mapping would result in three mappings:
 two locked mappings at each end and an unlocked mapping in the middle.)
diff --git a/man2/mmap.2 b/man2/mmap.2
index 43090b231..d4a0cc1c5 100644
--- a/man2/mmap.2
+++ b/man2/mmap.2
@@ -143,7 +143,7 @@ In addition, zero or more of the following values can be ORed in
 Put the mapping into the first 2 Gigabytes of the process address space.
 This flag is supported only on x86-64, for 64-bit programs.
 It was added to allow thread stacks to be allocated somewhere
-in the first 2GB of memory,
+in the first 2\ GB of memory,
 so as to improve context-switch performance on some early
 64-bit processors.
 .\" See http://lwn.net/Articles/294642 "Tangled up in threads", 19 Aug 08
diff --git a/man2/mmap2.2 b/man2/mmap2.2
index 63a89ea1d..d88148993 100644
--- a/man2/mmap2.2
+++ b/man2/mmap2.2
@@ -89,7 +89,7 @@ This system call does not exist on x86-64.
 On ia64, the unit for
 .I offset
 is actually the system page size, rather than 4096 bytes.
-.\" ia64 can have page sizes ranging from 4kB to 64kB.
+.\" ia64 can have page sizes ranging from 4 kB to 64 kB.
 .\" On cris, it looks like the unit might also be the page size,
 .\" which is 8192 bytes. -- mtk, June 2007
 .SH SEE ALSO
diff --git a/man2/mprotect.2 b/man2/mprotect.2
index 4e2c3b598..f87b38759 100644
--- a/man2/mprotect.2
+++ b/man2/mprotect.2
@@ -197,7 +197,7 @@ was incorrectly produced for these cases.)
 Changing the protection of a memory region would result in the total number of
 mappings with distinct attributes (e.g., read versus read/write protection)
 exceeding the allowed maximum.
-.\" I.e., the number of VMAs would exceed the 64kB maximum
+.\" I.e., the number of VMAs would exceed the 64 kB maximum
 (For example, making the protection of a range
 .BR PROT_READ
 in the middle of a region currently protected as
diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index ff7cd6169..e91f46498 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -1465,7 +1465,7 @@ struct perf_event_mmap_page {
     __u16 time_shift;
     __u32 time_mult;
     __u64 time_offset;
-    __u64 __reserved[120];   /* Pad to 1k */
+    __u64 __reserved[120];   /* Pad to 1 k */
     __u64 data_head;         /* head in the data section */
     __u64 data_tail;         /* user-space written tail */
     __u64 data_offset;       /* where the buffer starts */
diff --git a/man2/process_vm_readv.2 b/man2/process_vm_readv.2
index ae9304ae9..8653652fc 100644
--- a/man2/process_vm_readv.2
+++ b/man2/process_vm_readv.2
@@ -198,7 +198,7 @@ elements points to an invalid memory region in the remote process.
 No further reads/writes will be attempted beyond that point.
 Keep this in mind when attempting to read data of unknown length
 (such as C strings that are null-terminated) from a remote process,
-by avoiding spanning memory pages (typically 4KiB) in a single remote
+by avoiding spanning memory pages (typically 4\ KiB) in a single remote
 .I iovec
 element.
 (Instead, split the remote read into two
diff --git a/man2/set_mempolicy.2 b/man2/set_mempolicy.2
index ccfa42103..d20be6572 100644
--- a/man2/set_mempolicy.2
+++ b/man2/set_mempolicy.2
@@ -198,7 +198,7 @@ the memory bandwidth of a single node.
 .\" NOTE:  the following sentence doesn't make sense in the context
 .\" of set_mempolicy() -- no memory area specified.
 .\" To be effective the memory area should be fairly large,
-.\" at least 1MB or bigger.
+.\" at least 1 MB or bigger.
 .TP
 .B MPOL_PREFERRED
 This mode sets the preferred node for allocation.
diff --git a/man2/shmget.2 b/man2/shmget.2
index 7fed8f91d..c56182f5c 100644
--- a/man2/shmget.2
+++ b/man2/shmget.2
@@ -362,7 +362,7 @@ for a discussion of why this default value (rather than
 is used.
 
 From Linux 2.2 up to Linux 3.15, the default value of
-this limit was 0x2000000 (32MB).
+this limit was 0x2000000 (32\ MB).
 
 Because it is not possible to map just part of a shared memory segment,
 the amount of virtual memory places another limit on the maximum size of a
diff --git a/man2/subpage_prot.2 b/man2/subpage_prot.2
index 69c32f18d..cf46c079d 100644
--- a/man2/subpage_prot.2
+++ b/man2/subpage_prot.2
@@ -42,8 +42,8 @@ There is no glibc wrapper for this system call; see NOTES.
 The PowerPC-specific
 .BR subpage_prot ()
 system call provides the facility to control the access
-permissions on individual 4kB subpages on systems configured with
-a page size of 64kB.
+permissions on individual 4\ kB subpages on systems configured with
+a page size of 64\ kB.
 
 The protection map is applied to the memory pages in the region starting at
 .I addr
@@ -54,9 +54,9 @@ Both of these arguments must be aligned to a 64-kB boundary.
 
 The protection map is specified in the buffer pointed to by
 .IR map .
-The map has 2 bits per 4kB subpage;
-thus each 32-bit word specifies the protections of 16 4kB subpages
-inside a 64kB page
+The map has 2 bits per 4\ kB subpage;
+thus each 32-bit word specifies the protections of 16 4\ kB subpages
+inside a 64\ kB page
 (so, the number of 32-bit words pointed to by
 .I map
 should equate to the number of 64-kB pages specified by
@@ -120,7 +120,7 @@ Implicit in this is that the regions of the address space that are
 protected are switched to use 4-kB hardware pages rather than 64-kB
 hardware pages (on machines with hardware 64-kB page support).
 .\" In the initial implementation, it was the case that:
-.\"     In fact the whole process is switched to use 4k hardware pages when the
+.\"     In fact the whole process is switched to use 4 k hardware pages when the
 .\"     subpage_prot system call is used, but this could be improved in future
 .\"     to switch only the affected segments.
 .\" But Paul Mackerass says (Oct 2010): I'm pretty sure we now only switch
diff --git a/man3/btree.3 b/man3/btree.3
index 65f45066d..86d773839 100644
--- a/man3/btree.3
+++ b/man3/btree.3
@@ -159,7 +159,7 @@ is 0 (no minimum number of keys is specified), a value of 2 is used.
 .TP
 .I psize
 Page size is the size (in bytes) of the pages used for nodes in the tree.
-The minimum page size is 512 bytes and the maximum page size is 64K.
+The minimum page size is 512 bytes and the maximum page size is 64\ K.
 If
 .I psize
 is 0 (no page size is specified), a page size is chosen based on the
diff --git a/man3/pthread_attr_init.3 b/man3/pthread_attr_init.3
index af4b98f3a..a21356682 100644
--- a/man3/pthread_attr_init.3
+++ b/man3/pthread_attr_init.3
@@ -121,7 +121,7 @@ we see the following:
 .in +4n
 .nf
 .\" Results from glibc 2.8, SUSE 11.0; Oct 2008
-.RB "$" " ulimit \-s" "       # No stack limit ==> default stack size is 2MB"
+.RB "$" " ulimit \-s" "       # No stack limit ==> default stack size is 2\ MB"
 unlimited
 .RB "$" " ./a.out"
 Thread attributes:
diff --git a/man3/pthread_create.3 b/man3/pthread_create.3
index 24739e9c4..72bc3e83f 100644
--- a/man3/pthread_create.3
+++ b/man3/pthread_create.3
@@ -243,7 +243,7 @@ Joined with thread 3; returned value was SERVUS
 .fi
 .in
 
-In the next run, the program explicitly sets a stack size of 1MB (using
+In the next run, the program explicitly sets a stack size of 1\ MB (using
 .BR pthread_attr_setstacksize (3))
 for the created threads:
 
diff --git a/man3/pthread_getattr_np.3 b/man3/pthread_getattr_np.3
index 78e2e3041..f80058c8e 100644
--- a/man3/pthread_getattr_np.3
+++ b/man3/pthread_getattr_np.3
@@ -128,7 +128,7 @@ a thread is created using default attributes:
 
 .in +4n
 .nf
-.RB "$" " ulimit \-s" "      # No stack limit ==> default stack size is 2MB"
+.RB "$" " ulimit \-s" "      # No stack limit ==> default stack size is 2\ MB"
 unlimited
 .RB "$" " ./a.out"
 Attributes of created thread:
diff --git a/man3/regex.3 b/man3/regex.3
index 90ffb8cdb..58c6a1a01 100644
--- a/man3/regex.3
+++ b/man3/regex.3
@@ -293,7 +293,7 @@ Invalid use of the range operator; for example, the ending point of the range
 occurs prior to the starting point.
 .TP
 .B REG_ESIZE
-Compiled regular expression requires a pattern buffer larger than 64Kb.
+Compiled regular expression requires a pattern buffer larger than 64\ Kb.
 This is not defined by POSIX.2.
 .TP
 .B REG_ESPACE
diff --git a/man4/cciss.4 b/man4/cciss.4
index f45b87e2a..e54b459ee 100644
--- a/man4/cciss.4
+++ b/man4/cciss.4
@@ -150,7 +150,7 @@ For example:
     Max SG entries since init: 32
     Sequential access devices: 0
 
-    cciss/c2d0:   36.38GB       RAID 0
+    cciss/c2d0:   36.38\ GB       RAID 0
 .fi
 .SS Files in /sys
 .TP
diff --git a/man4/fd.4 b/man4/fd.4
index b50732bc8..9366b0282 100644
--- a/man4/fd.4
+++ b/man4/fd.4
@@ -66,68 +66,73 @@ _
 .TS
 lw(1i) l l l l l.
 Name	Capac.	Cyl.	Sect.	Heads	Base minor #
+	KiB
 _
-\fBfd\fP\fIn\fP\fBd360\fP	360K	40	9	2	4
+\fBfd\fP\fIn\fP\fBd360\fP	360	40	9	2	4
 .TE
 .PP
 5.25 inch high-density device files:
 .TS
 lw(1i) l l l l l.
 Name	Capac.	Cyl.	Sect.	Heads	Base minor #
+	KiB
 _
-\fBfd\fP\fIn\fP\fBh360\fP	360K	40	9	2	20
-\fBfd\fP\fIn\fP\fBh410\fP	410K	41	10	2	48
-\fBfd\fP\fIn\fP\fBh420\fP	420K	42	10	2	64
-\fBfd\fP\fIn\fP\fBh720\fP	720K	80	9	2	24
-\fBfd\fP\fIn\fP\fBh880\fP	880K	80	11	2	80
-\fBfd\fP\fIn\fP\fBh1200\fP	1200K	80	15	2	8
-\fBfd\fP\fIn\fP\fBh1440\fP	1440K	80	18	2	40
-\fBfd\fP\fIn\fP\fBh1476\fP	1476K	82	18	2	56
-\fBfd\fP\fIn\fP\fBh1494\fP	1494K	83	18	2	72
-\fBfd\fP\fIn\fP\fBh1600\fP	1600K	80	20	2	92
+\fBfd\fP\fIn\fP\fBh360\fP	360	40	9	2	20
+\fBfd\fP\fIn\fP\fBh410\fP	410	41	10	2	48
+\fBfd\fP\fIn\fP\fBh420\fP	420	42	10	2	64
+\fBfd\fP\fIn\fP\fBh720\fP	720	80	9	2	24
+\fBfd\fP\fIn\fP\fBh880\fP	880	80	11	2	80
+\fBfd\fP\fIn\fP\fBh1200\fP	1200	80	15	2	8
+\fBfd\fP\fIn\fP\fBh1440\fP	1440	80	18	2	40
+\fBfd\fP\fIn\fP\fBh1476\fP	1476	82	18	2	56
+\fBfd\fP\fIn\fP\fBh1494\fP	1494	83	18	2	72
+\fBfd\fP\fIn\fP\fBh1600\fP	1600	80	20	2	92
 .TE
 .PP
 3.5 inch double-density device files:
 .TS
 lw(1i) l l l l l.
 Name	Capac.	Cyl.	Sect.	Heads	Base minor #
+	KiB
 _
-\fBfd\fP\fIn\fP\fBu360\fP	360K	80	9	1	12
-\fBfd\fP\fIn\fP\fBu720\fP	720K	80	9	2	16
-\fBfd\fP\fIn\fP\fBu800\fP	800K	80	10	2	120
-\fBfd\fP\fIn\fP\fBu1040\fP	1040K	80	13	2	84
-\fBfd\fP\fIn\fP\fBu1120\fP	1120K	80	14	2	88
+\fBfd\fP\fIn\fP\fBu360\fP	360	80	9	1	12
+\fBfd\fP\fIn\fP\fBu720\fP	720	80	9	2	16
+\fBfd\fP\fIn\fP\fBu800\fP	800	80	10	2	120
+\fBfd\fP\fIn\fP\fBu1040\fP	1040	80	13	2	84
+\fBfd\fP\fIn\fP\fBu1120\fP	1120	80	14	2	88
 .TE
 .PP
 3.5 inch high-density device files:
 .TS
 lw(1i) l l l l l.
 Name	Capac.	Cyl.	Sect.	Heads	Base minor #
+	KiB
 _
-\fBfd\fP\fIn\fP\fBu360\fP	360K	40	9	2	12
-\fBfd\fP\fIn\fP\fBu720\fP	720K	80	9	2	16
-\fBfd\fP\fIn\fP\fBu820\fP	820K	82	10	2	52
-\fBfd\fP\fIn\fP\fBu830\fP	830K	83	10	2	68
-\fBfd\fP\fIn\fP\fBu1440\fP	1440K	80	18	2	28
-\fBfd\fP\fIn\fP\fBu1600\fP	1600K	80	20	2	124
-\fBfd\fP\fIn\fP\fBu1680\fP	1680K	80	21	2	44
-\fBfd\fP\fIn\fP\fBu1722\fP	1722K	82	21	2	60
-\fBfd\fP\fIn\fP\fBu1743\fP	1743K	83	21	2	76
-\fBfd\fP\fIn\fP\fBu1760\fP	1760K	80	22	2	96
-\fBfd\fP\fIn\fP\fBu1840\fP	1840K	80	23	2	116
-\fBfd\fP\fIn\fP\fBu1920\fP	1920K	80	24	2	100
+\fBfd\fP\fIn\fP\fBu360\fP	360	40	9	2	12
+\fBfd\fP\fIn\fP\fBu720\fP	720	80	9	2	16
+\fBfd\fP\fIn\fP\fBu820\fP	820	82	10	2	52
+\fBfd\fP\fIn\fP\fBu830\fP	830	83	10	2	68
+\fBfd\fP\fIn\fP\fBu1440\fP	1440	80	18	2	28
+\fBfd\fP\fIn\fP\fBu1600\fP	1600	80	20	2	124
+\fBfd\fP\fIn\fP\fBu1680\fP	1680	80	21	2	44
+\fBfd\fP\fIn\fP\fBu1722\fP	1722	82	21	2	60
+\fBfd\fP\fIn\fP\fBu1743\fP	1743	83	21	2	76
+\fBfd\fP\fIn\fP\fBu1760\fP	1760	80	22	2	96
+\fBfd\fP\fIn\fP\fBu1840\fP	1840	80	23	2	116
+\fBfd\fP\fIn\fP\fBu1920\fP	1920	80	24	2	100
 .TE
 .PP
 3.5 inch extra-density device files:
 .TS
 lw(1i) l l l l l.
 Name	Capac.	Cyl.	Sect.	Heads	Base minor #
+	KiB
 _
-\fBfd\fP\fIn\fP\fBu2880\fP	2880K	80	36	2	32
-\fBfd\fP\fIn\fP\fBCompaQ\fP	2880K	80	36	2	36
-\fBfd\fP\fIn\fP\fBu3200\fP	3200K	80	40	2	104
-\fBfd\fP\fIn\fP\fBu3520\fP	3520K	80	44	2	108
-\fBfd\fP\fIn\fP\fBu3840\fP	3840K	80	48	2	112
+\fBfd\fP\fIn\fP\fBu2880\fP	2880	80	36	2	32
+\fBfd\fP\fIn\fP\fBCompaQ\fP	2880	80	36	2	36
+\fBfd\fP\fIn\fP\fBu3200\fP	3200	80	40	2	104
+\fBfd\fP\fIn\fP\fBu3520\fP	3520	80	44	2	108
+\fBfd\fP\fIn\fP\fBu3840\fP	3840	80	48	2	112
 .TE
 .SH DESCRIPTION
 \fBfd\fP special files access the floppy disk drives in raw mode.
@@ -203,7 +208,7 @@ To prevent this, use interleaved formats.
 
 It is not possible to
 read floppies which are formatted using GCR (group code recording),
-which is used by Apple II and Macintosh computers (800k disks).
+which is used by Apple II and Macintosh computers (800\ k disks).
 
 Reading floppies which are hard sectored (one hole per sector, with
 the index hole being a little skewed) is not supported.
diff --git a/man4/wavelan.4 b/man4/wavelan.4
index 3ebdb7c71..224020ab3 100644
--- a/man4/wavelan.4
+++ b/man4/wavelan.4
@@ -73,7 +73,7 @@ or disable it
 As the NWID is stored in the card Permanent Storage Area, it will be
 reuse at any further invocation of the driver.
 .SS Frequency & channels
-For the 2.4GHz 2.00 Hardware, you are able to set the frequency by
+For the 2.4\ GHz 2.00 Hardware, you are able to set the frequency by
 specifying one of the 10 defined channels
 .RI ( 2.412,
 .I 2.422, 2.425, 2.4305, 2.432, 2.442, 2.452, 2.460, 2.462
diff --git a/man5/filesystems.5 b/man5/filesystems.5
index 4f0580bcb..dee460ddf 100644
--- a/man5/filesystems.5
+++ b/man5/filesystems.5
@@ -124,7 +124,7 @@ that was integrated into Linux in kernel 2.4.24.
 .B minix
 is the filesystem used in the Minix operating system, the first to run
 under Linux.
-It has a number of shortcomings, including a 64MB partition size
+It has a number of shortcomings, including a 64\ MB partition size
 limit, short filenames, and a single timestamp.
 It remains useful for floppies and RAM disks.
 .TP
diff --git a/man5/proc.5 b/man5/proc.5
index 0944e09ef..87b06153e 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -956,9 +956,9 @@ the storage layer.
 .TP
 .IR cancelled_write_bytes :
 The big inaccuracy here is truncate.
-If a process writes 1MB to a file and then deletes the file,
+If a process writes 1\ MB to a file and then deletes the file,
 it will in fact perform no writeout.
-But it will have been accounted as having caused 1MB of write.
+But it will have been accounted as having caused 1\ MB of write.
 In other words: this field represents the number of bytes which this process
 caused to not happen, by truncating pagecache.
 A task can cause "negative" I/O too.
@@ -1690,7 +1690,7 @@ The "KernelPageSize" line (available since Linux 2.6.29)
 is the page size used by the kernel to back the virtual memory area.
 This matches the size used by the MMU in the majority of cases.
 However, one counter-example occurs on PPC64 kernels
-whereby a kernel using 64kB as a base page size may still use 4kB
+whereby a kernel using 64\ kB as a base page size may still use 4\ kB
 pages for the MMU on older processors.
 To distinguish the two attributes, the "MMUPageSize" line
 (also available since Linux 2.6.29)
@@ -2868,7 +2868,7 @@ binary, GDB can be used to
 examine the current state of any kernel data structures.
 
 The total length of the file is the size of physical memory (RAM) plus
-4KB.
+4\ KB.
 .TP
 .IR /proc/keys " (since Linux 2.6.10)"
 See
@@ -3020,7 +3020,7 @@ applications, without swapping.
 .TP
 .IR Buffers " %lu"
 Relatively temporary storage for raw disk blocks that
-shouldn't get tremendously large (20MB or so).
+shouldn't get tremendously large (20\ MB or so).
 .TP
 .IR Cached " %lu"
 In-memory cache for files read from the disk (the page cache).
@@ -3068,7 +3068,7 @@ It is more eligible to be reclaimed for other purposes.
 .IR HighTotal " %lu"
 (Starting with Linux 2.6.19, \fBCONFIG_HIGHMEM\fP is required.)
 Total amount of highmem.
-Highmem is all memory above ~860MB of physical memory.
+Highmem is all memory above ~860\ MB of physical memory.
 Highmem areas are for use by user-space programs,
 or for the page cache.
 The kernel must use tricks to access
@@ -3174,13 +3174,13 @@ The amount of memory presently allocated on the system.
 The committed memory is a sum of all of the memory which
 has been allocated by processes, even if it has not been
 "used" by them as of yet.
-A process which allocates 1GB of memory (using
+A process which allocates 1\ GB of memory (using
 .BR malloc (3)
-or similar), but touches only 300MB of that memory will show up
-as using only 300MB of memory even if it has the address space
-allocated for the entire 1GB.
+or similar), but touches only 300\ MB of that memory will show up
+as using only 300\ MB of memory even if it has the address space
+allocated for the entire 1\ GB.
 
-This 1GB is memory which has been "committed" to by the VM
+This 1\ GB is memory which has been "committed" to by the VM
 and can be used at any time by the allocating application.
 With strict overcommit enabled on the system (mode 2 in
 .IR /proc/sys/vm/overcommit_memory ),
@@ -3255,11 +3255,11 @@ The maximum number of surplus huge pages is controlled by
 The size of huge pages.
 .TP
 .IR DirectMap4k " %lu (since Linux 2.6.27)"
-Number of bytes of RAM linearly mapped by kernel in 4kB pages.
+Number of bytes of RAM linearly mapped by kernel in 4\ kB pages.
 (x86.)
 .TP
 .IR DirectMap4M " %lu (since Linux 2.6.27)"
-Number of bytes of RAM linearly mapped by kernel in 4MB pages.
+Number of bytes of RAM linearly mapped by kernel in 4\ MB pages.
 (x86 with
 .BR CONFIG_X86_64
 or
@@ -3267,7 +3267,7 @@ or
 enabled.)
 .TP
 .IR DirectMap2M " %lu (since Linux 2.6.27)"
-Number of bytes of RAM linearly mapped by kernel in 2MB pages.
+Number of bytes of RAM linearly mapped by kernel in 2\ MB pages.
 (x86 with neither
 .BR CONFIG_X86_64
 nor
@@ -4714,7 +4714,7 @@ This file
 can be used to query and set the run-time limit
 on the maximum (System V IPC) shared memory segment size that can be
 created.
-Shared memory segments up to 1GB are now supported in the
+Shared memory segments up to 1\ GB are now supported in the
 kernel.
 This value defaults to
 .BR SHMMAX .
@@ -4916,7 +4916,7 @@ This file defines the amount of free memory (in KiB) on the system that
 that should be reserved for users with the capability
 .BR CAP_SYS_ADMIN .
 
-The default value in this file is the minimum of [3% of free pages, 8MiB]
+The default value in this file is the minimum of [3% of free pages, 8\ MiB]
 expressed as KiB.
 The default is intended to provide enough for the superuser
 to log in and kill a process, if necessary,
@@ -4932,7 +4932,7 @@ for the full virtual memory size of the programs used to recover (e.g.,
 and
 .BR top (1))
 Otherwise, the superuser may not be able to log in to recover the system.
-For example, on x86_64 a suitable value is 131072 (128MiB reserved).
+For example, on x86_64 a suitable value is 131072 (128\ MiB reserved).
 
 Changing the value in this file takes effect whenever
 an application requests memory.
@@ -5170,12 +5170,12 @@ and
 is the amount of swap space.
 .RE
 .IP
-For example, on a system with 16GB of physical RAM, 16GB
+For example, on a system with 16\ GB of physical RAM, 16\ GB
 of swap, no space dedicated to huge pages, and an
 .I overcommit_ratio
 of 50, this formula yields a
 .I CommitLimit
-of 24GB.
+of 24\ GB.
 
 Since Linux 3.14, if the value in
 .I /proc/sys/vm/overcommit_kbytes
@@ -5249,7 +5249,7 @@ In this case, the system reserves an amount of memory that is the minimum
 of [3% of current process size,
 .IR user_reserve_kbytes ].
 
-The default value in this file is the minimum of [3% of free pages, 128MiB]
+The default value in this file is the minimum of [3% of free pages, 128\ MiB]
 expressed as KiB.
 
 If the value in this file is set to zero,
diff --git a/man7/bootparam.7 b/man7/bootparam.7
index 5f318a9c5..3fc083ebd 100644
--- a/man7/bootparam.7
+++ b/man7/bootparam.7
@@ -455,12 +455,12 @@ by using the following:
 The first two numbers are specified in units of kB.
 The default
 .I buf_size
-is 32kB, and the maximum size that can be specified is a
-ridiculous 16384kB.
+is 32\ kB, and the maximum size that can be specified is a
+ridiculous 16384\ kB.
 The
 .I write_threshold
 is the value at which the buffer is committed to tape, with a
-default value of 30kB.
+default value of 30\ kB.
 The maximum number of buffers varies
 with the number of drives detected, and has a default of two.
 An example usage would be:
diff --git a/man7/ip.7 b/man7/ip.7
index 2ff17c845..52c3c9c5d 100644
--- a/man7/ip.7
+++ b/man7/ip.7
@@ -534,7 +534,7 @@ take it into account for their packet retransmit strategy.
 
 To bootstrap the path MTU discovery process on unconnected sockets, it
 is possible to start with a big datagram size
-(up to 64K-headers bytes long) and let it shrink by updates of the path MTU.
+(headers up to 64 kilobytes long) and let it shrink by updates of the path MTU.
 
 To get an initial estimate of the
 path MTU, connect a datagram socket to the destination address using
diff --git a/man7/raw.7 b/man7/raw.7
index 10c5d3342..3a1c4bbf9 100644
--- a/man7/raw.7
+++ b/man7/raw.7
@@ -164,7 +164,7 @@ Packet too big.
 Either Path MTU Discovery is enabled (the
 .B IP_MTU_DISCOVER
 socket flag) or the packet size exceeds the maximum allowed IPv4
-packet size of 64KB.
+packet size of 64\ KB.
 .TP
 .B EOPNOTSUPP
 Invalid flag has been passed to a socket call (like
diff --git a/man7/tcp.7 b/man7/tcp.7
index e654f0242..b13df38e8 100644
--- a/man7/tcp.7
+++ b/man7/tcp.7
@@ -142,7 +142,7 @@ extensions.
 These include Protection Against Wrapped
 Sequence Numbers (PAWS), Window Scaling and Timestamps.
 Window scaling allows the use
-of large (> 64K) TCP windows in order to support links with high
+of large (> 64\ K) TCP windows in order to support links with high
 latency or bandwidth.
 To make use of them, the send and receive buffer sizes must be increased.
 They can be set globally with the
@@ -576,7 +576,7 @@ the orphaned connection is reset and a warning is printed.
 This limit exists only to prevent simple denial-of-service attacks.
 Lowering this limit is not recommended.
 Network conditions might require you to increase the number of
-orphans allowed, but note that each orphan can eat up to ~64K
+orphans allowed, but note that each orphan can eat up to ~64\ K
 of unswappable memory.
 The default initial value is set equal to the kernel parameter NR_FILE.
 This initial default is adjusted depending on the memory in the system.
@@ -589,8 +589,8 @@ If this number is exceeded, the kernel will begin
 dropping requests.
 The default value of 256 is increased to
 1024 when the memory present in the system is adequate or
-greater (>= 128Mb), and reduced to 128 for those systems with
-very low memory (<= 32Mb).
+greater (>= 128\ Mb), and reduced to 128 for those systems with
+very low memory (<= 32\ Mb).
 
 Prior to Linux 2.6.20,
 .\" commit 72a3effaf633bcae9034b7e176bdbd78d64a71db
@@ -740,7 +740,7 @@ of these values, depending on memory available in the system.
 .I min
 minimum size of the receive buffer used by each TCP socket.
 The default value is the system page size.
-(On Linux 2.4, the default value is 4K, lowered to
+(On Linux 2.4, the default value is 4\ K, lowered to
 .B PAGE_SIZE
 bytes in low-memory systems.)
 This value
@@ -775,7 +775,7 @@ This is not used to limit the size of the receive buffer declared using
 on a socket.
 The default value is calculated using the formula
 
-    max(87380, min(4MB, \fItcp_mem\fP[1]*PAGE_SIZE/128))
+    max(87380, min(4\ MB, \fItcp_mem\fP[1]*PAGE_SIZE/128))
 
 (On Linux 2.4, the default is 87380*2 bytes,
 lowered to 87380 in low-memory systems).
@@ -912,9 +912,9 @@ TCP Reno in wired networks and throughput over wireless links.
 .\" Since 2.1.36
 Enable RFC\ 1323 TCP window scaling.
 This feature allows the use of a large window
-(> 64K) on a TCP connection, should the other end support it.
+(> 64\ K) on a TCP connection, should the other end support it.
 Normally, the 16 bit window length field in the TCP header
-limits the window size to less than 64K bytes.
+limits the window size to less than 64\ K bytes.
 If larger windows are desired, applications can increase the size of
 their socket buffers and the window scaling option will be employed.
 If
@@ -934,7 +934,7 @@ depending on memory available.
 .I min
 Minimum size of the send buffer used by each TCP socket.
 The default value is the system page size.
-(On Linux 2.4, the default value is 4K bytes.)
+(On Linux 2.4, the default value is 4\ K bytes.)
 This value is used to ensure that in memory pressure mode,
 allocations below this size will still succeed.
 This is not used to bound the size of the send buffer declared using
@@ -947,7 +947,7 @@ This value overwrites the initial default buffer size from
 the generic global
 .I /proc/sys/net/core/wmem_default
 defined for all protocols.
-The default value is 16K bytes.
+The default value is 16\ K bytes.
 .\" True in Linux 2.4 and 2.6
 If larger send buffer sizes are desired, this value
 should be increased (to affect all sockets).
@@ -964,10 +964,10 @@ This is not used to limit the size of the send buffer declared using
 on a socket.
 The default value is calculated using the formula
 
-    max(65536, min(4MB, \fItcp_mem\fP[1]*PAGE_SIZE/128))
+    max(65536, min(4\ MB, \fItcp_mem\fP[1]*PAGE_SIZE/128))
 
-(On Linux 2.4, the default value is 128K bytes,
-lowered 64K depending on low-memory systems.)
+(On Linux 2.4, the default value is 128\ K bytes,
+lowered 64\ K depending on low-memory systems.)
 .RE
 .TP
 .IR tcp_workaround_signed_windows " (Boolean; default: disabled; since Linux 2.6.26)"
diff --git a/man7/units.7 b/man7/units.7
index 7cc373f29..c55fbc86c 100644
--- a/man7/units.7
+++ b/man7/units.7
@@ -107,14 +107,14 @@ But then disk technology changed, and disk sizes became arbitrary numbers.
 After a period of uncertainty all disk manufacturers settled on the
 standard, namely k=1000, M=1000k, G=1000M.
 
-The situation was messy: in the 14k4 modems, k=1000; in the 1.44MB
+The situation was messy: in the 14k4 modems, k=1000; in the 1.44\ MB
 .\" also common: 14.4k modem
 diskettes, M=1024000; and so on.
 In 1998 the IEC approved the standard
 that defines the binary prefixes given above, enabling people
 to be precise and unambiguous.
 
-Thus, today, MB = 1000000B and MiB = 1048576B.
+Thus, today, MB = 1000000\ B and MiB = 1048576\ B.
 
 In the free software world programs are slowly
 being changed to conform.
@@ -122,7 +122,7 @@ When the Linux kernel boots and says
 
 .RS
 .nf
-hda: 120064896 sectors (61473 MB) w/2048KiB Cache
+hda: 120064896 sectors (61473\ MB) w/2048\ KiB Cache
 .fi
 .RE
 
diff --git a/man8/ld.so.8 b/man8/ld.so.8
index ead24e9b2..823ca7dfd 100644
--- a/man8/ld.so.8
+++ b/man8/ld.so.8
@@ -616,14 +616,14 @@ If set to a nonempty string, warn about unresolved symbols.
 .BR LD_PREFER_MAP_32BIT_EXEC " (x86-64 only; since glibc 2.23)"
 According to the Intel Silvermont software optimization guide, for 64-bit
 applications, branch prediction performance can be negatively impacted
-when the target of a branch is more than 4GB away from the branch.
+when the target of a branch is more than 4\ GB away from the branch.
 If this environment variable is set (to any value),
 the dynamic linker
 will first try to map executable pages using the
 .BR mmap (2)
 .BR MAP_32BIT
 flag, and fall back to mapping without that flag if that attempt fails.
-NB: MAP_32BIT will map to the low 2GB (not 4GB) of the address space.
+NB: MAP_32BIT will map to the low 2\ GB (not 4\ GB) of the address space.
 
 Because
 .B MAP_32BIT
-- 
2.14.1

--mP3DRpeJDSE+ciuQ
Content-Type: application/x-gzip
Content-Disposition: attachment; filename="space-between-number-and-unit.diff.gz"
Content-Transfer-Encoding: base64

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

--mP3DRpeJDSE+ciuQ--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
