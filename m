From: Johan Erlandsson <jeoerl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] syscall.2: clarify example, add missing parameter
Date: Fri, 9 Aug 2013 01:53:02 +0200
Message-ID: <CALiXj0BkB-0bSw6gcDnCFDkqO0_7836=a0kCOQF0gAzaG6cUQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

An attempt to clarify example by adding a missing parameter.

---
 man2/syscall.2 |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/man2/syscall.2 b/man2/syscall.2
index 0560634..1cca9ce 100644
--- a/man2/syscall.2
+++ b/man2/syscall.2
@@ -205,6 +205,7 @@ architectures may indiscriminately clobber other
registers not listed here.
 #include <unistd.h>
 #include <sys/syscall.h>
 #include <sys/types.h>
+#include <signal.h>

 int
 main(int argc, char *argv[])
@@ -212,7 +213,7 @@ main(int argc, char *argv[])
     pid_t tid;

     tid = syscall(SYS_gettid);
-    tid = syscall(SYS_tgkill, getpid(), tid);
+    tid = syscall(SYS_tgkill, getpid(), tid, SIGHUP);
 }
 .fi
 .SH SEE ALSO
-- 
1.7.9.5
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
