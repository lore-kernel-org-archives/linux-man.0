From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] aio_return.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 26 Jun 2013 16:57:38 +0800
Message-ID: <1372237058-14127-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function aio_return() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/aio_return.3 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man3/aio_return.3 b/man3/aio_return.3
index c2c428d..962f238 100644
--- a/man3/aio_return.3
+++ b/man3/aio_return.3
@@ -74,6 +74,11 @@ is not implemented.
 The
 .BR aio_return ()
 function is available since glibc 2.1.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR aio_return ()
+function is thread-safe.
 .SH CONFORMING TO
 POSIX.1-2001, POSIX.1-2008.
 .SH EXAMPLE
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
