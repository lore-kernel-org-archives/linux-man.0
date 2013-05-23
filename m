From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] rexec.3: ATTRIBUTES: Note functions that are not thread-safe
Date: Thu, 23 May 2013 16:06:27 +0800
Message-ID: <1369296387-29722-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions rexec() and rexec_af() are not thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/rexec.3 | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/man3/rexec.3 b/man3/rexec.3
index 6de7b5d..e39d41f 100644
--- a/man3/rexec.3
+++ b/man3/rexec.3
@@ -139,6 +139,13 @@ or
 The
 .BR rexec_af ()
 function was added to glibc in version 2.2.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR rexec ()
+and
+.BR rexec_af ()
+functions are not thread-safe.
 .SH CONFORMING TO
 These functions are not in POSIX.1-2001.
 The
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
