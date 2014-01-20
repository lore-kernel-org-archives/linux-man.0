From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] strcmp.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 20 Jan 2014 14:35:55 +0800
Message-ID: <1390199755-5620-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions strcmp() and strncmp() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/strcmp.3 | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/man3/strcmp.3 b/man3/strcmp.3
index 684feae..04c3986 100644
--- a/man3/strcmp.3
+++ b/man3/strcmp.3
@@ -29,7 +29,7 @@
 .\" Modified Sat Jul 24 18:08:52 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
 .\" Modified 2001-08-31, aeb
 .\"
-.TH STRCMP 3  2012-11-25 "" "Linux Programmer's Manual"
+.TH STRCMP 3  2014-01-20 "" "Linux Programmer's Manual"
 .SH NAME
 strcmp, strncmp \- compare two strings
 .SH SYNOPSIS
@@ -76,6 +76,13 @@ less than, equal to, or greater than zero if
 bytes thereof) is found, respectively, to be less than, to
 match, or be greater than
 .IR s2 .
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR strcmp ()
+and
+.BR strncmp ()
+functions are thread-safe.
 .SH CONFORMING TO
 SVr4, 4.3BSD, C89, C99.
 .SH SEE ALSO
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
