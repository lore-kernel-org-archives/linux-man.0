From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] pthread_sigmask.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 19 May 2014 11:26:45 +0800
Message-ID: <1400470005-21741-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function pthread_sigmask() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/pthread_sigmask.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/pthread_sigmask.3 b/man3/pthread_sigmask.3
index f608fd7..c8d73a0 100644
--- a/man3/pthread_sigmask.3
+++ b/man3/pthread_sigmask.3
@@ -23,7 +23,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH PTHREAD_SIGMASK 3 2014-02-04 "Linux" "Linux Programmer's Manual"
+.TH PTHREAD_SIGMASK 3 2014-05-19 "Linux" "Linux Programmer's Manual"
 .SH NAME
 pthread_sigmask \- examine and change mask of blocked signals
 .SH SYNOPSIS
@@ -66,6 +66,11 @@ on error, it returns an error number.
 .SH ERRORS
 See
 .BR sigprocmask (2).
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR pthread_sigmask ()
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
