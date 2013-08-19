From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] ldexp.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 19 Aug 2013 15:31:54 +0800
Message-ID: <1376897514-12543-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions ldexp(), ldexpf() and ldexpl() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/ldexp.3 | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/man3/ldexp.3 b/man3/ldexp.3
index 03ae43f..e770469 100644
--- a/man3/ldexp.3
+++ b/man3/ldexp.3
@@ -31,7 +31,7 @@
 .\" Modified 1993-07-24 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
 .\" Modified 2004-10-31 by aeb
 .\"
-.TH LDEXP 3 2010-09-20 "" "Linux Programmer's Manual"
+.TH LDEXP 3 2013-08-19 "" "Linux Programmer's Manual"
 .SH NAME
 ldexp, ldexpf, ldexpl \- multiply floating-point number by integral power of 2
 .SH SYNOPSIS
@@ -126,6 +126,14 @@ is set to
 An underflow floating-point exception
 .RB ( FE_UNDERFLOW )
 is raised.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR ldexp (),
+.BR ldexpf (),
+and
+.BR ldexpl ()
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
