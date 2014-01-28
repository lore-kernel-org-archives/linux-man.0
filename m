From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] iswalnum.3: ATTRIBUTES: Note function that is thread safe with exceptions
Date: Tue, 28 Jan 2014 15:19:15 +0800
Message-ID: <1390893555-873-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function iswalnum() is thread safe with exceptions.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/iswalnum.3 | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/man3/iswalnum.3 b/man3/iswalnum.3
index 89e98a2..aa7d069 100644
--- a/man3/iswalnum.3
+++ b/man3/iswalnum.3
@@ -13,7 +13,7 @@
 .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.org/online.html
 .\"   ISO/IEC 9899:1999
 .\"
-.TH ISWALNUM 3  1999-07-25 "GNU" "Linux Programmer's Manual"
+.TH ISWALNUM 3  2014-01-28 "GNU" "Linux Programmer's Manual"
 .SH NAME
 iswalnum \- test for alphanumeric wide character
 .SH SYNOPSIS
@@ -63,6 +63,14 @@ if
 is a wide character
 belonging to the wide-character class "alnum".
 Otherwise it returns zero.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR iswalnum ()
+function is thread-safe with exceptions.
+It can be safely used in multithreaded applications, as long as
+.BR setlocale (3)
+is not called to change the locale during its execution.
 .SH CONFORMING TO
 C99.
 .SH NOTES
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
