From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] remove.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 10 Mar 2014 11:13:32 +0800
Message-ID: <1394421212-16985-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function remove() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/remove.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/remove.3 b/man3/remove.3
index 863688b..fbcbbc7 100644
--- a/man3/remove.3
+++ b/man3/remove.3
@@ -28,7 +28,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH REMOVE 3 2008-12-03 "GNU" "Linux Programmer's Manual"
+.TH REMOVE 3 2014-03-10 "GNU" "Linux Programmer's Manual"
 .SH NAME
 remove \- remove a file or directory
 .SH SYNOPSIS
@@ -67,6 +67,11 @@ The errors that occur are those for
 .BR unlink (2)
 and
 .BR rmdir (2).
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR remove ()
+function is thread-safe.
 .SH CONFORMING TO
 C89, C99, 4.3BSD, POSIX.1-2001.
 .SH NOTES
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
