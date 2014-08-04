From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] pthread_attr_setinheritsched.3: ffix
Date: Mon,  4 Aug 2014 21:57:22 +0200
Message-ID: <1407182242-21583-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/pthread_attr_setinheritsched.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/pthread_attr_setinheritsched.3 b/man3/pthread_attr_setinheritsched.3
index 84c5b40..4d6bfab 100644
--- a/man3/pthread_attr_setinheritsched.3
+++ b/man3/pthread_attr_setinheritsched.3
@@ -145,5 +145,5 @@ See
 .BR pthread_create (3),
 .BR pthread_setschedparam (3),
 .BR pthread_setschedprio (3),
-.BR pthreads ,(7)
+.BR pthreads (7),
 .BR sched (7)
-- 
2.0.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
