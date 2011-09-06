From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getdate.3: Add description of the function is not thread-safe
Date: Tue, 06 Sep 2011 17:23:53 +0800
Message-ID: <4E65E6A9.6080005@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


The function getdate() uses a static variable "tmbuf", so it is not thread-safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getdate.3 |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/man3/getdate.3 b/man3/getdate.3
index 7f30f9c..038a49c 100644
--- a/man3/getdate.3
+++ b/man3/getdate.3
@@ -25,7 +25,7 @@
 .\" Modified, 2001-12-26, aeb
 .\" 2008-09-07, mtk, Various rewrites; added an example program.
 .\"
-.TH GETDATE 3 2010-09-20 "" "Linux Programmer's Manual"
+.TH GETDATE 3 2011-09-06 "" "Linux Programmer's Manual"
 .SH NAME
 getdate, getdate_r \- convert a date-plus-time string to broken-down time
 .SH SYNOPSIS
@@ -190,6 +190,15 @@ File containing format patterns.
 .BR TZ ", " LC_TIME
 Variables used by
 .BR strptime (3).
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR getdate ()
+function is not thread-safe.
+.LP
+The
+.BR getdate_r ()
+function is thread-safe.
 .SH "CONFORMING TO"
 POSIX.1-2001.
 .SH NOTES
-- 
1.7.1

-- 
Best Regards,
Peng Haitao

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
