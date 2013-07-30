From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] fmin.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 30 Jul 2013 10:35:26 +0800
Message-ID: <1375151726-24538-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions fmin(), fminf() and fminl() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/fmin.3 | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/man3/fmin.3 b/man3/fmin.3
index 517a2e3..74d78b0 100644
--- a/man3/fmin.3
+++ b/man3/fmin.3
@@ -6,7 +6,7 @@
 .\" Distributed under GPL
 .\" %%%LICENSE_END
 .\"
-.TH FMIN 3 2010-09-20 "" "Linux Programmer's Manual"
+.TH FMIN 3 2013-07-30 "" "Linux Programmer's Manual"
 .SH NAME
 fmin, fminf, fminl \- determine minimum of two floating-point numbers
 .SH SYNOPSIS
@@ -55,6 +55,14 @@ If both arguments are NaN, a NaN is returned.
 No errors occur.
 .SH VERSIONS
 These functions first appeared in glibc in version 2.1.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR fmin (),
+.BR fminf (),
+and
+.BR fminl ()
+functions are thread-safe.
 .SH CONFORMING TO
 C99, POSIX.1-2001.
 .SH SEE ALSO
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
