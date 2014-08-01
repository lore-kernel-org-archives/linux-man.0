From: Rahul Bedarkar <rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] open.2: wfix
Date: Fri,  1 Aug 2014 23:17:26 +0530
Message-ID: <1406915246-8773-1-git-send-email-rahulbedarkar89@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rahul Bedarkar <rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Rahul Bedarkar <rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man2/open.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/open.2 b/man2/open.2
index c413d96..84cbf0c 100644
--- a/man2/open.2
+++ b/man2/open.2
@@ -1176,7 +1176,7 @@ Data integrity completion can reduce the number of disk operations
 that are required for applications that don't need the guarantees
 of file integrity completion.
 
-To understand the difference between the the two types of completion,
+To understand the difference between two types of completion,
 consider two pieces of file metadata:
 the file last modification timestamp
 .RI ( st_mtime )
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
