From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] wcscspn.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 2 Dec 2013 15:49:24 +0800
Message-ID: <1385970564-965-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function wcscspn() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/wcscspn.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/wcscspn.3 b/man3/wcscspn.3
index 009a42c..9848608 100644
--- a/man3/wcscspn.3
+++ b/man3/wcscspn.3
@@ -13,7 +13,7 @@
 .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.org/online.html
 .\"   ISO/IEC 9899:1999
 .\"
-.TH WCSCSPN 3  1999-07-25 "GNU" "Linux Programmer's Manual"
+.TH WCSCSPN 3  2013-12-02 "GNU" "Linux Programmer's Manual"
 .SH NAME
 wcscspn \- search a wide-character string for any of a set of wide characters
 .SH SYNOPSIS
@@ -58,6 +58,11 @@ the wide-character string
 or
 .IR wcslen(wcs)
 if there is none.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR wcscspn ()
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
