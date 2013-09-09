From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] wctomb.3: ATTRIBUTES: Note function that is not thread-safe
Date: Mon, 9 Sep 2013 15:13:02 +0800
Message-ID: <1378710782-22523-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function wctomb() is not thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/wctomb.3 | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/man3/wctomb.3 b/man3/wctomb.3
index e8684e4..389c59f 100644
--- a/man3/wctomb.3
+++ b/man3/wctomb.3
@@ -13,7 +13,7 @@
 .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.org/online.html
 .\"   ISO/IEC 9899:1999
 .\"
-.TH WCTOMB 3  1999-07-25 "GNU" "Linux Programmer's Manual"
+.TH WCTOMB 3  2013-09-09 "GNU" "Linux Programmer's Manual"
 .SH NAME
 wctomb \- convert a wide character to a multibyte sequence
 .SH SYNOPSIS
@@ -81,6 +81,11 @@ is NULL, the
 .BR wctomb ()
 function returns nonzero if the
 encoding has nontrivial shift state, or zero if the encoding is stateless.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR wctomb ()
+function is not thread-safe.
 .SH CONFORMING TO
 C99.
 .SH NOTES
@@ -91,7 +96,6 @@ depends on the
 category of the
 current locale.
 .PP
-This function is not multithread safe.
 The function
 .BR wcrtomb (3)
 provides
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
