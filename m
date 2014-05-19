From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] pthread_testcancel.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 19 May 2014 14:39:13 +0800
Message-ID: <1400481553-31152-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function pthread_testcancel() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/pthread_testcancel.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/pthread_testcancel.3 b/man3/pthread_testcancel.3
index 3fff022..08ea4c7 100644
--- a/man3/pthread_testcancel.3
+++ b/man3/pthread_testcancel.3
@@ -23,7 +23,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH PTHREAD_TESTCANCEL 3 2012-04-14 "Linux" "Linux Programmer's Manual"
+.TH PTHREAD_TESTCANCEL 3 2014-05-19 "Linux" "Linux Programmer's Manual"
 .SH NAME
 pthread_testcancel \- request delivery of any pending cancellation request
 .SH SYNOPSIS
@@ -55,6 +55,11 @@ to this function, then the function does not return.
 This function always succeeds.
 .\" SH VERSIONS
 .\" Available since glibc 2.0
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR pthread_testcancel ()
+function is thread-safe.
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH EXAMPLE
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
