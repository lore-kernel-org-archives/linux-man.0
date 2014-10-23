From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] fanotify.7: double mounted paths
Date: Thu, 23 Oct 2014 22:09:18 +0200
Message-ID: <1414094958-3584-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Unfortunately fanotify does not inform listeners for all paths
under which a touched file system object is visible
but only the listener using the same path as the process
touching the file system object.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man7/fanotify.7 | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/man7/fanotify.7 b/man7/fanotify.7
index bc5a11c..7f915c2 100644
--- a/man7/fanotify.7
+++ b/man7/fanotify.7
@@ -488,6 +488,14 @@ In this case, events are lost.
 As of Linux 3.17,
 the following bugs exist:
 .IP * 3
+On Linux a file system object may be accessible through multiple paths,
+e.g. a part of the file system may be remounted using
+.B mount (8)
+--bind.
+A listener that marked a mount will only be notified of events that were
+triggered for a file system object using the same mount.
+Any other event will pass unnoticed.
+.IP *
 .\" FIXME . A patch was proposed.
 When an event is generated,
 no check is made to see whether the user ID of the
-- 
2.1.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
