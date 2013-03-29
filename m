From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] proc.5: tfix
Date: Fri, 29 Mar 2013 17:55:42 -0400
Message-ID: <1364594142-24998-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man5/proc.5 |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 22b7cd0..adbf978 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -390,7 +390,7 @@ is the device
 .I inode
 is the inode on that device.
 0 indicates that no inode is associated with the memory region,
-as would be ithe case with BSS (uninitialized data).
+as would be the case with BSS (uninitialized data).
 
 The
 .I pathname
@@ -406,7 +406,7 @@ There are additional helpful pseudo-paths:
 .RS 12
 .TP
 .IR [stack]
-The initial process's (also known as the main thread's) stack
+The initial process's (also known as the main thread's) stack.
 .TP
 .IR [stack:<tid>] " (since Linux 3.4)"
 .\" commit b76437579d1344b612cf1851ae610c636cec7db0
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
