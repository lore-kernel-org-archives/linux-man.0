From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getloadavg.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 1 Apr 2014 13:54:44 +0800
Message-ID: <1396331684-27349-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function getloadavg() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getloadavg.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/getloadavg.3 b/man3/getloadavg.3
index 2510439..cad44f1 100644
--- a/man3/getloadavg.3
+++ b/man3/getloadavg.3
@@ -31,7 +31,7 @@
 .\"
 .\" 2007-12-08, mtk, Converted from mdoc to man macros
 .\"
-.TH GETLOADAVG 3 2007-12-08 "Linux" "Linux Programmer's Manual"
+.TH GETLOADAVG 3 2014-04-01 "Linux" "Linux Programmer's Manual"
 .SH NAME
 getloadavg \- get system load averages
 .SH SYNOPSIS
@@ -62,6 +62,11 @@ the number of samples actually retrieved is returned.
 .\" 4.3BSD Reno .
 .SH VERSIONS
 This function is available in glibc since version 2.2.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR getloadavg ()
+function is thread-safe.
 .SH CONFORMING TO
 Not in POSIX.1-2001.
 Present on the BSDs and Solaris.
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
