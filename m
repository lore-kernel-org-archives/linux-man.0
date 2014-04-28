From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] timer_settime.2:tfix
Date: Mon, 28 Apr 2014 19:27:34 +0400
Message-ID: <1398698854-3757-1-git-send-email-yuray@komyakino.ru>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/timer_settime.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/timer_settime.2 b/man2/timer_settime.2
index 5ca36cb..09e6268 100644
--- a/man2/timer_settime.2
+++ b/man2/timer_settime.2
@@ -83,7 +83,7 @@ structure that allows a time value to be specified
 in seconds and nanoseconds.
 These time values are measured according to the clock
 that was specified when the timer was created by
-.BR timer_create (2)
+.BR timer_create (2).
 
 If
 .I new_value->it_value
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
