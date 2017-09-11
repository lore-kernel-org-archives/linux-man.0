From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 10/15] proc.5: update pointer to in-kernel security keys
 documentation
Date: Mon, 11 Sep 2017 05:04:09 +0200
Message-ID: <20170911030409.GA30122@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The file has been moved twice since its mention on the man page.

* man5/proc.5 (.SS Files and directories)
<.TP .IR /proc/[pid]/attr/keycreate>: Amend security keys documentation
reference with the locations in different versions of Linux kernel tree.

Signed-off-by: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man5/proc.5 | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 7af4e02..82f6ec4 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -275,13 +275,19 @@ attribute.
 .TP
 .IR /proc/[pid]/attr/keycreate " (since Linux 2.6.18)"
 .\" commit 4eb582cf1fbd7b9e5f466e3718a59c957e75254e
-.\" /Documentation/keys.txt
 If a process writes a security context into this file,
 all subsequently created keys
 .RB ( add_key (2))
 will be labeled with this context.
 For further information, see the kernel source file
-.IR Documentation/keys.txt .
+.I Documentation/security/keys/core.rst
+(or file
+.\" commit b68101a1e8f0263dbc7b8375d2a7c57c6216fb76
+.I Documentation/security/keys.txt
+on Linux between 3.0 and 4.13, or
+.\" commit d410fa4ef99112386de5f218dd7df7b4fca910b4
+.I Documentation/keys.txt
+before Linux 3.0).
 .TP
 .IR /proc/[pid]/attr/prev " (since Linux 2.6.0)"
 This file contains the security context of the process before the last
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
