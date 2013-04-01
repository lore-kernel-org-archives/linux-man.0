From: Andrew Clayton <andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org>
Subject: [PATCH] pthread_setname_np.3: The thread variable is passed in by value
Date: Mon,  1 Apr 2013 20:33:17 +0100
Message-ID: <1364844797-19846-1-git-send-email-andrew@digital-domain.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Clayton <andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org>
List-Id: linux-man@vger.kernel.org

i.e

    pthread_t thread;

    pthread_setname_np(thread, ...);

and not

   pthread_setname_np(&thread, ...);

Signed-off-by: Andrew Clayton <andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org>
---
 man3/pthread_setname_np.3 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/pthread_setname_np.3 b/man3/pthread_setname_np.3
index b6b4563..3dca000 100644
--- a/man3/pthread_setname_np.3
+++ b/man3/pthread_setname_np.3
@@ -30,8 +30,8 @@ pthread_setname_np, pthread_getname_np \- set/get the name of a thread
 .nf
 .BR "#define _GNU_SOURCE" "             /* See feature_test_macros(7) */"
 .B #include <pthread.h>
-.BI "int pthread_setname_np(pthread_t *" thread ", const char *" name ");
-.BI "int pthread_getname_np(pthread_t *" thread ,
+.BI "int pthread_setname_np(pthread_t " thread ", const char *" name ");
+.BI "int pthread_getname_np(pthread_t " thread ,
 .BI "                       const char *" name ", size_t " len );
 .fi
 .sp
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
