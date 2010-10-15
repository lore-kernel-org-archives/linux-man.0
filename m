From: Lucian Adrian Grijincu <lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] unshare.2: Document CLONE_NEWNET
Date: Fri, 15 Oct 2010 04:25:54 +0300
Message-ID: <1287105955-32499-1-git-send-email-lucian.grijincu@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lucian Adrian Grijincu <lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Lucian Adrian Grijincu <lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man2/unshare.2 |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/man2/unshare.2 b/man2/unshare.2
index 051ebf5..2e43806 100644
--- a/man2/unshare.2
+++ b/man2/unshare.2
@@ -93,6 +93,10 @@ its namespace which is not shared with any other process.
 Specifying this flag automatically implies
 .B CLONE_FS
 as well.
+.TP
+.B CLONE_NEWNET " (since Linux 2.6.24)"
+Unshare the old network namespace. Specifying this flag
+will move the process into a new network namespace.
 .\" As at 2.6.16, the following forced implications also apply,
 .\" although the relevant flags are not yet implemented.
 .\" If CLONE_THREAD is set force CLONE_VM.
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
