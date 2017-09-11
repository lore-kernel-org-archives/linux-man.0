From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 07/15] initrd.4, proc.5, bootparam.7: update pointer to
 in-kernel initrd documentation
Date: Mon, 11 Sep 2017 05:04:03 +0200
Message-ID: <20170911030403.GA30008@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Linux commit v4.10-rc1~40^2~86^2~4 moves initrd documentation from
Documentation/initrd.txt to Documentation/admin-quide/initrd.rst.

* man4/initrd.4 (.SS Changing the normal root filesystem, .SH SEE ALSO):
Amend pointer to in-kernel initrd documentation with change introduced
in Linux 4.10 (move to Documentation/admin-guide/initrd.rst).
* man5/proc.5 (.SS Files and directories)
<.TP .I /proc/sys/kernel/real-root-dev>: Likewise.
* man7/bootparam.7 (.SS Boot arguments for ramdisk use)
<.TP .B 'noinitrd'>: Likewise.

Signed-off-by: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man4/initrd.4    | 8 ++++++++
 man5/proc.5      | 6 +++++-
 man7/bootparam.7 | 6 +++++-
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/man4/initrd.4 b/man4/initrd.4
index 70ef9d3..76b5bbf 100644
--- a/man4/initrd.4
+++ b/man4/initrd.4
@@ -312,7 +312,11 @@ The use of
 .I /proc/sys/kernel/real-root-dev
 to change the root filesystem is obsolete.
 See the Linux kernel source file
+.I Documentation/admin\-guide/initrd.rst
+.\" commit 9d85025b0418163fae079c9ba8f8445212de8568
+(or
 .I Documentation/initrd.txt
+before Linux 4.10)
 as well as
 .BR pivot_root (2)
 and
@@ -486,6 +490,10 @@ The behavior may change in future versions of the Linux kernel.
 .BR freeramdisk (8),
 .BR rdev (8)
 .PP
+.I Documentation/admin\-guide/initrd.rst
+.\" commit 9d85025b0418163fae079c9ba8f8445212de8568
+(or
 .I Documentation/initrd.txt
+before Linux 4.10)
 in the Linux kernel source tree, the LILO documentation,
 the LOADLIN documentation, the SYSLINUX documentation
diff --git a/man5/proc.5 b/man5/proc.5
index c710926..136a2fb 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -4615,7 +4615,11 @@ This value is the default if the kernel was not configured with
 .TP
 .I /proc/sys/kernel/real-root-dev
 This file is documented in the Linux kernel source file
-.IR Documentation/initrd.txt .
+.I Documentation/admin\-guide/initrd.rst
+.\" commit 9d85025b0418163fae079c9ba8f8445212de8568
+(or
+.I Documentation/initrd.txt
+before Linux 4.10).
 .TP
 .IR /proc/sys/kernel/reboot-cmd " (Sparc only) "
 This file seems to be a way to give an argument to the SPARC
diff --git a/man7/bootparam.7 b/man7/bootparam.7
index 92c9441..c6f8735 100644
--- a/man7/bootparam.7
+++ b/man7/bootparam.7
@@ -378,7 +378,11 @@ the usual boot sequence (e.g., invocation of
 is performed.
 .IP
 For a detailed description of the initrd feature, see the kernel source file
-.IR Documentation/initrd.txt .
+.I Documentation/admin\-guide/initrd.rst
+.\" commit 9d85025b0418163fae079c9ba8f8445212de8568
+(or
+.I Documentation/initrd.txt
+before Linux 4.10).
 .IP
 The 'noinitrd' option tells the kernel that although it was compiled for
 operation with initrd, it should not go through the above steps, but
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
