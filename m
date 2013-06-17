From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] strerror.3: ATTRIBUTES: Note function that is not thread-safe
Date: Mon, 17 Jun 2013 17:29:36 +0800
Message-ID: <1371461376-28573-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function strerror() is not thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/strerror.3 | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/man3/strerror.3 b/man3/strerror.3
index 60d3112..d93bc8a 100644
--- a/man3/strerror.3
+++ b/man3/strerror.3
@@ -172,6 +172,15 @@ is not a valid error number.
 .TP
 .B ERANGE
 Insufficient storage was supplied to contain the error description string.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR strerror ()
+function is not thread-safe.
+.LP
+The
+.BR strerror_r ()
+function is thread-safe.
 .SH CONFORMING TO
 .BR strerror ()
 is specified by POSIX.1-2001, C89, C99.
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
