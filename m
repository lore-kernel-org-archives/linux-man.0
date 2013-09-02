From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] rewinddir.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 2 Sep 2013 11:56:37 +0800
Message-ID: <1378094197-4812-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function rewinddir() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/rewinddir.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/rewinddir.3 b/man3/rewinddir.3
index 2aef5db..0b65603 100644
--- a/man3/rewinddir.3
+++ b/man3/rewinddir.3
@@ -28,7 +28,7 @@
 .\"     386BSD man pages
 .\" Modified Sat Jul 24 18:29:11 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
 .\" Modified 11 June 1995 by Andries Brouwer (aeb-rh8NL+sEX9E@public.gmane.org)
-.TH REWINDDIR 3  1995-06-11 "" "Linux Programmer's Manual"
+.TH REWINDDIR 3  2013-09-02 "" "Linux Programmer's Manual"
 .SH NAME
 rewinddir \- reset directory stream
 .SH SYNOPSIS
@@ -50,6 +50,11 @@ to the beginning of the directory.
 The
 .BR rewinddir ()
 function returns no value.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR rewinddir ()
+function is thread-safe.
 .SH CONFORMING TO
 SVr4, 4.3BSD, POSIX.1-2001.
 .SH SEE ALSO
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
