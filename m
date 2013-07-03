From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] clock_getcpuclockid.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 3 Jul 2013 09:27:26 +0800
Message-ID: <1372814846-2418-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function clock_getcpuclockid() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/clock_getcpuclockid.3 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man3/clock_getcpuclockid.3 b/man3/clock_getcpuclockid.3
index 42d0775..747dc76 100644
--- a/man3/clock_getcpuclockid.3
+++ b/man3/clock_getcpuclockid.3
@@ -85,6 +85,11 @@ There is no process with the ID
 The
 .BR clock_getcpuclockid ()
 function is available in glibc since version 2.2.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR clock_getcpuclockid ()
+function is thread-safe.
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH NOTES
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
