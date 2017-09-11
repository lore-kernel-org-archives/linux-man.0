From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 13/15] proc.5: update pointer to in-kernel SysRq documentation
Date: Mon, 11 Sep 2017 05:04:16 +0200
Message-ID: <20170911030416.GA30235@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The location has been changed in Linux commit v4.10-rc1~40^2~86^2~4.

* man5/proc.5 (.SS Files and directories)
<.TP .I /proc/sys/kernel/sysrq, .TP .IR /proc/sysrq-trigger>: Amend
pointer to Documentation/sysrq.txt with change introduced in Linux 4.10
(move to Documentation/admin-guide/sysrq.rst).

Signed-off-by: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man5/proc.5 | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/man5/proc.5 b/man5/proc.5
index f469d1c..110a2b5 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -4865,7 +4865,11 @@ This file is present only if the
 .B CONFIG_MAGIC_SYSRQ
 kernel configuration option is enabled.
 For further details see the Linux kernel source file
-.IR Documentation/sysrq.txt .
+.I Documentation/admin\-guide/sysrq.rst
+.\" commit 9d85025b0418163fae079c9ba8f8445212de8568
+(or
+.I Documentation/sysrq.txt
+before Linux 4.10).
 .TP
 .I /proc/sys/kernel/version
 This file contains a string such as:
@@ -5308,7 +5312,11 @@ typing ALT-SysRq-<character> (see the description of
 This file is normally writable only by
 .IR root .
 For further details see the Linux kernel source file
-.IR Documentation/sysrq.txt .
+.I Documentation/admin\-guide/sysrq.rst
+.\" commit 9d85025b0418163fae079c9ba8f8445212de8568
+(or
+.I Documentation/sysrq.txt
+before Linux 4.10).
 .TP
 .I /proc/sysvipc
 Subdirectory containing the pseudo-files
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
