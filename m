From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] readdir.3: Add description of the function is not thread-safe
Date: Wed, 07 Sep 2011 09:39:22 +0800
Message-ID: <4E66CB4A.9070603@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


The data returned by readdir() may be overwritten by subsequent calls to
readdir() for the same directory stream, so it is not thread-safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/readdir.3 |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/man3/readdir.3 b/man3/readdir.3
index 04298ee..6227727 100644
--- a/man3/readdir.3
+++ b/man3/readdir.3
@@ -31,7 +31,7 @@
 .\"     Rework discussion of nonstandard structure fields.
 .\" 2008-09-11, mtk, Document readdir_r().
 .\"
-.TH READDIR 3  2010-09-10 "" "Linux Programmer's Manual"
+.TH READDIR 3  2011-09-07 "" "Linux Programmer's Manual"
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
 .SH "CONFORMING TO"
 SVr4, 4.3BSD, POSIX.1-2001.
 .SH NOTES
-- 
1.7.1

-- 
Best Regards,
Peng Haitao

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
