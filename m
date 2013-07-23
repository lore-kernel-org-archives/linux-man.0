From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] flockfile.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 23 Jul 2013 10:25:24 +0800
Message-ID: <1374546324-17481-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions flockfile(), ftrylockfile() and funlockfile() are
thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/flockfile.3 | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/man3/flockfile.3 b/man3/flockfile.3
index 5f1a1f6..0989038 100644
--- a/man3/flockfile.3
+++ b/man3/flockfile.3
@@ -22,7 +22,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH FLOCKFILE 3  2008-08-29 "" "Linux Programmer's Manual"
+.TH FLOCKFILE 3  2013-07-23 "" "Linux Programmer's Manual"
 .SH NAME
 flockfile, ftrylockfile, funlockfile \- lock FILE for stdio
 .SH SYNOPSIS
@@ -124,6 +124,14 @@ function returns zero for success
 (the lock was obtained), and nonzero for failure.
 .SH ERRORS
 None.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR flockfile (),
+.BR ftrylockfile (),
+and
+.BR funlockfile ()
+functions are thread-safe.
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH AVAILABILITY
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
