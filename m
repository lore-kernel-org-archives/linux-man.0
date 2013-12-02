From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] wcschr.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 2 Dec 2013 11:20:28 +0800
Message-ID: <1385954428-20106-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function wcschr() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/wcschr.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/wcschr.3 b/man3/wcschr.3
index 8177692..597082f 100644
--- a/man3/wcschr.3
+++ b/man3/wcschr.3
@@ -13,7 +13,7 @@
 .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.org/online.html
 .\"   ISO/IEC 9899:1999
 .\"
-.TH WCSCHR 3  1999-07-25 "GNU" "Linux Programmer's Manual"
+.TH WCSCHR 3  2013-12-02 "GNU" "Linux Programmer's Manual"
 .SH NAME
 wcschr \- search a wide character in a wide-character string
 .SH SYNOPSIS
@@ -44,6 +44,11 @@ in the wide-character string pointed to by
 or NULL if
 .I wc
 does not occur in the string.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR wcschr ()
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
