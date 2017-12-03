From: roblabla <man-pages-KoZcQ+CXkXj3fQ9qLvQP4Q@public.gmane.org>
Subject: [PATCH] pthread_mutexattr_init.3: Wrong function name fix
Date: Mon, 04 Dec 2017 00:04:09 +0100
Message-ID: <e9cac1a2e616d0f6a5ca6c26eb99380f@roblab.la>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
  man3/pthread_mutexattr_init.3 | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/pthread_mutexattr_init.3 
b/man3/pthread_mutexattr_init.3
index 9d27a15da..b37f32bc4 100644
--- a/man3/pthread_mutexattr_init.3
+++ b/man3/pthread_mutexattr_init.3
@@ -30,8 +30,8 @@ destroy a mutex attributes object
  .nf
  .B #include <pthread.h>
  .PP
-.BI "int pthread_mutex_init(pthread_mutexattr_t *" attr ");"
-.BI "int pthread_mutex_destroy(pthread_mutexattr_t *" attr ");"
+.BI "int pthread_mutexattr_init(pthread_mutexattr_t *" attr ");"
+.BI "int pthread_mutexattr_destroy(pthread_mutexattr_t *" attr ");"
  .fi
  .PP
  Compile and link with \fI\-pthread\fP.
--
2.15.0
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
