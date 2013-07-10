From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] fabs.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 10 Jul 2013 11:29:46 +0800
Message-ID: <1373426986-720-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions fabs(), fabsf() and fabsl() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/fabs.3 | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/man3/fabs.3 b/man3/fabs.3
index 1407f4d..a907fa6 100644
--- a/man3/fabs.3
+++ b/man3/fabs.3
@@ -29,7 +29,7 @@
 .\" Modified Sat Jul 24 19:42:04 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
 .\" Added fabsl, fabsf, aeb, 2001-06-07
 .\"
-.TH FABS 3  2010-09-20 "" "Linux Programmer's Manual"
+.TH FABS 3  2013-07-10 "" "Linux Programmer's Manual"
 .SH NAME
 fabs, fabsf, fabsl \- absolute value of floating-point number
 .SH SYNOPSIS
@@ -84,6 +84,14 @@ If
 is negative infinity or positive infinity, positive infinity is returned.
 .SH ERRORS
 No errors occur.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR fabs (),
+.BR fabsf (),
+and
+.BR fabsl ()
+functions are thread-safe.
 .SH CONFORMING TO
 C99, POSIX.1-2001.
 The variant returning
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
