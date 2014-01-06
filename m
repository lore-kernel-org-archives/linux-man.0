From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] tan.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 6 Jan 2014 15:47:09 +0800
Message-ID: <1388994429-23224-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions tan(), tanf() and tanl() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/tan.3 | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/man3/tan.3 b/man3/tan.3
index 21318d2..f89bed1 100644
--- a/man3/tan.3
+++ b/man3/tan.3
@@ -32,7 +32,7 @@
 .\" Modified 2002-07-27 by Walter Harms
 .\" 	(walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org)
 .\"
-.TH TAN 3 2010-09-11 ""  "Linux Programmer's Manual"
+.TH TAN 3 2014-01-06 ""  "Linux Programmer's Manual"
 .SH NAME
 tan, tanf, tanl \- tangent function
 .SH SYNOPSIS
@@ -130,6 +130,14 @@ Range error: result overflow
 An overflow floating-point exception
 .RB ( FE_OVERFLOW )
 is raised.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR tan (),
+.BR tanf (),
+and
+.BR tanl ()
+functions are thread-safe.
 .SH CONFORMING TO
 C99, POSIX.1-2001.
 The variant returning
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
