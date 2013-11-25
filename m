From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] wcsnlen.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 25 Nov 2013 14:23:47 +0800
Message-ID: <1385360627-1726-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function wcsnlen() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/wcsnlen.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/wcsnlen.3 b/man3/wcsnlen.3
index fe96479..a8967ed 100644
--- a/man3/wcsnlen.3
+++ b/man3/wcsnlen.3
@@ -12,7 +12,7 @@
 .\"   Dinkumware C library reference http://www.dinkumware.com/
 .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.org/online.html
 .\"
-.TH WCSNLEN 3  2011-10-01 "GNU" "Linux Programmer's Manual"
+.TH WCSNLEN 3  2013-11-25 "GNU" "Linux Programmer's Manual"
 .SH NAME
 wcsnlen \- determine the length of a fixed-size wide-character string
 .SH SYNOPSIS
@@ -79,6 +79,11 @@ wide characters pointed to by
 The
 .BR wcsnlen ()
 function is provided in glibc since version 2.1.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR wcsnlen ()
+function is thread-safe.
 .SH CONFORMING TO
 POSIX.1-2008.
 .SH SEE ALSO
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
