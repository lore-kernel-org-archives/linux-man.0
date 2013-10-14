From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] expm1.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 14 Oct 2013 17:04:02 +0800
Message-ID: <1381741442-31159-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions expm1(), expm1f() and expm1l() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/expm1.3 | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/man3/expm1.3 b/man3/expm1.3
index d80e05c..bcf471e 100644
--- a/man3/expm1.3
+++ b/man3/expm1.3
@@ -27,7 +27,7 @@
 .\" Modified 2002-07-27 Walter Harms
 .\" 	(walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org)
 .\"
-.TH EXPM1 3  2010-09-12 "" "Linux Programmer's Manual"
+.TH EXPM1 3  2013-10-14 "" "Linux Programmer's Manual"
 .SH NAME
 expm1, expm1f, expm1l \- exponential minus 1
 .SH SYNOPSIS
@@ -133,6 +133,14 @@ is raised.
 .\"
 .\" POSIX.1 specifies an optional range error (underflow) if
 .\" x is subnormal.  Glibc does not implement this.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR expm1 (),
+.BR expm1f (),
+and
+.BR expm1l ()
+functions are thread-safe.
 .SH CONFORMING TO
 C99, POSIX.1-2001.
 .\" BSD.
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
