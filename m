From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] sigwait.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 16 Dec 2013 14:20:25 +0800
Message-ID: <1387174825-26633-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function sigwait() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/sigwait.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/sigwait.3 b/man3/sigwait.3
index 913b2a2..3d6caa9 100644
--- a/man3/sigwait.3
+++ b/man3/sigwait.3
@@ -23,7 +23,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH SIGWAIT 3 2012-07-21 "Linux" "Linux Programmer's Manual"
+.TH SIGWAIT 3 2013-12-16 "Linux" "Linux Programmer's Manual"
 .SH NAME
 sigwait \- wait for a signal
 .SH SYNOPSIS
@@ -77,6 +77,11 @@ On error, it returns a positive error number (listed in ERRORS).
 .\" Does not occur for glibc.
 .I set
 contains an invalid signal number.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR sigwait ()
+function is thread-safe.
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH NOTES
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
