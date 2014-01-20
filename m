From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] strcat.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 20 Jan 2014 11:22:48 +0800
Message-ID: <1390188168-27926-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions strcat() and strncat() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/strcat.3 | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/man3/strcat.3 b/man3/strcat.3
index 87ee4a4..813ce03 100644
--- a/man3/strcat.3
+++ b/man3/strcat.3
@@ -29,7 +29,7 @@
 .\" Modified Sat Jul 24 18:11:47 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
 .\" 2007-06-15, Marc Boyer <marc.boyer-oUYRw6/Rnm9Wj0EZb7rXcA@public.gmane.org> + mtk
 .\"     Improve discussion of strncat().
-.TH STRCAT 3  2012-07-19 "GNU" "Linux Programmer's Manual"
+.TH STRCAT 3  2014-01-20 "GNU" "Linux Programmer's Manual"
 .SH NAME
 strcat, strncat \- concatenate two strings
 .SH SYNOPSIS
@@ -127,6 +127,13 @@ and
 .BR strncat ()
 functions return a pointer to the resulting string
 .IR dest .
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR strcat ()
+and
+.BR strncat ()
+functions are thread-safe.
 .SH CONFORMING TO
 SVr4, 4.3BSD, C89, C99.
 .SH NOTES
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
