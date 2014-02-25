From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] swab.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 25 Feb 2014 14:04:06 +0800
Message-ID: <1393308246-498-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function swab() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/swab.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/swab.3 b/man3/swab.3
index 9c4ef7a..007f685 100644
--- a/man3/swab.3
+++ b/man3/swab.3
@@ -28,7 +28,7 @@
 .\"     386BSD man pages
 .\" Modified Sat Jul 24 17:52:15 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
 .\" Modified 2001-12-15, aeb
-.TH SWAB 3  2001-12-15 "" "Linux Programmer's Manual"
+.TH SWAB 3  2014-02-25 "" "Linux Programmer's Manual"
 .SH NAME
 swab \- swap adjacent bytes
 .SH SYNOPSIS
@@ -69,6 +69,11 @@ should be even.)
 The
 .BR swab ()
 function returns no value.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR swab ()
+function is thread-safe.
 .SH CONFORMING TO
 SVr4, 4.3BSD, POSIX.1-2001.
 .SH SEE ALSO
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
