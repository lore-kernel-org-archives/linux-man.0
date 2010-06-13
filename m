From: Francesco Cosoleto <cosoleto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] getpriority.2, nice.2: Move renice from section 8 to section 1
Date: Sun, 13 Jun 2010 11:12:42 +0200
Message-ID: <1276420363-6226-1-git-send-email-cosoleto@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Francesco Cosoleto <cosoleto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Francesco Cosoleto <cosoleto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man2/getpriority.2 |    2 +-
 man2/nice.2        |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/getpriority.2 b/man2/getpriority.2
index 1168a63..302d88a 100644
--- a/man2/getpriority.2
+++ b/man2/getpriority.2
@@ -224,7 +224,7 @@ defined in
 .BR nice (1),
 .BR fork (2),
 .BR capabilities (7),
-.BR renice (8)
+.BR renice (1)
 .sp
 .I Documentation/scheduler/sched-nice-design.txt
 in the kernel source tree (since Linux 2.6.23).
diff --git a/man2/nice.2 b/man2/nice.2
index 407145b..c7e1d7d 100644
--- a/man2/nice.2
+++ b/man2/nice.2
@@ -108,4 +108,4 @@ returns \-1.
 .BR getpriority (2),
 .BR setpriority (2),
 .BR capabilities (7),
-.BR renice (8)
+.BR renice (1)
-- 
1.6.4.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
