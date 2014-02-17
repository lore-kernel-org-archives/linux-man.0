From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] sem_wait.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 17 Feb 2014 11:30:00 +0800
Message-ID: <1392607800-18264-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions sem_wait(), sem_trywait() and sem_timedwait() are
thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/sem_wait.3 | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/man3/sem_wait.3 b/man3/sem_wait.3
index f157f62..113f250 100644
--- a/man3/sem_wait.3
+++ b/man3/sem_wait.3
@@ -23,7 +23,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH SEM_WAIT 3 2012-05-13 "Linux" "Linux Programmer's Manual"
+.TH SEM_WAIT 3 2014-02-17 "Linux" "Linux Programmer's Manual"
 .SH NAME
 sem_wait, sem_timedwait, sem_trywait \- lock a semaphore
 .SH SYNOPSIS
@@ -140,6 +140,14 @@ is less than 0, or greater than or equal to 1000 million.
 The call timed out before the semaphore could be locked.
 .\" POSIX.1-2001 also allows EDEADLK -- "A deadlock condition
 .\" was detected", but this does not occur on Linux(?).
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR sem_wait (),
+.BR sem_trywait (),
+and
+.BR sem_timedwait ()
+functions are thread-safe.
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH NOTES
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
