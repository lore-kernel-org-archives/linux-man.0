From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] pthread_kill.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 13 May 2014 11:35:47 +0800
Message-ID: <1399952147-29649-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function pthread_kill() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/pthread_kill.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/pthread_kill.3 b/man3/pthread_kill.3
index 82c3978..5c1d0c4 100644
--- a/man3/pthread_kill.3
+++ b/man3/pthread_kill.3
@@ -23,7 +23,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH PTHREAD_KILL 3 2014-02-04 "Linux" "Linux Programmer's Manual"
+.TH PTHREAD_KILL 3 2014-05-13 "Linux" "Linux Programmer's Manual"
 .SH NAME
 pthread_kill \- send a signal to a thread
 .SH SYNOPSIS
@@ -69,6 +69,11 @@ on error, it returns an error number, and no signal is sent.
 .TP
 .B EINVAL
 An invalid signal was specified.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR pthread_kill ()
+function is thread-safe.
 .SH CONFORMING TO
 POSIX.1-2008.
 .SH NOTES
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
