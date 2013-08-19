From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] lrint.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 19 Aug 2013 17:47:07 +0800
Message-ID: <1376905627-25802-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions lrint(), lrintf(), lrintl(), llrint(), llrintf(),
and llrintl() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/lrint.3 | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/man3/lrint.3 b/man3/lrint.3
index a2e2805..b698977 100644
--- a/man3/lrint.3
+++ b/man3/lrint.3
@@ -24,7 +24,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH LRINT 3  2010-09-20 "" "Linux Programmer's Manual"
+.TH LRINT 3  2013-08-19 "" "Linux Programmer's Manual"
 .SH NAME
 lrint, lrintf, lrintl, llrint, llrintf, llrintl \- round to nearest integer
 .SH SYNOPSIS
@@ -106,6 +106,17 @@ These functions do not set
 .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6798
 .SH VERSIONS
 These functions first appeared in glibc in version 2.1.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR lrint (),
+.BR lrintf (),
+.BR lrintl (),
+.BR llrint (),
+.BR llrintf (),
+and
+.BR llrintl ()
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
