From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] wcswidth.3: ATTRIBUTES: Note function that is thread safe with exceptions
Date: Mon, 18 Nov 2013 15:50:31 +0800
Message-ID: <1384761031-31804-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function wcswidth() is thread safe with exceptions.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/wcswidth.3 | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/man3/wcswidth.3 b/man3/wcswidth.3
index cf326be..0252b1b 100644
--- a/man3/wcswidth.3
+++ b/man3/wcswidth.3
@@ -12,7 +12,7 @@
 .\"   Dinkumware C library reference http://www.dinkumware.com/
 .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.org/online.html
 .\"
-.TH WCSWIDTH 3  2010-09-10 "GNU" "Linux Programmer's Manual"
+.TH WCSWIDTH 3  2013-11-18 "GNU" "Linux Programmer's Manual"
 .SH NAME
 wcswidth \- determine columns needed for a fixed-size wide-character string
 .SH SYNOPSIS
@@ -44,6 +44,14 @@ wide-character string
 .IR s ,
 truncated to at most length
 .IR n .
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR wcswidth ()
+function is thread-safe with exceptions.
+It can be safely used in multithreaded applications, as long as
+.BR setlocale (3)
+is not called to change the locale.
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH NOTES
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
