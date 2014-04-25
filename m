From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH] fanotify: fanotify_mark: missing period in BUGS
Date: Fri, 25 Apr 2014 16:44:48 +0200
Message-ID: <1398437088-6950-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man2/fanotify_mark.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/fanotify_mark.2 b/man2/fanotify_mark.2
index ee6c909..693eff8 100644
--- a/man2/fanotify_mark.2
+++ b/man2/fanotify_mark.2
@@ -307,7 +307,7 @@ contains
 .I dfd
 and
 .I pathname
-must indicate a filesystem object, even though this object is not used
+must indicate a filesystem object, even though this object is not used.
 .IP *
 .\" FIXME: Patch is in next-20140424.
 .BR readdir (2)
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
