From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] cos.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 14 Oct 2013 15:10:57 +0800
Message-ID: <1381734657-24334-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions cos(), cosf() and cosl() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/cos.3 | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/man3/cos.3 b/man3/cos.3
index c68c204..6e7fb76 100644
--- a/man3/cos.3
+++ b/man3/cos.3
@@ -31,7 +31,7 @@
 .\" Modified 1993-07-24 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
 .\" Modified 2002-07-27 by Walter Harms
 .\" 	(walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org)
-.TH COS 3 2010-09-11 ""   "Linux Programmer's Manual"
+.TH COS 3 2013-10-14 ""   "Linux Programmer's Manual"
 .SH NAME
 cos, cosf, cosl \- cosine function
 .SH SYNOPSIS
@@ -101,6 +101,14 @@ is set to
 An invalid floating-point exception
 .RB ( FE_INVALID )
 is raised.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR cos (),
+.BR cosf (),
+and
+.BR cosl ()
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
