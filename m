From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] tanh.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 7 Jan 2014 09:59:43 +0800
Message-ID: <1389059983-4221-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions tanh(), tanhf() and tanhl() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/tanh.3 | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/man3/tanh.3 b/man3/tanh.3
index d730ab1..79edab1 100644
--- a/man3/tanh.3
+++ b/man3/tanh.3
@@ -32,7 +32,7 @@
 .\" Modified 2002-07-27 by Walter Harms
 .\" 	(walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org)
 .\"
-.TH TANH 3 2010-09-20 ""  "Linux Programmer's Manual"
+.TH TANH 3 2014-01-07 ""  "Linux Programmer's Manual"
 .SH NAME
 tanh, tanhf, tanhl \- hyperbolic tangent function
 .SH SYNOPSIS
@@ -97,6 +97,14 @@ is positive infinity (negative infinity),
 .\" glibc 2.8 does not do this.
 .SH ERRORS
 No errors occur.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR tanh (),
+.BR tanhf (),
+and
+.BR tanhl ()
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
