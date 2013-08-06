From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] ilogb.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 6 Aug 2013 16:59:20 +0800
Message-ID: <1375779560-10388-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions ilogb(), ilogbf() and ilogbl() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/ilogb.3 | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/man3/ilogb.3 b/man3/ilogb.3
index a4624a3..481099b 100644
--- a/man3/ilogb.3
+++ b/man3/ilogb.3
@@ -26,7 +26,7 @@
 .\"
 .\" Inspired by a page by Walter Harms created 2002-08-10
 .\"
-.TH ILOGB 3 2010-09-20 "" "Linux Programmer's Manual"
+.TH ILOGB 3 2013-08-06 "" "Linux Programmer's Manual"
 .SH NAME
 ilogb, ilogbf, ilogbl \- get integer exponent of a floating-point value
 .SH SYNOPSIS
@@ -143,6 +143,14 @@ or raise an exception for this case.
 .\" or raise an exception?
 .\" log(), log2(), log10() do set errno
 .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6794
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR ilogb (),
+.BR ilogbf (),
+and
+.BR ilogbl ()
+functions are thread-safe.
 .SH CONFORMING TO
 C99, POSIX.1-2001.
 .SH SEE ALSO
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
