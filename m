From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] fanotify.7: clarify effects of file moves
Date: Thu,  6 Aug 2015 22:49:43 +0200
Message-ID: <1438894183-3979-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

If files or directories are moved to other mounts the inode is
deleted. Fanotify marks are lost.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man7/fanotify.7 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man7/fanotify.7 b/man7/fanotify.7
index 54b1ea6..f63fb51 100644
--- a/man7/fanotify.7
+++ b/man7/fanotify.7
@@ -91,10 +91,10 @@ ignore mask and the file cache entry can be updated.
 .PP
 The entries in the fanotify notification groups refer to files and
 directories via their inode number and to mounts via their mount ID.
-If files or directories are renamed or moved,
+If files or directories are renamed or moved within the same mount,
 the respective entries survive.
-If files or directories are deleted or mounts are unmounted,
-the corresponding entries are deleted.
+If files or directories are deleted or moved to another mount or if mounts are
+unmounted, the corresponding entries are deleted.
 .SS The event queue
 As events occur on the filesystem objects monitored by a notification group,
 the fanotify system generates events that are collected in a queue.
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
