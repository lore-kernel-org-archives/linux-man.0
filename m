From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] mbsinit.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 26 Aug 2013 16:03:57 +0800
Message-ID: <1377504237-8474-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function mbsinit() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/mbsinit.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/mbsinit.3 b/man3/mbsinit.3
index 04e3ce6..e7b5f60 100644
--- a/man3/mbsinit.3
+++ b/man3/mbsinit.3
@@ -13,7 +13,7 @@
 .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.org/online.html
 .\"   ISO/IEC 9899:1999
 .\"
-.TH MBSINIT 3  2000-11-20 "GNU" "Linux Programmer's Manual"
+.TH MBSINIT 3  2013-08-26 "GNU" "Linux Programmer's Manual"
 .SH NAME
 mbsinit \- test for initial shift state
 .SH SYNOPSIS
@@ -81,6 +81,11 @@ is an initial state, or if
 .I ps
 is a NULL pointer.
 Otherwise it returns 0.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR mbsinit ()
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
