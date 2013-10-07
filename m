From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] atan.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 7 Oct 2013 17:48:28 +0800
Message-ID: <1381139308-10987-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions atan(), atanf() and atanl() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/atan.3 | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/man3/atan.3 b/man3/atan.3
index 7eb8218..9f5a173 100644
--- a/man3/atan.3
+++ b/man3/atan.3
@@ -32,7 +32,7 @@
 .\" Modified 2002-07-27 by Walter Harms
 .\" 	(walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org)
 .\"
-.TH ATAN 3  2010-09-20 "" "Linux Programmer's Manual"
+.TH ATAN 3  2013-10-07 "" "Linux Programmer's Manual"
 .SH NAME
 atan, atanf, atanl \- arc tangent function
 .SH SYNOPSIS
@@ -93,6 +93,14 @@ is positive infinity (negative infinity), +pi/2 (\-pi/2) is returned.
 .\" glibc 2.8 does not do this.
 .SH ERRORS
 No errors occur.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR atan (),
+.BR atanf (),
+and
+.BR atanl ()
+functions are thread-safe.
 .SH CONFORMING TO
 C99, POSIX.1-2001.
 The variant returning
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
