From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] wcscmp.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 2 Dec 2013 13:24:43 +0800
Message-ID: <1385961883-24228-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function wcscmp() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/wcscmp.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/wcscmp.3 b/man3/wcscmp.3
index 9f8ae1f..4ddd5a7 100644
--- a/man3/wcscmp.3
+++ b/man3/wcscmp.3
@@ -13,7 +13,7 @@
 .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.org/online.html
 .\"   ISO/IEC 9899:1999
 .\"
-.TH WCSCMP 3  1999-07-25 "GNU" "Linux Programmer's Manual"
+.TH WCSCMP 3  2013-12-02 "GNU" "Linux Programmer's Manual"
 .SH NAME
 wcscmp \- compare two wide-character strings
 .SH SYNOPSIS
@@ -56,6 +56,11 @@ the corresponding wide-character
 .I s1[i]
 is less than
 .IR s2[i] .
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR wcscmp ()
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
