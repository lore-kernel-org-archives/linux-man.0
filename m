From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 11/24] pthread_setschedparam.3: Fix prototypes
Date: Wed, 21 May 2014 16:57:42 +0200
Message-ID: <1400684275-20972-12-git-send-email-rv@rasmusvillemoes.dk>
References: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400684275-20972-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Add return type for pthread_{s,g}etschedparam.

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 man3/pthread_setschedparam.3 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/man3/pthread_setschedparam.3 b/man3/pthread_setschedparam.3
index 0930eb2..7863f04 100644
--- a/man3/pthread_setschedparam.3
+++ b/man3/pthread_setschedparam.3
@@ -31,10 +31,10 @@ scheduling policy and parameters of a thread
 .nf
 .B #include <pthread.h>
 
-.BI "pthread_setschedparam(pthread_t " thread ", int " policy ,
-.BI "                      const struct sched_param *" param );
-.BI "pthread_getschedparam(pthread_t " thread ", int *" policy ,
-.BI "                      struct sched_param *" param );
+.BI "int pthread_setschedparam(pthread_t " thread ", int " policy ,
+.BI "                          const struct sched_param *" param );
+.BI "int pthread_getschedparam(pthread_t " thread ", int *" policy ,
+.BI "                          struct sched_param *" param );
 .sp
 Compile and link with \fI\-pthread\fP.
 .fi
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
