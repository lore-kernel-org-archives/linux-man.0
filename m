From: Marcus Folkesson <marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] proc.5: update description of /proc/<pid>/oom_score
Date: Fri, 17 Nov 2017 13:09:44 +0100
Message-ID: <20171117120944.14300-1-marcus.folkesson@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

After Linux 2.6.36, the heuristic calculation of oom_score has changed
to only consider used memory and CAP_SYS_ADMIN.

See commit a63d83f427fbce97a6cea0db2e64b0eb8435cd10 in kernel tree.

Signed-off-by: Marcus Folkesson <marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man5/proc.5 | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 82d4a0646..4e44b8fba 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -1395,7 +1395,9 @@ Since Linux 2.6.36, use of this file is deprecated in favor of
 .IR /proc/[pid]/oom_score_adj .
 .TP
 .IR /proc/[pid]/oom_score " (since Linux 2.6.11)"
-.\" See mm/oom_kill.c::badness() in the 2.6.25 sources
+.\" See mm/oom_kill.c::badness() in pre 2.6.36 sources
+.\" See mm/oom_kill.c::oom_badness() after 2.6.36
+.\" commit a63d83f427fbce97a6cea0db2e64b0eb8435cd10
 This file displays the current score that the kernel gives to
 this process for the purpose of selecting a process
 for the OOM-killer.
@@ -1403,7 +1405,16 @@ A higher score means that the process is more likely to be
 selected by the OOM-killer.
 The basis for this score is the amount of memory used by the process,
 with increases (+) or decreases (\-) for factors including:
-.\" See mm/oom_kill.c::badness() in the 2.6.25 sources
+.\" See mm/oom_kill.c::badness() in pre 2.6.36 sources
+.\" See mm/oom_kill.c::oom_badness() after 2.6.36
+.\" commit a63d83f427fbce97a6cea0db2e64b0eb8435cd10
+.RS
+.IP * 2
+whether the process is privileged (\-);
+.\" More precisely, if it has CAP_SYS_ADMIN or (pre 2.6.36) CAP_SYS_RESOURCE
+.RE
+.IP
+Before kernel 2.6.36 the following factors were also used in the calculation of oom_score:
 .RS
 .IP * 2
 whether the process creates a lot of children using
@@ -1413,10 +1424,7 @@ whether the process creates a lot of children using
 whether the process has been running a long time,
 or has used a lot of CPU time (\-);
 .IP *
-whether the process has a low nice value (i.e., > 0) (+);
-.IP *
-whether the process is privileged (\-); and
-.\" More precisely, if it has CAP_SYS_ADMIN or CAP_SYS_RESOURCE
+whether the process has a low nice value (i.e., > 0) (+); and
 .IP *
 whether the process is making direct hardware access (\-).
 .\" More precisely, if it has CAP_SYS_RAWIO
-- 
2.13.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
