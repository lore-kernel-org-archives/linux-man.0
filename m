From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] sigqueue.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 16 Dec 2013 13:23:59 +0800
Message-ID: <1387171439-22283-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function sigqueue() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/sigqueue.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/sigqueue.3 b/man3/sigqueue.3
index b428501..7e9e2b4 100644
--- a/man3/sigqueue.3
+++ b/man3/sigqueue.3
@@ -25,7 +25,7 @@
 .\" added note on self-signaling, aeb, 2002-06-07
 .\" added note on CAP_KILL, mtk, 2004-06-16
 .\"
-.TH SIGQUEUE 3 2012-03-25 "Linux" "Linux Programmer's Manual"
+.TH SIGQUEUE 3 2013-12-16 "Linux" "Linux Programmer's Manual"
 .SH NAME
 sigqueue \- queue a signal and data to a process
 .SH SYNOPSIS
@@ -111,6 +111,11 @@ No process has a PID matching
 .IR pid .
 .SH VERSIONS
 This system call first appeared in Linux 2.2.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR sigqueue ()
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
