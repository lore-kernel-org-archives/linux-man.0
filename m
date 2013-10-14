From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] asinh.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 14 Oct 2013 13:45:20 +0800
Message-ID: <1381729520-21622-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions asinh(), asinhf() and asinhl() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/asinh.3 | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/man3/asinh.3 b/man3/asinh.3
index 3b847e0..3d4bc0b 100644
--- a/man3/asinh.3
+++ b/man3/asinh.3
@@ -32,7 +32,7 @@
 .\" Modified 2002-07-27 by Walter Harms
 .\" 	(walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org)
 .\"
-.TH ASINH 3  2010-09-20 "GNU"  "Linux Programmer's Manual"
+.TH ASINH 3  2013-10-14 "GNU"  "Linux Programmer's Manual"
 .SH NAME
 asinh, asinhf, asinhl \- inverse hyperbolic sine function
 .SH SYNOPSIS
@@ -102,6 +102,14 @@ positive infinity (negative infinity) is returned.
 .\" glibc 2.8 does not do this.
 .SH ERRORS
 No errors occur.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR asinh (),
+.BR asinhf (),
+and
+.BR asinhl ()
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
