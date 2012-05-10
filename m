From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] proc.5: ffix
Date: Thu, 10 May 2012 11:57:28 -0400
Message-ID: <1336665448-7303-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man5/proc.5 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man5/proc.5 b/man5/proc.5
index ace0941..2ba1daa 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -95,7 +95,7 @@ The format is one \fIunsigned long\fP ID
 plus one \fIunsigned long\fP value for each entry.
 The last entry contains two zeros.
 .TP
-.I /proc/[pid]/cgroup " (since Linux 2.6.24)"
+.IR /proc/[pid]/cgroup " (since Linux 2.6.24)"
 .\" 	  Info in Documentation/cgroups/cgroups.txt
 This file describes control groups to which the process/task belongs.
 For each cgroup hierarchy there is one entry containing
-- 
1.7.10

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
