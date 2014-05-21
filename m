From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 12/24] pthread_setschedprio.3: Fix prototype
Date: Wed, 21 May 2014 16:57:43 +0200
Message-ID: <1400684275-20972-13-git-send-email-rv@rasmusvillemoes.dk>
References: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400684275-20972-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Add return type for pthread_setschedprio.

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 man3/pthread_setschedprio.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/pthread_setschedprio.3 b/man3/pthread_setschedprio.3
index 334c456..04620e8 100644
--- a/man3/pthread_setschedprio.3
+++ b/man3/pthread_setschedprio.3
@@ -30,7 +30,7 @@ pthread_setschedprio \- set scheduling priority of a thread
 .nf
 .B #include <pthread.h>
 
-.BI "pthread_setschedprio(pthread_t " thread ", int " prio );
+.BI "int pthread_setschedprio(pthread_t " thread ", int " prio );
 .sp
 Compile and link with \fI\-pthread\fP.
 .fi
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
