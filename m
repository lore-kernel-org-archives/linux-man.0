From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] pthread_setschedprio.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 19 May 2014 10:10:20 +0800
Message-ID: <1400465420-18027-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function pthread_setschedprio() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/pthread_setschedprio.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/pthread_setschedprio.3 b/man3/pthread_setschedprio.3
index 6910f60..334c456 100644
--- a/man3/pthread_setschedprio.3
+++ b/man3/pthread_setschedprio.3
@@ -23,7 +23,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH PTHREAD_SETSCHEDPRIO 3 2008-11-06 "Linux" "Linux Programmer's Manual"
+.TH PTHREAD_SETSCHEDPRIO 3 2014-05-19 "Linux" "Linux Programmer's Manual"
 .SH NAME
 pthread_setschedprio \- set scheduling priority of a thread
 .SH SYNOPSIS
@@ -80,6 +80,11 @@ to an unsupported value") error for
 .BR pthread_setschedparam (3).
 .SH VERSIONS
 This function is available in glibc since version 2.3.4.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR pthread_setschedprio ()
+function is thread-safe.
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH NOTES
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
