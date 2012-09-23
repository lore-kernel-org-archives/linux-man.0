From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 4/5] mallopt.3, pthread_kill.3, pthread_sigmask.3, pthread_yield.3: ffix
Date: Sun, 23 Sep 2012 16:35:01 -0400
Message-ID: <1348432502-26050-4-git-send-email-taffit@debian.org>
References: <CAKgNAkgKVXfzKqe8qy+ZWSy-ZvhPrM0_sooKM4HG+UTfhbX6BQ@mail.gmail.com>
 <1348432502-26050-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1348432502-26050-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/mallopt.3         |    2 +-
 man3/pthread_kill.3    |    2 +-
 man3/pthread_sigmask.3 |    2 +-
 man3/pthread_yield.3   |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/man3/mallopt.3 b/man3/mallopt.3
index a31d8ad..e842a4f 100644
--- a/man3/mallopt.3
+++ b/man3/mallopt.3
@@ -564,7 +564,7 @@ main(int argc, char *argv[])
 .SH SEE ALSO
 .ad l
 .nh
-.BR mmap (2)
+.BR mmap (2),
 .BR sbrk (2),
 .BR mallinfo (3),
 .BR malloc (3),
diff --git a/man3/pthread_kill.3 b/man3/pthread_kill.3
index dcbab33..68f742d 100644
--- a/man3/pthread_kill.3
+++ b/man3/pthread_kill.3
@@ -71,7 +71,7 @@ the handler will be invoked in the thread
 but if the disposition of the signal is "stop", "continue", or "terminate",
 this action will affect the whole process.
 .SH SEE ALSO
-.BR kill (2)
+.BR kill (2),
 .BR sigaction (2),
 .BR sigpending (2),
 .BR pthread_self (3),
diff --git a/man3/pthread_sigmask.3 b/man3/pthread_sigmask.3
index de78dac..99f653e 100644
--- a/man3/pthread_sigmask.3
+++ b/man3/pthread_sigmask.3
@@ -133,7 +133,7 @@ main(int argc, char *argv[])
 .SH SEE ALSO
 .BR sigaction (2),
 .BR sigpending (2),
-.BR sigprocmask (2)
+.BR sigprocmask (2),
 .BR pthread_create (3),
 .BR pthread_kill (3),
 .BR sigsetops (3),
diff --git a/man3/pthread_yield.3 b/man3/pthread_yield.3
index 40e8950..1838804 100644
--- a/man3/pthread_yield.3
+++ b/man3/pthread_yield.3
@@ -58,5 +58,5 @@ On Linux, this function is implemented as a call to
 .BR sched_yield (2).
 .SH SEE ALSO
 .BR sched_setscheduler (2),
-.BR sched_yield (2)
+.BR sched_yield (2),
 .BR pthreads (7)
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
