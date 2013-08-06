From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] frexp.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 6 Aug 2013 13:43:23 +0800
Message-ID: <1375767803-3761-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions frexp(), frexpf() and frexpl() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/frexp.3 | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/man3/frexp.3 b/man3/frexp.3
index fdd8430..c75d545 100644
--- a/man3/frexp.3
+++ b/man3/frexp.3
@@ -30,7 +30,7 @@
 .\" Modified 2002-07-27 by Walter Harms
 .\" 	(walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org)
 .\"
-.TH FREXP 3 2010-09-20 "" "Linux Programmer's Manual"
+.TH FREXP 3 2013-08-06 "" "Linux Programmer's Manual"
 .SH NAME
 frexp, frexpf, frexpl \- convert floating-point number to fractional
 and integral components
@@ -105,6 +105,14 @@ positive infinity (negative infinity) is returned, and the value of
 is unspecified.
 .SH ERRORS
 No errors occur.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR frexp (),
+.BR frexpf (),
+and
+.BR frexpl ()
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
