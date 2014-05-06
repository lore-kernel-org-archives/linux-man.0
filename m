From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] pthread_attr_setstackaddr.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 6 May 2014 09:49:03 +0800
Message-ID: <1399340943-3483-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions pthread_attr_setstackaddr() and
pthread_attr_getstackaddr() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/pthread_attr_setstackaddr.3 | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/man3/pthread_attr_setstackaddr.3 b/man3/pthread_attr_setstackaddr.3
index 3c4778d..a82d471 100644
--- a/man3/pthread_attr_setstackaddr.3
+++ b/man3/pthread_attr_setstackaddr.3
@@ -23,7 +23,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH PTHREAD_ATTR_SETSTACKADDR 3 2008-10-24 "Linux" "Linux Programmer's Manual"
+.TH PTHREAD_ATTR_SETSTACKADDR 3 2014-05-06 "Linux" "Linux Programmer's Manual"
 .SH NAME
 pthread_attr_setstackaddr, pthread_attr_getstackaddr \-
 set/get stack address attribute in thread attributes object
@@ -80,6 +80,13 @@ No errors are defined
 handle a possible error return).
 .SH VERSIONS
 These functions are provided by glibc since version 2.1.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR pthread_attr_setstackaddr ()
+and
+.BR pthread_attr_getstackaddr ()
+functions are thread-safe.
 .SH CONFORMING TO
 POSIX.1-2001 specifies these functions but marks them as obsolete.
 POSIX.1-2008 removes the specification of these functions.
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
