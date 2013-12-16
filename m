From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] sin.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 16 Dec 2013 16:41:43 +0800
Message-ID: <1387183303-10403-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions sin(), sinf() and sinl() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/sin.3 | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/man3/sin.3 b/man3/sin.3
index 83f9b31..b110df0 100644
--- a/man3/sin.3
+++ b/man3/sin.3
@@ -32,7 +32,7 @@
 .\" Modified 2002-07-27 by Walter Harms
 .\" 	(walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org)
 .\"
-.TH SIN 3  2010-09-11 "" "Linux Programmer's Manual"
+.TH SIN 3  2013-12-16 "" "Linux Programmer's Manual"
 .SH NAME
 sin, sinf, sinl \- sine function
 .SH SYNOPSIS
@@ -105,6 +105,14 @@ is set to
 An invalid floating-point exception
 .RB ( FE_INVALID )
 is raised.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR sin (),
+.BR sinf (),
+and
+.BR sinl ()
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
