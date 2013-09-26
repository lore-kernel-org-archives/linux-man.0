From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] statvfs.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 26 Sep 2013 13:33:32 +0800
Message-ID: <1380173612-13856-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions statvfs() and fstatvfs() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/statvfs.3 | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/man3/statvfs.3 b/man3/statvfs.3
index 24d10d6..e36630f 100644
--- a/man3/statvfs.3
+++ b/man3/statvfs.3
@@ -27,7 +27,7 @@
 .\"
 .\" Modified 2004-06-23 by Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 .\"
-.TH STATVFS 3 2003-08-22 "Linux" "Linux Programmer's Manual"
+.TH STATVFS 3 2013-09-26 "Linux" "Linux Programmer's Manual"
 .SH NAME
 statvfs, fstatvfs \- get filesystem statistics
 .SH SYNOPSIS
@@ -154,6 +154,13 @@ is not a directory.
 .TP
 .B EOVERFLOW
 Some values were too large to be represented in the returned struct.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR statvfs ()
+and
+.BR fstatvfs ()
+functions are thread-safe.
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH NOTES
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
