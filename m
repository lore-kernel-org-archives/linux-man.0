From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] ferror.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 5 Jun 2013 10:31:38 +0800
Message-ID: <1370399498-6355-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions ferror(), clearerr(), feof() and fileno() are
thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/ferror.3 | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/man3/ferror.3 b/man3/ferror.3
index c78a4ea..976a37b 100644
--- a/man3/ferror.3
+++ b/man3/ferror.3
@@ -103,6 +103,15 @@ return \-1 and set
 .I errno
 to
 .BR EBADF .)
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR clearerr (),
+.BR feof (),
+.BR ferror ()
+and
+.BR fileno ()
+functions are thread-safe.
 .SH CONFORMING TO
 The functions
 .BR clearerr (),
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
