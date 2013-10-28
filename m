From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] daemon.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 28 Oct 2013 10:47:14 +0800
Message-ID: <1382928434-8812-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function daemon() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/daemon.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/daemon.3 b/man3/daemon.3
index 9c8215b..91b73e7 100644
--- a/man3/daemon.3
+++ b/man3/daemon.3
@@ -33,7 +33,7 @@
 .\"
 .\"	@(#)daemon.3	8.1 (Berkeley) 6/9/93
 .\" Added mentioning of glibc weirdness wrt unistd.h. 5/11/98, Al Viro
-.TH DAEMON 3 2009-12-05 "GNU" "Linux Programmer's Manual"
+.TH DAEMON 3 2013-10-28 "GNU" "Linux Programmer's Manual"
 .SH NAME
 daemon \- run in the background
 .SH SYNOPSIS
@@ -88,6 +88,11 @@ to any of the errors specified for the
 .BR fork (2)
 and
 .BR setsid (2).
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR daemon ()
+function is thread-safe.
 .SH CONFORMING TO
 Not in POSIX.1-2001.
 A similar function appears on the BSDs.
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
