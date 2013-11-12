From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] wcsstr.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 12 Nov 2013 09:42:42 +0800
Message-ID: <1384220562-17970-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function wcsstr() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/wcsstr.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/wcsstr.3 b/man3/wcsstr.3
index 19abfd9..c77c8bd 100644
--- a/man3/wcsstr.3
+++ b/man3/wcsstr.3
@@ -13,7 +13,7 @@
 .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.org/online.html
 .\"   ISO/IEC 9899:1999
 .\"
-.TH WCSSTR 3  2011-09-28 "GNU" "Linux Programmer's Manual"
+.TH WCSSTR 3  2013-11-12 "GNU" "Linux Programmer's Manual"
 .SH NAME
 wcsstr \- locate a substring in a wide-character string
 .SH SYNOPSIS
@@ -53,6 +53,11 @@ is the empty wide-character string,
 the return value is always
 .I haystack
 itself.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR wcsstr ()
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
