From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] sincos.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 23 Dec 2013 10:08:59 +0800
Message-ID: <1387764539-11723-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions sincos(), sincosf() and sincosl() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/sincos.3 | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/man3/sincos.3 b/man3/sincos.3
index 0362f2c..62e80a2 100644
--- a/man3/sincos.3
+++ b/man3/sincos.3
@@ -6,7 +6,7 @@
 .\" Distributed under GPL
 .\" %%%LICENSE_END
 .\"
-.TH SINCOS 3  2008-08-11 "GNU" "Linux Programmer's Manual"
+.TH SINCOS 3  2013-12-23 "GNU" "Linux Programmer's Manual"
 .SH NAME
 sincos, sincosf, sincosl \- calculate sin and cos simultaneously
 .SH SYNOPSIS
@@ -72,6 +72,14 @@ These functions do not set
 .\" those functions.
 .SH VERSIONS
 These functions first appeared in glibc in version 2.1.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR sincos (),
+.BR sincosf (),
+and
+.BR sincosl ()
+functions are thread-safe.
 .SH CONFORMING TO
 This function is a GNU extension.
 .SH SEE ALSO
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
