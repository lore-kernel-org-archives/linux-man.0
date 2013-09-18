From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] cbrt.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 18 Sep 2013 17:12:16 +0800
Message-ID: <1379495536-7221-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions cbrt(), cbrtf() and cbrtl() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/cbrt.3 | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/man3/cbrt.3 b/man3/cbrt.3
index 91e0891..466e5d3 100644
--- a/man3/cbrt.3
+++ b/man3/cbrt.3
@@ -27,7 +27,7 @@
 .\" Modified 2002-07-27 Walter Harms
 .\" (walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org)
 .\"
-.TH CBRT 3  2010-09-20 "GNU"  "Linux Programmer's Manual"
+.TH CBRT 3  2013-09-18 "GNU"  "Linux Programmer's Manual"
 .SH NAME
 cbrt, cbrtf, cbrtl \- cube root function
 .SH SYNOPSIS
@@ -87,6 +87,14 @@ is +0, \-0, positive infinity, negative infinity, or NaN,
 is returned.
 .SH ERRORS
 No errors occur.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR cbrt (),
+.BR cbrtf (),
+and
+.BR cbrtl ()
+functions are thread-safe.
 .SH CONFORMING TO
 C99, POSIX.1-2001.
 .\" .BR cbrt ()
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
