From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] strpbrk.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 25 Feb 2014 17:28:50 +0800
Message-ID: <1393320530-16052-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function strpbrk() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/strpbrk.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/strpbrk.3 b/man3/strpbrk.3
index 7e3519d..0ae1c3a 100644
--- a/man3/strpbrk.3
+++ b/man3/strpbrk.3
@@ -27,7 +27,7 @@
 .\"     Lewine's _POSIX Programmer's Guide_ (O'Reilly & Associates, 1991)
 .\"     386BSD man pages
 .\" Modified Sat Jul 24 18:01:24 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
-.TH STRPBRK 3  2012-05-10 "" "Linux Programmer's Manual"
+.TH STRPBRK 3  2014-02-25 "" "Linux Programmer's Manual"
 .SH NAME
 strpbrk \- search a string for any of a set of bytes
 .SH SYNOPSIS
@@ -53,6 +53,11 @@ that matches one of the bytes in
 .IR accept ,
 or NULL
 if no such byte is found.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR strpbrk ()
+function is thread-safe.
 .SH CONFORMING TO
 SVr4, 4.3BSD, C89, C99.
 .SH SEE ALSO
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
