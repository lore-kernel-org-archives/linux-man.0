From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] atof.3: ATTRIBUTES: Note function that is thread safe with exceptions
Date: Tue, 8 Oct 2013 11:41:58 +0800
Message-ID: <1381203718-26118-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function atof() is thread safe with exceptions.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/atof.3 | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/man3/atof.3 b/man3/atof.3
index 1b19026..d900a27 100644
--- a/man3/atof.3
+++ b/man3/atof.3
@@ -28,7 +28,7 @@
 .\"     386BSD man pages
 .\" Modified Mon Mar 29 22:39:24 1993, David Metcalfe
 .\" Modified Sat Jul 24 21:39:22 1993, Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
-.TH ATOF 3  2012-08-03 "GNU" "Linux Programmer's Manual"
+.TH ATOF 3  2013-10-08 "GNU" "Linux Programmer's Manual"
 .SH NAME
 atof \- convert a string to a double
 .SH SYNOPSIS
@@ -54,6 +54,14 @@ except that
 does not detect errors.
 .SH RETURN VALUE
 The converted value.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR atof ()
+function is thread-safe with exceptions.
+It can be safely used in multithreaded applications, as long as
+.BR setlocale (3)
+is not called to change the locale.
 .SH CONFORMING TO
 SVr4, POSIX.1-2001, 4.3BSD, C89, C99.
 .SH SEE ALSO
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
