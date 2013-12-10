From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] usleep.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 10 Dec 2013 17:07:49 +0800
Message-ID: <1386666469-30753-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function usleep() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/usleep.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/usleep.3 b/man3/usleep.3
index 81aa6a9..3229fe8 100644
--- a/man3/usleep.3
+++ b/man3/usleep.3
@@ -30,7 +30,7 @@
 .\" Modified 2001-04-01 by aeb
 .\" Modified 2003-07-23 by aeb
 .\"
-.TH USLEEP 3  2013-04-19 "" "Linux Programmer's Manual"
+.TH USLEEP 3  2013-12-10 "" "Linux Programmer's Manual"
 .SH NAME
 usleep \- suspend execution for microsecond intervals
 .SH SYNOPSIS
@@ -88,6 +88,11 @@ Interrupted by a signal; see
 .B EINVAL
 \fIusec\fP is not smaller than 1000000.
 (On systems where that is considered an error.)
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR usleep ()
+function is thread-safe.
 .SH CONFORMING TO
 4.3BSD, POSIX.1-2001.
 POSIX.1-2001 declares this function obsolete; use
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
