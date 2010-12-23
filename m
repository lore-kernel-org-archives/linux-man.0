From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] ecvt.3: Add description of the functions are not thread-safe
Date: Thu, 23 Dec 2010 17:07:29 +0800
Message-ID: <4D131151.7020409@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

The functions "ecvt" and "fcvt" return a string located in a static buffer which
is overwritten by the next call to the functions, so they are not thread-safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/ecvt.3 |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/man3/ecvt.3 b/man3/ecvt.3
index 0bc2a4f..83f51cc 100644
--- a/man3/ecvt.3
+++ b/man3/ecvt.3
@@ -27,7 +27,7 @@
 .\" Modified Sat Jul 24 19:40:39 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
 .\" Modified Fri Jun 25 12:10:47 1999 by Andries Brouwer (aeb-rh8NL+sEX9E@public.gmane.org)
 .\"
-.TH ECVT 3 2010-09-20 "" "Linux Programmer's Manual"
+.TH ECVT 3 2010-12-23 "" "Linux Programmer's Manual"
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
 .SH "CONFORMING TO"
 SVr2;
 marked as LEGACY in POSIX.1-2001.
-- 
1.7.0.1


-- 
Best Regards,
Peng Haitao

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
