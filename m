From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] readdir.3: ATTRIBUTES: Note function that is not thread-safe
Date: Thu, 23 May 2013 16:14:56 +0800
Message-ID: <1369296896-30609-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function readdir() is not thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/readdir.3 | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/man3/readdir.3 b/man3/readdir.3
index 140b5e4..ed6c816 100644
--- a/man3/readdir.3
+++ b/man3/readdir.3
@@ -144,6 +144,15 @@ returns 0, and returns NULL in
 .TP
 .B EBADF
 Invalid directory stream descriptor \fIdirp\fP.
+.SH ATTRIBUTES
+.SS Multithreading(see pthreads(7))
+The
+.BR readdir ()
+function is not thread-safe.
+.LP
+The
+.BR readdir_r ()
+function is thread-safe.
 .SH CONFORMING TO
 SVr4, 4.3BSD, POSIX.1-2001.
 .SH NOTES
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
