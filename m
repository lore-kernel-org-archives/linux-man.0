From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] ecvt.3: Add description of the functions are not thread-safe
Date: Tue, 12 Mar 2013 18:41:58 +0800
Message-ID: <1363084918-6781-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions ecvt() and fcvt() return a string located in a static buffer which
is overwritten by the next call to the functions, so they are not thread-safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/ecvt.3 | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/man3/ecvt.3 b/man3/ecvt.3
index c35879f..0506d1f 100644
--- a/man3/ecvt.3
+++ b/man3/ecvt.3
@@ -27,7 +27,7 @@
 .\" Modified Sat Jul 24 19:40:39 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
 .\" Modified Fri Jun 25 12:10:47 1999 by Andries Brouwer (aeb-rh8NL+sEX9E@public.gmane.org)
 .\"
-.TH ECVT 3 2010-09-20 "" "Linux Programmer's Manual"
+.TH ECVT 3 2013-03-12 "" "Linux Programmer's Manual"
 .SH NAME
 ecvt, fcvt \- convert a floating-point number to a string
 .SH SYNOPSIS
@@ -105,6 +105,13 @@ The static string is overwritten by each call to
 .BR ecvt ()
 or
 .BR fcvt ().
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR ecvt ()
+and
+.BR fcvt ()
+functions are not thread-safe.
 .SH CONFORMING TO
 SVr2;
 marked as LEGACY in POSIX.1-2001.
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
