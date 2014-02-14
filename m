From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] iswctype.3: ATTRIBUTES: Note function that is thread-safe
Date: Fri, 14 Feb 2014 09:25:43 +0800
Message-ID: <1392341143-24155-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function iswctype() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/iswctype.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/iswctype.3 b/man3/iswctype.3
index a7dfec4..28763ad 100644
--- a/man3/iswctype.3
+++ b/man3/iswctype.3
@@ -13,7 +13,7 @@
 .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.org/online.html
 .\"   ISO/IEC 9899:1999
 .\"
-.TH ISWCTYPE 3  1999-07-25 "GNU" "Linux Programmer's Manual"
+.TH ISWCTYPE 3  2014-02-14 "GNU" "Linux Programmer's Manual"
 .SH NAME
 iswctype \- wide-character classification
 .SH SYNOPSIS
@@ -54,6 +54,11 @@ the
 has the designated
 property.
 Otherwise it returns 0.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR iswctype ()
+function is thread-safe.
 .SH CONFORMING TO
 C99.
 .SH NOTES
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
