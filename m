From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] sem_init.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 10 Mar 2014 10:03:07 +0800
Message-ID: <1394416987-13564-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function sem_init() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/sem_init.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/sem_init.3 b/man3/sem_init.3
index d7f55cd..ec0acbf 100644
--- a/man3/sem_init.3
+++ b/man3/sem_init.3
@@ -23,7 +23,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH SEM_INIT 3 2012-05-13 "Linux" "Linux Programmer's Manual"
+.TH SEM_INIT 3 2014-03-10 "Linux" "Linux Programmer's Manual"
 .SH NAME
 sem_init \- initialize an unnamed semaphore
 .SH SYNOPSIS
@@ -92,6 +92,11 @@ exceeds
 is nonzero,
 but the system does not support process-shared semaphores (see
 .BR sem_overview (7)).
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR sem_init ()
+function is thread-safe.
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH NOTES
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
