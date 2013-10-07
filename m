From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] ftok.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 7 Oct 2013 14:21:00 +0800
Message-ID: <1381126860-14943-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function ftok() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/ftok.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/ftok.3 b/man3/ftok.3
index 925c301..6a48109 100644
--- a/man3/ftok.3
+++ b/man3/ftok.3
@@ -26,7 +26,7 @@
 .\"	Changed data type of proj_id; minor fixes
 .\"	aeb: further fixes; added notes.
 .\"
-.TH FTOK 3 2001-11-28 "GNU" "Linux Programmer's Manual"
+.TH FTOK 3 2013-10-07 "GNU" "Linux Programmer's Manual"
 .SH NAME
 ftok \- convert a pathname and a project identifier to a System V IPC key
 .SH SYNOPSIS
@@ -67,6 +67,11 @@ On failure \-1 is returned, with
 indicating the error as for the
 .BR stat (2)
 system call.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR ftok ()
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
