From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] cpuset: add missing 'cpuset.' prefix some flags
Date: Mon,  4 Feb 2013 22:58:02 +0100
Message-ID: <1360015082-1322-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

See fix 4160df82b3 for Documentation/cgroups/cpusets.txt in kernel
---
 man7/cpuset.7 |   98 ++++++++++++++++++++++++++++-----------------------------
 1 file changed, 49 insertions(+), 49 deletions(-)

diff --git a/man7/cpuset.7 b/man7/cpuset.7
index 4803b8f..4cc53ed 100644
--- a/man7/cpuset.7
+++ b/man7/cpuset.7
@@ -192,7 +192,7 @@ and all child cpuset directories have been removed.
 See the \fBNotify On Release\fR section, below.
 .\" ====================== cpus ======================
 .TP
-.I cpus
+.I cpuset.cpus
 List of the physical numbers of the CPUs on which processes
 in that cpuset are allowed to execute.
 See \fBList Format\fR below for a description of the
@@ -205,7 +205,7 @@ writing a new list to its
 file.
 .\" ==================== cpu_exclusive ====================
 .TP
-.I cpu_exclusive
+.I cpuset.cpu_exclusive
 Flag (0 or 1).
 If set (1), the cpuset has exclusive use of
 its CPUs (no sibling or cousin cpuset may overlap CPUs).
@@ -234,7 +234,7 @@ of any cpuset are always a subset of the
 of its parent cpuset.
 .\" ====================== mems ======================
 .TP
-.I mems
+.I cpuset.mems
 List of memory nodes on which processes in this cpuset are
 allowed to allocate memory.
 See \fBList Format\fR below for a description of the
@@ -242,7 +242,7 @@ format of
 .IR mems .
 .\" ==================== mem_exclusive ====================
 .TP
-.I mem_exclusive
+.I cpuset.mem_exclusive
 Flag (0 or 1).
 If set (1), the cpuset has exclusive use of
 its memory nodes (no sibling or cousin may overlap).
@@ -258,7 +258,7 @@ nodes of any cpuset are always a subset of the memory nodes
 of that cpuset's parent cpuset.
 .\" ==================== mem_hardwall ====================
 .TP
-.IR mem_hardwall " (since Linux 2.6.26)"
+.IR cpuset.mem_hardwall " (since Linux 2.6.26)"
 Flag (0 or 1).
 If set (1), the cpuset is a \fBHardwall\fR cpuset (see below.)
 Unlike \fBmem_exclusive\fR,
@@ -269,14 +269,14 @@ By default this is off (0).
 Newly created cpusets also initially default this to off (0).
 .\" ==================== memory_migrate ====================
 .TP
-.IR memory_migrate " (since Linux 2.6.16)"
+.IR cpuset.memory_migrate " (since Linux 2.6.16)"
 Flag (0 or 1).
 If set (1), then memory migration is enabled.
 By default this is off (0).
 See the \fBMemory Migration\fR section, below.
 .\" ==================== memory_pressure ====================
 .TP
-.IR memory_pressure " (since Linux 2.6.16)"
+.IR cpuset.memory_pressure " (since Linux 2.6.16)"
 A measure of how much memory pressure the processes in this
 cpuset are causing.
 See the \fBMemory Pressure\fR section, below.
@@ -289,7 +289,7 @@ See the
 section, below.
 .\" ================= memory_pressure_enabled =================
 .TP
-.IR memory_pressure_enabled " (since Linux 2.6.16)"
+.IR cpuset.memory_pressure_enabled " (since Linux 2.6.16)"
 Flag (0 or 1).
 This file is only present in the root cpuset, normally
 .IR /dev/cpuset .
@@ -301,7 +301,7 @@ See the
 \fBMemory Pressure\fR section, below.
 .\" ================== memory_spread_page ==================
 .TP
-.IR memory_spread_page " (since Linux 2.6.17)"
+.IR cpuset.memory_spread_page " (since Linux 2.6.17)"
 Flag (0 or 1).
 If set (1), pages in the kernel page cache
 (file-system buffers) are uniformly spread across the cpuset.
@@ -311,7 +311,7 @@ newly created cpusets.
 See the \fBMemory Spread\fR section, below.
 .\" ================== memory_spread_slab ==================
 .TP
-.IR memory_spread_slab " (since Linux 2.6.17)"
+.IR cpuset.memory_spread_slab " (since Linux 2.6.17)"
 Flag (0 or 1).
 If set (1), the kernel slab caches
 for file I/O (directory and inode structures) are
@@ -322,7 +322,7 @@ newly created cpusets.
 See the \fBMemory Spread\fR section, below.
 .\" ================== sched_load_balance ==================
 .TP
-.IR sched_load_balance " (since Linux 2.6.24)"
+.IR cpuset.sched_load_balance " (since Linux 2.6.24)"
 Flag (0 or 1).
 If set (1, the default) the kernel will
 automatically load balance processes in that cpuset over
@@ -336,7 +336,7 @@ flag set.
 See \fBScheduler Load Balancing\fR, below, for further details.
 .\" ================== sched_relax_domain_level ==================
 .TP
-.IR sched_relax_domain_level " (since Linux 2.6.26)"
+.IR cpuset.sched_relax_domain_level " (since Linux 2.6.26)"
 Integer, between \-1 and a small positive value.
 The
 .I sched_relax_domain_level
@@ -529,7 +529,7 @@ It's up to the batch manager or other user code to decide
 what action to take if it detects signs of memory pressure.
 .PP
 Unless memory pressure calculation is enabled by setting the pseudo-file
-.IR /dev/cpuset/memory_pressure_enabled ,
+.IR /dev/cpuset/cpuset.memory_pressure_enabled ,
 it is not computed for any cpuset, and reads from any
 .I memory_pressure
 always return zero, as represented by the ASCII string "0\en".
@@ -571,7 +571,7 @@ by simply dropping them, though if that page is needed again, it
 will have to be reread from disk.
 .PP
 The
-.I memory_pressure
+.I cpuset.memory_pressure
 file provides an integer number representing the recent (half-life of
 10 seconds) rate of entries to the direct reclaim code caused by any
 process in the cpuset, in units of reclaims attempted per second,
@@ -582,19 +582,19 @@ There are two Boolean flag files per cpuset that control where the
 kernel allocates pages for the file-system buffers and related
 in-kernel data structures.
 They are called
-.I memory_spread_page
+.I cpuset.memory_spread_page
 and
-.IR memory_spread_slab .
+.IR cpuset.memory_spread_slab .
 .PP
 If the per-cpuset Boolean flag file
-.I memory_spread_page
+.I cpuset.memory_spread_page
 is set, then
 the kernel will spread the file-system buffers (page cache) evenly
 over all the nodes that the faulting process is allowed to use, instead
 of preferring to put those pages on the node where the process is running.
 .PP
 If the per-cpuset Boolean flag file
-.I memory_spread_slab
+.I cpuset.memory_spread_slab
 is set,
 then the kernel will spread some file-system-related slab caches,
 such as those for inodes and directory entries, evenly over all the nodes
@@ -633,9 +633,9 @@ memory policy most recently specified by these calls is automatically
 reapplied.
 .PP
 Both
-.I memory_spread_page
+.I cpuset.memory_spread_page
 and
-.I memory_spread_slab
+.I cpuset.memory_spread_slab
 are Boolean flag files.
 By default they contain "0", meaning that the feature is off
 for that cpuset.
@@ -662,7 +662,7 @@ thread initializing or reading in the data set.
 .\" ================== Memory Migration ==================
 .SS Memory Migration
 Normally, under the default setting (disabled) of
-.IR memory_migrate ,
+.IR cpuset.memory_migrate ,
 once a page is allocated (given a physical page
 of main memory) then that page stays on whatever node it
 was allocated, so long as it remains allocated, even if the
@@ -1014,10 +1014,10 @@ is currently mounted.
 .SH WARNINGS
 .SS Enabling memory_pressure
 By default, the per-cpuset file
-.I memory_pressure
+.I cpuset.memory_pressure
 always contains zero (0).
 Unless this feature is enabled by writing "1" to the pseudo-file
-.IR /dev/cpuset/memory_pressure_enabled ,
+.IR /dev/cpuset/cpuset.memory_pressure_enabled ,
 the kernel does
 not compute per-cpuset
 .IR memory_pressure .
@@ -1035,7 +1035,7 @@ For example, if the command:
 .in +4n
 .nf
 
-echo 19 > mems
+echo 19 > cpuset.mems
 
 .fi
 .in
@@ -1052,7 +1052,7 @@ errors, as in the example:
 .in +4n
 .nf
 
-/bin/echo 19 > mems
+/bin/echo 19 > cpuset.mems
 /bin/echo: write error: Invalid argument
 .fi
 .in
@@ -1129,16 +1129,16 @@ not already in its parent.
 .B EACCES
 Attempted to set, using
 .BR write (2),
-.I cpu_exclusive
+.I cpuset.cpu_exclusive
 or
-.I mem_exclusive
+.I cpuset.mem_exclusive
 on a cpuset whose parent lacks the same setting.
 .TP
 .B EACCES
 Attempted to
 .BR write (2)
 a
-.I memory_pressure
+.I cpuset.memory_pressure
 file.
 .TP
 .B EACCES
@@ -1190,18 +1190,18 @@ attribute of that cpuset or any of its siblings.
 Attempted to
 .BR write (2)
 an empty
-.I cpus
+.I cpuset.cpus
 or
-.I mems
+.I cpuset.mems
 list to a cpuset which has attached processes or child cpusets.
 .TP
 .B EINVAL
 Attempted to
 .BR write (2)
 a
-.I cpus
+.I cpuset.cpus
 or
-.I mems
+.I cpuset.mems
 list which included a range with the second number smaller than
 the first number.
 .TP
@@ -1209,30 +1209,30 @@ the first number.
 Attempted to
 .BR write (2)
 a
-.I cpus
+.I cpuset.cpus
 or
-.I mems
+.I cpuset.mems
 list which included an invalid character in the string.
 .TP
 .B EINVAL
 Attempted to
 .BR write (2)
 a list to a
-.I cpus
+.I cpuset.cpus
 file that did not include any online CPUs.
 .TP
 .B EINVAL
 Attempted to
 .BR write (2)
 a list to a
-.I mems
+.I cpuset.mems
 file that did not include any online memory nodes.
 .TP
 .B EINVAL
 Attempted to
 .BR write (2)
 a list to a
-.I mems
+.I cpuset.mems
 file that included a node that held no memory.
 .TP
 .B EIO
@@ -1296,18 +1296,18 @@ the process ID (PID)
 of a process to a cpuset
 .I tasks
 file when the cpuset had an empty
-.I cpus
+.I cpuset.cpus
 or empty
-.I mems
+.I cpuset.mems
 setting.
 .TP
 .B ENOSPC
 Attempted to
 .BR write (2)
 an empty
-.I cpus
+.I cpuset.cpus
 or
-.I mems
+.I cpuset.mems
 setting to a cpuset that
 has tasks attached.
 .TP
@@ -1321,9 +1321,9 @@ Attempted to remove a file from a cpuset directory.
 .TP
 .B ERANGE
 Specified a
-.I cpus
+.I cpuset.cpus
 or
-.I mems
+.I cpuset.mems
 list to the kernel which included a number too large for the kernel
 to set in its bitmasks.
 .TP
@@ -1349,7 +1349,7 @@ can be passed in the argument
 .IR pid .
 .\" ================== BUGS ==================
 .SH BUGS
-.I memory_pressure
+.I cpuset.memory_pressure
 cpuset files can be opened
 for writing, creation, or truncation, but then the
 .BR write (2)
@@ -1393,8 +1393,8 @@ and then attach the current shell to that cpuset.
 .RB "$" " cd /dev/cpuset"
 .RB "$" " mkdir Charlie"
 .RB "$" " cd Charlie"
-.RB "$" " /bin/echo 2-3 > cpus"
-.RB "$" " /bin/echo 1 > mems"
+.RB "$" " /bin/echo 2-3 > cpuset.cpus"
+.RB "$" " /bin/echo 1 > cpuset.mems"
 .RB "$" " /bin/echo $$ > tasks"
 # The current shell is now running in cpuset Charlie
 # The next line should display '/Charlie'
@@ -1439,9 +1439,9 @@ The following sequence of commands accomplishes this.
 .RB "$" " cd /dev/cpuset"
 .RB "$" " mkdir beta"
 .RB "$" " cd beta"
-.RB "$" " /bin/echo 16-19 > cpus"
-.RB "$" " /bin/echo 8-9 > mems"
-.RB "$" " /bin/echo 1 > memory_migrate"
+.RB "$" " /bin/echo 16-19 > cpuset.cpus"
+.RB "$" " /bin/echo 8-9 > cpuset.mems"
+.RB "$" " /bin/echo 1 > cpuset.memory_migrate"
 .RB "$" " while read i; do /bin/echo $i; done < ../alpha/tasks > tasks"
 .fi
 .in
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
