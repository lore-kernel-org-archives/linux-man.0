From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] wmemchr.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 5 Nov 2013 09:21:05 +0800
Message-ID: <1383614465-16478-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function wmemchr() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/wmemchr.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/wmemchr.3 b/man3/wmemchr.3
index 4ac3579..e038f74 100644
--- a/man3/wmemchr.3
+++ b/man3/wmemchr.3
@@ -13,7 +13,7 @@
 .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.org/online.html
 .\"   ISO/IEC 9899:1999
 .\"
-.TH WMEMCHR 3  1999-07-25 "GNU" "Linux Programmer's Manual"
+.TH WMEMCHR 3  2013-11-05 "GNU" "Linux Programmer's Manual"
 .SH NAME
 wmemchr \- search a wide character in a wide-character array
 .SH SYNOPSIS
@@ -48,6 +48,11 @@ or NULL if
 .I c
 does
 not occur among these.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR wmemchr ()
+function is thread-safe.
 .SH CONFORMING TO
 C99.
 .SH SEE ALSO
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
