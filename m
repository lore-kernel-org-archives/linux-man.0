From: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3] proc.5: Add description of CLEAR_REFS_MM_HIWATER_RSS
Date: Sat, 10 Sep 2016 11:16:42 +0900
Message-ID: <20160910021642.2633-1-namhyung@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The Linux kernel commit 695f05593693 ("fs/proc/task_mmu.c: add
user-space support for resetting mm->hiwater_rss (peak RSS)") added a
way to reset peak RSS of a process but missed to update manpage.

Acked-by: Petr Cermak <petrcermak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man5/proc.5 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 14588fe..5f0abad 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -340,7 +340,7 @@ process during the measured interval.
 If one is interested only in inspecting the selected mapping types,
 then the value 2 or 3 can be used instead of 1.
 
-A further value can be written to affect a different bit:
+Further values can be written to affect different properties:
 .RS
 .TP
 4 (since Linux 3.11)
@@ -352,6 +352,11 @@ by the check-point restore system to discover which pages of a process
 have been dirtied since the file
 .IR /proc/[pid]/clear_refs
 was written to.
+.TP
+5 (since Linux 4.0)
+.\" Internally: CLEAR_REFS_MM_HIWATER_RSS
+Reset the peak resident set size ("high water mark") to the process'
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
