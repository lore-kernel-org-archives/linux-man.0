From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] pthread_setconcurrency.3: ATTRIBUTES: Note functions that are thread-safe
Date: Fri, 23 May 2014 10:43:26 +0800
Message-ID: <1400813006-24966-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions pthread_setconcurrency() and
pthread_getconcurrency() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/pthread_setconcurrency.3 | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/man3/pthread_setconcurrency.3 b/man3/pthread_setconcurrency.3
index 618d2f0..0561a2e 100644
--- a/man3/pthread_setconcurrency.3
+++ b/man3/pthread_setconcurrency.3
@@ -22,7 +22,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH PTHREAD_SETCONCURRENCY 3 2009-04-10 "Linux" "Linux Programmer's Manual"
+.TH PTHREAD_SETCONCURRENCY 3 2014-05-23 "Linux" "Linux Programmer's Manual"
 .SH NAME
 pthread_setconcurrency, pthread_getconcurrency \- set/get
 the concurrency level
@@ -80,6 +80,13 @@ error ("the value specified by
 would cause a system resource to be exceeded").
 .SH VERSIONS
 These functions are available in glibc since version 2.1.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR pthread_setconcurrency ()
+and
+.BR pthread_getconcurrency ()
+functions are thread-safe.
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH NOTES
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
