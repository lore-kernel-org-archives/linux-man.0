From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] strtoul.3: ATTRIBUTES: Note functions that are thread safe with exceptions
Date: Mon, 27 Jan 2014 09:52:02 +0800
Message-ID: <1390787522-12070-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions strtoul(), strtoull() and strtouq() are thread safe
with exceptions.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/strtoul.3 | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/man3/strtoul.3 b/man3/strtoul.3
index a40a99a..034f647 100644
--- a/man3/strtoul.3
+++ b/man3/strtoul.3
@@ -30,7 +30,7 @@
 .\" Fixed typo, aeb, 950823
 .\" 2002-02-22, joey, mihtjel: Added strtoull()
 .\"
-.TH STRTOUL 3  2011-09-15 "GNU" "Linux Programmer's Manual"
+.TH STRTOUL 3  2014-01-27 "GNU" "Linux Programmer's Manual"
 .SH NAME
 strtoul, strtoull, strtouq \- convert a string to an unsigned long integer
 .SH SYNOPSIS
@@ -162,6 +162,18 @@ to
 .B EINVAL
 in case
 no conversion was performed (no digits seen, and 0 returned).
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR strtoul (),
+.BR strtoull (),
+and
+.BR strtouq ()
+functions are thread-safe with exceptions.
+These functions can be safely used in multithreaded applications,
+as long as
+.BR setlocale (3)
+is not called to change the locale during their execution.
 .SH CONFORMING TO
 .BR strtoul ()
 conforms to SVr4, C89, C99 and POSIX-2001, and
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
