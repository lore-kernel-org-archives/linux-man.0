From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] pthread_setcancelstate.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 13 May 2014 16:59:44 +0800
Message-ID: <1399971584-18368-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions pthread_setcancelstate() and
pthread_setcanceltype() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/pthread_setcancelstate.3 | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/man3/pthread_setcancelstate.3 b/man3/pthread_setcancelstate.3
index da1f634..f684b12 100644
--- a/man3/pthread_setcancelstate.3
+++ b/man3/pthread_setcancelstate.3
@@ -23,7 +23,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH PTHREAD_SETCANCELSTATE 3 2008-11-24 "Linux" "Linux Programmer's Manual"
+.TH PTHREAD_SETCANCELSTATE 3 2014-05-13 "Linux" "Linux Programmer's Manual"
 .SH NAME
 pthread_setcancelstate, pthread_setcanceltype \-
 set cancelability state and type
@@ -110,6 +110,13 @@ Invalid value for
 .IR type .
 .\" .SH VERSIONS
 .\" Available since glibc 2.0
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR pthread_setcancelstate ()
+and
+.BR pthread_setcanceltype ()
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
