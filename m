From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] wcstok.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 18 Nov 2013 14:23:51 +0800
Message-ID: <1384755831-28274-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function wcstok() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/wcstok.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/wcstok.3 b/man3/wcstok.3
index 3fcbce1..4cbe310 100644
--- a/man3/wcstok.3
+++ b/man3/wcstok.3
@@ -13,7 +13,7 @@
 .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.org/online.html
 .\"   ISO/IEC 9899:1999
 .\"
-.TH WCSTOK 3  2011-09-28 "GNU" "Linux Programmer's Manual"
+.TH WCSTOK 3  2013-11-18 "GNU" "Linux Programmer's Manual"
 .SH NAME
 wcstok \- split wide-character string into tokens
 .SH SYNOPSIS
@@ -76,6 +76,11 @@ The
 .BR wcstok ()
 function returns a pointer to the next token,
 or NULL if no further token was found.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR wcstok ()
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
