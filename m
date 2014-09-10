From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] inotify.7: tfix
Date: Wed, 10 Sep 2014 18:25:26 +0400
Message-ID: <1410359126-3700-1-git-send-email-yuray@komyakino.ru>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man7/inotify.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/inotify.7 b/man7/inotify.7
index 725ae8e..aecdacf 100644
--- a/man7/inotify.7
+++ b/man7/inotify.7
@@ -801,7 +801,7 @@ since it requires that an application cycle through
 .B INT_MAX
 watch descriptors,
 release a watch descriptor while leaving unread events for that
-watch descriptor in the queue in the queue,
+watch descriptor in the queue,
 and then recycle that watch descriptor.
 For this reason, and because there have been no reports
 of the bug occurring in real-world applications,
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
