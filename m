From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] erf.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 29 Oct 2013 10:38:02 +0800
Message-ID: <1383014282-10627-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions erf(), erff() and erfl() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/erf.3 | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/man3/erf.3 b/man3/erf.3
index 2f903b0..560b78c 100644
--- a/man3/erf.3
+++ b/man3/erf.3
@@ -32,7 +32,7 @@
 .\" Modified 2002-07-27 by Walter Harms
 .\" 	(walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org)
 .\"
-.TH ERF 3  2010-09-20 "GNU" "Linux Programmer's Manual"
+.TH ERF 3  2013-10-29 "GNU" "Linux Programmer's Manual"
 .SH NAME
 erf, erff, erfl, \- error function
 .SH SYNOPSIS
@@ -123,6 +123,14 @@ These functions do not set
 .IR errno .
 .\" FIXME . Is it intentional that these functions do not set errno?
 .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6785
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR erf (),
+.BR erff (),
+and
+.BR erfl ()
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
