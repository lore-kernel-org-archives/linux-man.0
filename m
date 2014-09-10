From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] inotify.7: tfix
Date: Wed, 10 Sep 2014 18:00:54 +0400
Message-ID: <1410357654-3611-1-git-send-email-yuray@komyakino.ru>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man7/inotify.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/inotify.7 b/man7/inotify.7
index 5c2597b..725ae8e 100644
--- a/man7/inotify.7
+++ b/man7/inotify.7
@@ -345,7 +345,7 @@ Only watch
 .I pathname
 if it is a directory.
 Using this flag provides an application with a race-free way of
-ensuring that the monitored objeect is a directory.
+ensuring that the monitored object is a directory.
 .RE
 .PP
 The following bits may be set in the
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
