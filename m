From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] ffs.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 14 Apr 2014 11:37:54 +0800
Message-ID: <1397446674-23615-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions ffs(), ffsl() and ffsll() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/ffs.3 | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/man3/ffs.3 b/man3/ffs.3
index 2cff0e1..b22c8d6 100644
--- a/man3/ffs.3
+++ b/man3/ffs.3
@@ -30,7 +30,7 @@
 .\"
 .\" Modified 2003 Walter Harms (walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org)
 .\"
-.TH FFS 3 2010-09-20 "GNU" "Linux Programmer's Manual"
+.TH FFS 3 2014-04-14 "GNU" "Linux Programmer's Manual"
 .SH NAME
 ffs, ffsl, ffsll \- find first bit set in a word
 .SH SYNOPSIS
@@ -88,6 +88,14 @@ arguments of possibly different size.
 These functions return the position of the first bit set,
 or 0 if no bits are set in
 .IR i .
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR ffs (),
+.BR ffsl (),
+and
+.BR ffsll ()
+functions are thread-safe.
 .SH CONFORMING TO
 .BR ffs ():
 4.3BSD, POSIX.1-2001.
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
