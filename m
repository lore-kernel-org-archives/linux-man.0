From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] tmpnam.3: ATTRIBUTES: Note function that is thread safe with exceptions
Date: Wed, 5 Jun 2013 10:12:50 +0800
Message-ID: <1370398370-4574-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function tmpnam() is thread safe with exceptions.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/tmpnam.3 | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/man3/tmpnam.3 b/man3/tmpnam.3
index b2bc3b2..0b92970 100644
--- a/man3/tmpnam.3
+++ b/man3/tmpnam.3
@@ -74,6 +74,16 @@ function returns a pointer to a unique temporary
 filename, or NULL if a unique name cannot be generated.
 .SH ERRORS
 No errors are defined.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR tmpnam ()
+function is thread-safe with exceptions.
+It is not thread-safe if called with a NULL parameter.
+.LP
+The
+.BR tmpnam_r ()
+function is thread-safe.
 .SH CONFORMING TO
 SVr4, 4.3BSD, C89, C99, POSIX.1-2001.
 POSIX.1-2008 marks
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
