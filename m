From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] wcslen.3: ATTRIBUTES: Note function that is thread-safe
Date: Thu, 21 Nov 2013 10:46:51 +0800
Message-ID: <1385002011-12062-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function wcslen() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/wcslen.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/wcslen.3 b/man3/wcslen.3
index 88387ea..773280e 100644
--- a/man3/wcslen.3
+++ b/man3/wcslen.3
@@ -13,7 +13,7 @@
 .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.org/online.html
 .\"   ISO/IEC 9899:1999
 .\"
-.TH WCSLEN 3  2011-09-28 "GNU" "Linux Programmer's Manual"
+.TH WCSLEN 3  2013-11-21 "GNU" "Linux Programmer's Manual"
 .SH NAME
 wcslen \- determine the length of a wide-character string
 .SH SYNOPSIS
@@ -39,6 +39,11 @@ The
 function returns the
 number of wide characters in
 .IR s .
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR wcslen ()
+function is thread-safe.
 .SH CONFORMING TO
 C99.
 .SH SEE ALSO
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
