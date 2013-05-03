From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getpwent.3: ATTRIBUTES: Note function that is not thread-safe
Date: Fri, 3 May 2013 17:19:51 +0800
Message-ID: <1367572791-22023-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function getpwent() is not thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getpwent.3 | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/man3/getpwent.3 b/man3/getpwent.3
index bccc064..cd83936 100644
--- a/man3/getpwent.3
+++ b/man3/getpwent.3
@@ -151,6 +151,17 @@ Insufficient buffer space supplied.
 .TP
 .I /etc/passwd
 local password database file
+.SH ATTRIBUTES
+.SS Multithreading(see pthreads(7))
+The
+.BR getpwent()
+is not thread-safe.
+.LP
+The
+.BR setpwent()
+and
+.BR endpwent()
+functions are thread-safe.
 .SH CONFORMING TO
 SVr4, 4.3BSD, POSIX.1-2001.
 The
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
