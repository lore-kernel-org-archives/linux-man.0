From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] ptsname.3: ATTRIBUTES: Note function that is not thread-safe
Date: Mon, 6 May 2013 16:03:37 +0800
Message-ID: <1367827417-3650-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function ptsname() is not thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/ptsname.3 | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/man3/ptsname.3 b/man3/ptsname.3
index 9ebafc3..c4d0fa1 100644
--- a/man3/ptsname.3
+++ b/man3/ptsname.3
@@ -76,6 +76,15 @@ is too small.
 .SH VERSIONS
 .BR ptsname ()
 is provided in glibc since version 2.1.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR ptsname ()
+function is not thread-safe.
+.LP
+The
+.BR ptsname_r ()
+function is thread-safe.
 .SH CONFORMING TO
 .BR ptsname ()
 is part of the UNIX 98 pseudoterminal support (see
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
