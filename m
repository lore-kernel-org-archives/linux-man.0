From: "Dr. Tobias Quathamer" <toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] open.2: tfix
Date: Mon,  2 May 2016 21:42:03 +0200
Message-ID: <1462218123-11111-1-git-send-email-toddy@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man2/open.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/open.2 b/man2/open.2
index 0ff0865..012d0c4 100644
--- a/man2/open.2
+++ b/man2/open.2
@@ -1587,7 +1587,7 @@ is ignored).
 .BR unlink (2),
 .BR write (2),
 .BR fopen (3),
-.BR acl (5)
+.BR acl (5),
 .BR fifo (7),
 .BR path_resolution (7),
 .BR symlink (7)
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
