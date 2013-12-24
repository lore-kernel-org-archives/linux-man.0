From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] towctrans.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 24 Dec 2013 11:32:21 +0800
Message-ID: <1387855941-32458-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function towctrans() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/towctrans.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/towctrans.3 b/man3/towctrans.3
index a0613cc..d584713 100644
--- a/man3/towctrans.3
+++ b/man3/towctrans.3
@@ -13,7 +13,7 @@
 .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.org/online.html
 .\"   ISO/IEC 9899:1999
 .\"
-.TH TOWCTRANS 3  1999-07-25 "GNU" "Linux Programmer's Manual"
+.TH TOWCTRANS 3  2013-12-24 "GNU" "Linux Programmer's Manual"
 .SH NAME
 towctrans \- wide-character transliteration
 .SH SYNOPSIS
@@ -52,6 +52,11 @@ if
 .I wc
 is
 .BR WEOF .
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR towctrans ()
+function is thread-safe.
 .SH CONFORMING TO
 C99.
 .SH NOTES
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
