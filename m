From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 12/15] proc.5: update pointer to in-kernel MTRR documentation
Date: Mon, 11 Sep 2017 05:04:14 +0200
Message-ID: <20170911030414.GA30199@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The location of the file has been changed in Linux commit
v2.6.28-rc1~734^2^8~3.

* man5/proc.5 (.SS Files and directories) <.TP .I /proc/mtrr>: Amend
pointer to in-kernel MTRR documentation with the location change
happened in Linux 2.6.28.

Signed-off-by: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man5/proc.5 | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/man5/proc.5 b/man5/proc.5
index 9c62ee2..f469d1c 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -3319,7 +3319,11 @@ The format of this file is documented in
 .I /proc/mtrr
 Memory Type Range Registers.
 See the Linux kernel source file
+.I Documentation/x86/mtrr.txt
+.\" commit 7225e75144b9718cbbe1820d9c011c809d5773fd
+(or
 .I Documentation/mtrr.txt
+before Linux 2.6.28)
 for details.
 .TP
 .I /proc/net
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
