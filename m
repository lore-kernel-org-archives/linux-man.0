From: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] proc.5: Add description of CLEAR_REFS_MM_HIWATER_RSS
Date: Thu,  8 Sep 2016 00:04:39 +0900
Message-ID: <20160907150439.21524-1-namhyung@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Petr Cermak <petrcermak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The Linux kernel commit 695f05593693 ("fs/proc/task_mmu.c: add
user-space support for resetting mm->hiwater_rss (peak RSS)") added a
way to reset peak RSS of a process but missed to update manpage.

Cc: Petr Cermak <petrcermak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man5/proc.5 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man5/proc.5 b/man5/proc.5
index 14588fe..5cb3c85 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -352,6 +352,11 @@ by the check-point restore system to discover which pages of a process
 have been dirtied since the file
 .IR /proc/[pid]/clear_refs
 was written to.
+.TP
+5 (since Linux 4.0)
+.\" Internally: CLEAR_REFS_MM_HIWATER_RSS
+Reset the peak resident set size ("high water mark") to the process's
+current value.
 .RE
 .IP
 Writing any value to
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
