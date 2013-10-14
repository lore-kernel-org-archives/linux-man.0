From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] copysign.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 14 Oct 2013 11:19:06 +0800
Message-ID: <1381720746-17089-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions copysign(), copysignf() and copysignl() are thread
safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/copysign.3 | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/man3/copysign.3 b/man3/copysign.3
index 2ac104a..2e35b68 100644
--- a/man3/copysign.3
+++ b/man3/copysign.3
@@ -28,7 +28,7 @@
 .\"     386BSD man pages
 .\" Modified 1993-07-24 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
 .\" Modified 2002-08-10 by Walter Harms (walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org)
-.TH COPYSIGN 3  2012-03-25 "GNU" "Linux Programmer's Manual"
+.TH COPYSIGN 3  2013-10-14 "GNU" "Linux Programmer's Manual"
 .SH NAME
 copysign, copysignf, copysignl \- copy sign of a number
 .SH SYNOPSIS
@@ -89,6 +89,14 @@ a NaN with the sign bit of
 is returned.
 .SH ERRORS
 No errors occur.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR copysign (),
+.BR copysignf (),
+and
+.BR copysignl ()
+functions are thread-safe.
 .SH CONFORMING TO
 C99, POSIX.1-2001.
 .\" 4.3BSD.
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
