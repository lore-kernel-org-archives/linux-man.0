From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] pthread_attr_setdetachstate.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 14 Apr 2014 12:04:42 +0800
Message-ID: <1397448282-25438-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions pthread_attr_setdetachstate() and
pthread_attr_getdetachstate() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/pthread_attr_setdetachstate.3 | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/man3/pthread_attr_setdetachstate.3 b/man3/pthread_attr_setdetachstate.3
index 9f512d1..dd43608 100644
--- a/man3/pthread_attr_setdetachstate.3
+++ b/man3/pthread_attr_setdetachstate.3
@@ -23,7 +23,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH PTHREAD_ATTR_SETDETACHSTATE 3 2010-02-03 "Linux" "Linux Programmer's Manual"
+.TH PTHREAD_ATTR_SETDETACHSTATE 3 2014-04-14 "Linux" "Linux Programmer's Manual"
 .SH NAME
 pthread_attr_setdetachstate, pthread_attr_getdetachstate \-
 set/get detach state attribute in thread attributes object
@@ -84,6 +84,13 @@ can fail with the following error:
 .B EINVAL
 An invalid value was specified in
 .IR detachstate .
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR pthread_attr_setdetachstate ()
+and
+.BR pthread_attr_getdetachstate ()
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
