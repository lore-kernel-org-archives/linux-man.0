From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] fanotify_mark.2: tfix
Date: Sun,  8 Jun 2014 18:40:13 +0400
Message-ID: <1402238413-6818-1-git-send-email-yuray@komyakino.ru>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/fanotify_mark.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/fanotify_mark.2 b/man2/fanotify_mark.2
index 61bce45..929579a 100644
--- a/man2/fanotify_mark.2
+++ b/man2/fanotify_mark.2
@@ -326,7 +326,7 @@ event.
 If
 .BR fanotify_mark (2)
 is called with
-.B FAN_MARK_FLUSH,
+.B FAN_MARK_FLUSH ,
 .I flags
 is not checked for invalid values.
 .SH SEE ALSO
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
