From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] div.3: ATTRIBUTES: Note functions that are thread-safe
Date: Fri, 5 Jul 2013 17:23:24 +0800
Message-ID: <1373016204-8807-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions div(), ldiv(), lldiv() and imaxdiv() are thread
safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/div.3 | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/man3/div.3 b/man3/div.3
index 10ba296..c9ee23d 100644
--- a/man3/div.3
+++ b/man3/div.3
@@ -31,7 +31,7 @@
 .\" Modified 1993-07-24, Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
 .\" Modified 2002-08-10, 2003-11-01 Walter Harms, aeb
 .\"
-.TH DIV 3 2012-04-17 "" "Linux Programmer's Manual"
+.TH DIV 3 2013-07-05 "" "Linux Programmer's Manual"
 .SH NAME
 div, ldiv, lldiv, imaxdiv \- compute quotient and remainder of
 an integer division
@@ -88,6 +88,15 @@ of the indicated name, in all cases with fields \fIquot\fP and \fIrem\fP
 of the same type as the function arguments.
 .SH RETURN VALUE
 The \fIdiv_t\fP (etc.) structure.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR div (),
+.BR ldiv (),
+.BR lldiv (),
+and
+.BR imaxdiv ()
+functions are thread-safe.
 .SH CONFORMING TO
 SVr4, 4.3BSD, C89. C99.
 The functions
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
