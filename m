From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] timer_getoverrun.2:tfix
Date: Sun, 20 Apr 2014 08:41:08 +0400
Message-ID: <1397968868-4466-1-git-send-email-yuray@komyakino.ru>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/timer_getoverrun.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/timer_getoverrun.2 b/man2/timer_getoverrun.2
index d64255a..c14230b 100644
--- a/man2/timer_getoverrun.2
+++ b/man2/timer_getoverrun.2
@@ -78,7 +78,7 @@ Timer overruns can also occur when expiration notifications
 are delivered via invocation of a thread,
 since there may be an arbitrary delay between an expiration of the timer
 and the invocation of the notification thread,
-and in that delay interval, additional timer expirations may occur
+and in that delay interval, additional timer expirations may occur.
 .SH RETURN VALUE
 On success,
 .BR timer_getoverrun ()
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
