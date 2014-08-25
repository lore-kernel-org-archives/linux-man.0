From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] sem_wait.3: Reformat thread-safety information
Date: Mon, 25 Aug 2014 10:28:40 +0800
Message-ID: <1408933720-11219-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/sem_wait.3 | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/man3/sem_wait.3 b/man3/sem_wait.3
index 6108b46..6d3184d 100644
--- a/man3/sem_wait.3
+++ b/man3/sem_wait.3
@@ -141,13 +141,19 @@ The call timed out before the semaphore could be locked.
 .\" POSIX.1-2001 also allows EDEADLK -- "A deadlock condition
 .\" was detected", but this does not occur on Linux(?).
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw26 lb lb
+l l l.
+Interface	Attribute	Value
+T{
 .BR sem_wait (),
 .BR sem_trywait (),
-and
 .BR sem_timedwait ()
-functions are thread-safe.
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
