From: Rahul Bedarkar <rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH 1/1] pthread_detach.3: remove invalid and confusing statement
Date: Sat, 26 Sep 2015 11:34:17 +0530
Message-ID: <1443247457-3507-1-git-send-email-rahulbedarkar89@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rahul Bedarkar <rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

In notes section, statement

"(But note that the resources of all threads are freed when the
process terminates.)"

is confusing and invalid. In Linux, we don't really need to wait
until application termination for system resources to be freed unless
there is bug in application logic.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man3/pthread_detach.3 | 2 --
 1 file changed, 2 deletions(-)

diff --git a/man3/pthread_detach.3 b/man3/pthread_detach.3
index 106914b..2c53409 100644
--- a/man3/pthread_detach.3
+++ b/man3/pthread_detach.3
@@ -101,8 +101,6 @@ or
 .BR pthread_detach ()
 should be called for each thread that an application creates,
 so that system resources for the thread can be released.
-(But note that the resources of all threads are freed when the
-process terminates.)
 .SH EXAMPLE
 The following statement detaches the calling thread:
 
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
