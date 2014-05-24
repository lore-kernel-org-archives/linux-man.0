From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] inotify.7: munmap does not lead to inotify events
Date: Sat, 24 May 2014 22:23:47 +0200
Message-ID: <1400963027-17857-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

mmap and msync were already described as not leading to inotify
events.

This patch adds munmap.
I created and executed a test to verify this.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man7/inotify.7 | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/man7/inotify.7 b/man7/inotify.7
index 55e5cab..f719614 100644
--- a/man7/inotify.7
+++ b/man7/inotify.7
@@ -633,9 +633,10 @@ are not monitorable with inotify.
 
 The inotify API does not report file accesses and modifications that
 may occur because of
-.BR mmap (2)
+.BR mmap (2),
+.BR msync (2),
 and
-.BR msync (2).
+.BR munmap (2).
 
 The inotify API identifies affected files by filename.
 However, by the time an application processes an inotify event,
-- 
2.0.0.rc2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
