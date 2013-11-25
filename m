From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] wcsncasecmp.3: ATTRIBUTES: Note function that is thread safe with exceptions
Date: Mon, 25 Nov 2013 16:25:03 +0800
Message-ID: <1385367903-6952-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function wcsncasecmp() is thread safe with exceptions.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/wcsncasecmp.3 | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/man3/wcsncasecmp.3 b/man3/wcsncasecmp.3
index 6495044..3e88dab 100644
--- a/man3/wcsncasecmp.3
+++ b/man3/wcsncasecmp.3
@@ -12,7 +12,7 @@
 .\"   Dinkumware C library reference http://www.dinkumware.com/
 .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.org/online.html
 .\"
-.TH WCSNCASECMP 3 2010-09-15 "GNU" "Linux Programmer's Manual"
+.TH WCSNCASECMP 3 2013-11-25 "GNU" "Linux Programmer's Manual"
 .SH NAME
 wcsncasecmp \- compare two fixed-size wide-character strings, ignoring case
 .SH SYNOPSIS
@@ -85,6 +85,14 @@ ignoring case.
 The
 .BR wcsncasecmp ()
 function is provided in glibc since version 2.1.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR wcsncasecmp ()
+function is thread-safe with exceptions.
+It can be safely used in multithreaded applications, as long as
+.BR setlocale (3)
+is not called to change the locale.
 .SH CONFORMING TO
 POSIX.1-2008.
 This function is not specified in POSIX.1-2001,
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
