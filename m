From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] cpuset.7: tfix
Date: Sat, 21 Jun 2014 09:16:01 +0400
Message-ID: <1403327761-4115-1-git-send-email-yuray@komyakino.ru>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man7/cpuset.7 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man7/cpuset.7 b/man7/cpuset.7
index 3c74dac..1b89d79 100644
--- a/man7/cpuset.7
+++ b/man7/cpuset.7
@@ -247,7 +247,7 @@ format of
 Flag (0 or 1).
 If set (1), the cpuset has exclusive use of
 its memory nodes (no sibling or cousin may overlap).
-Also if set (1), the cpuset is a \fBHardwall\fR cpuset (see below.)
+Also if set (1), the cpuset is a \fBHardwall\fR cpuset (see below).
 By default this is off (0).
 Newly created cpusets also initially default this to off (0).
 
@@ -261,7 +261,7 @@ of that cpuset's parent cpuset.
 .TP
 .IR cpuset.mem_hardwall " (since Linux 2.6.26)"
 Flag (0 or 1).
-If set (1), the cpuset is a \fBHardwall\fR cpuset (see below.)
+If set (1), the cpuset is a \fBHardwall\fR cpuset (see below).
 Unlike \fBmem_exclusive\fR,
 there is no constraint on whether cpusets
 marked \fBmem_hardwall\fR may have overlapping
-- 
2.0.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
