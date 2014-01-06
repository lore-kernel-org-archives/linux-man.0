From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] sysv_signal.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 6 Jan 2014 13:45:03 +0800
Message-ID: <1388987103-21272-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function sysv_signal() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/sysv_signal.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/sysv_signal.3 b/man3/sysv_signal.3
index 957b9d5..3dd1e93 100644
--- a/man3/sysv_signal.3
+++ b/man3/sysv_signal.3
@@ -22,7 +22,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH SYSV_SIGNAL 3 2007-05-04 "" "Linux Programmer's Manual"
+.TH SYSV_SIGNAL 3 2014-01-06 "" "Linux Programmer's Manual"
 .SH NAME
 sysv_signal \- signal handling with System V semantics
 .SH SYNOPSIS
@@ -57,6 +57,11 @@ on error.
 .SH ERRORS
 As for
 .BR signal (2).
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR sysv_signal ()
+function is thread-safe.
 .SH CONFORMING TO
 This function is nonstandard.
 .SH NOTES
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
