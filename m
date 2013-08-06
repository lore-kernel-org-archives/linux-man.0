From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] fpclassify.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 6 Aug 2013 16:37:44 +0800
Message-ID: <1375778264-9177-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions fpclassify(), isfinite(), isnormal(), isnan(), and
isinf() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/fpclassify.3 | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/man3/fpclassify.3 b/man3/fpclassify.3
index d4414d3..86d3c3c 100644
--- a/man3/fpclassify.3
+++ b/man3/fpclassify.3
@@ -7,7 +7,7 @@
 .\" This was done with the help of the glibc manual.
 .\"
 .\" 2004-10-31, aeb, corrected
-.TH FPCLASSIFY 3  2010-09-20 "" "Linux Programmer's Manual"
+.TH FPCLASSIFY 3  2013-08-06 "" "Linux Programmer's Manual"
 .SH NAME
 fpclassify, isfinite, isnormal, isnan, isinf \- floating-point
 classification macros
@@ -115,6 +115,16 @@ returns 1 if
 is positive infinity, and \-1 if
 .I x
 is negative infinity.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR fpclassify (),
+.BR isfinite (),
+.BR isnormal (),
+.BR isnan (),
+and
+.BR isinf ()
+macros are thread-safe.
 .SH CONFORMING TO
 C99, POSIX.1.
 
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
