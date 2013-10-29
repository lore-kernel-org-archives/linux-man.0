From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] futimes.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 29 Oct 2013 15:57:58 +0800
Message-ID: <1383033478-10148-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions futimes() and lutimes() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/futimes.3 | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/man3/futimes.3 b/man3/futimes.3
index efdc8b9..8aec0f1 100644
--- a/man3/futimes.3
+++ b/man3/futimes.3
@@ -22,7 +22,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH FUTIMES 3 2013-03-15 "Linux" "Linux Programmer's Manual"
+.TH FUTIMES 3 2013-10-29 "Linux" "Linux Programmer's Manual"
 .SH NAME
 futimes, lutimes \- change file timestamps
 .SH SYNOPSIS
@@ -90,6 +90,13 @@ is available since glibc 2.3.
 is available since glibc 2.6, and is implemented using the
 .BR utimensat (2)
 system call, which is supported since kernel 2.6.22.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR futimes ()
+and
+.BR lutimes ()
+functions are thread-safe.
 .SH CONFORMING TO
 These functions are not specified in any standard.
 Other than Linux, they are available only on the BSDs.
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
