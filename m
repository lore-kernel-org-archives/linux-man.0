From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] readdir.3: Add description of the function is not thread-safe
Date: Tue, 12 Mar 2013 18:43:58 +0800
Message-ID: <1363085038-7097-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The data returned by readdir() may be overwritten by subsequent calls to
readdir() for the same directory stream, so it is not thread-safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/readdir.3 | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/man3/readdir.3 b/man3/readdir.3
index c788ba9..b70dc85 100644
--- a/man3/readdir.3
+++ b/man3/readdir.3
@@ -31,7 +31,7 @@
 .\"     Rework discussion of nonstandard structure fields.
 .\" 2008-09-11, mtk, Document readdir_r().
 .\"
-.TH READDIR 3  2012-07-07 "" "Linux Programmer's Manual"
+.TH READDIR 3  2013-03-12 "" "Linux Programmer's Manual"
 .SH NAME
 readdir, readdir_r \- read a directory
 .SH SYNOPSIS
@@ -142,6 +142,15 @@ returns 0, and returns NULL in
 .TP
 .B EBADF
 Invalid directory stream descriptor \fIdirp\fP.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR readdir ()
+function is not thread-safe.
+.LP
+The
+.BR readdir_r ()
+function is thread-safe.
 .SH CONFORMING TO
 SVr4, 4.3BSD, POSIX.1-2001.
 .SH NOTES
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
