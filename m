From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] pthread_create.3: /proc/sys/kernel/threads-max limits process AND threads
Date: Mon,  4 Aug 2014 22:32:23 +0200
Message-ID: <1407184343-22243-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/pthread_create.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/pthread_create.3 b/man3/pthread_create.3
index 1d33439..82f73e1 100644
--- a/man3/pthread_create.3
+++ b/man3/pthread_create.3
@@ -133,7 +133,7 @@ soft resource limit (set via
 .BR setrlimit (2)),
 which limits the number of processes and threads for a real user ID,
 was reached;
-the kernel's system-wide limit on the number of processes threads,
+the kernel's system-wide limit on the number of processes and threads,
 .IR /proc/sys/kernel/threads-max ,
 was reached (see
 .BR proc (5));
-- 
2.0.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
