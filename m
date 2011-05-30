From: ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org (Eric W. Biederman)
Subject: [PATCH 2/2] proc.5: Document /proc/[pid]/ns/
Date: Sun, 29 May 2011 20:17:49 -0700
Message-ID: <m1lixoj2qq.fsf@fess.ebiederm.org>
References: <m1r57gj2sh.fsf@fess.ebiederm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m1r57gj2sh.fsf-+imSwln9KH6u2/kzUuoCbdi2O/JbrIOy@public.gmane.org> (Eric W. Biederman's message
	of "Sun, 29 May 2011 20:16:46 -0700")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Signed-off-by: Eric W. Biederman <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
---
 man5/proc.5 |   44 ++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 44 insertions(+), 0 deletions(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 7c5ca4e..7ff82c4 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -476,6 +476,50 @@ information via this field.
 .IP
 This file is only readable by the owner of the process.
 .TP
+.IR /proc/[pid]/ns/ " (since Linux 3.0)"
+This is a subdirectory containing one entry for each namespace that
+supports being manipulated by
+.BR setns(2).
+.TP
+.IR /proc/[pid]/ns/ipc " (since Linux 3.0)"
+Bind mounting this file to somewhere else in the filesystem keeps
+the ipc namespace of the process specified by 
+.I pid
+alive even if all of the processes currently in that ipc namespace exit.
+
+Opening this file returnes a file handle for the ipc namespace
+of the process specified by
+.I pid,
+that keeps the ipc namespace alive while the file is open and that can
+be passed to
+.BR setns(2).
+.TP
+.IR /proc/[pid]/ns/net " (since Linux 3.0)"
+Bind mounting this file to somewhere else in the filesystem keeps
+the network namespace of the process specified by 
+.I pid
+alive even if all of the processes currently in that network namespace exit.
+
+Opening this file returnes a file handle for the network namespace
+of the process specified by
+.I pid,
+that keeps the network namespace alive while the file is open and that can
+be passed to
+.BR setns(2).
+.TP
+.IR /proc/[pid]/ns/uts " (since Linux 3.0)"
+Bind mounting this file to somewhere else in the filesystem keeps
+the uts namespace of the process specified by 
+.I pid
+alive even if all of the processes currently in that uts namespace exit.
+
+Opening this file returnes a file handle for the uts namespace
+of the process specified by
+.I pid,
+that keeps the uts namespace alive while the file is open and that can
+be passed to
+.BR setns(2).
+.TP
 .IR /proc/[pid]/numa_maps " (since Linux 2.6.14)"
 See
 .BR numa (7).
-- 
1.7.5.1.217.g4e3aa

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
