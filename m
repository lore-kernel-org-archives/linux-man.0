From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] proc(5): clarify /proc/pid/environ behavior
Date: Wed, 15 Feb 2017 17:16:54 -0500
Message-ID: <20170215221654.10293-1-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

From: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Make sure people don't try to rely on this when there are no guarantees
the target process respects it.

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man5/proc.5 | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 0a3503f99360..89a7c09ad5af 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -477,7 +477,7 @@ check; see
 .BR ptrace (2).
 .TP
 .I /proc/[pid]/environ
-This file contains the environment for the process.
+This file contains the initial environment for the process.
 The entries are separated by null bytes (\(aq\\0\(aq),
 and there may be a null byte at the end.
 Thus, to print out the environment of process 1, you would do:
@@ -488,6 +488,19 @@ Thus, to print out the environment of process 1, you would do:
 .fi
 .in
 
+Once a process starts modifying its environment
+(e.g. by calling functions such as
+.BR putenv (3)
+or modifying the
+.BR environ (7)
+variable directly),
+this file will not be kept up to date.
+
+Further, a process may change the memory this points to by calling
+.BR prctl (2)
+and using operations such as
+.BR PR_SET_MM_ENV_START .
+
 Permission to access this file is governed by a ptrace access mode
 .B PTRACE_MODE_READ_FSCREDS
 check; see
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
