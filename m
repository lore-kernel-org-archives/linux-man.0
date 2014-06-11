From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] mkstemp.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 11 Jun 2014 13:37:21 +0800
Message-ID: <1402465041-9951-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions mkstemp(), mkostemp(), mkstemps() and mkostemps()
are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/mkstemp.3 | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/man3/mkstemp.3 b/man3/mkstemp.3
index d2367bb..b57a254 100644
--- a/man3/mkstemp.3
+++ b/man3/mkstemp.3
@@ -192,6 +192,15 @@ is available since glibc 2.7.
 and
 .BR mkostemps ()
 are available since glibc 2.11.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR mkstemp (),
+.BR mkostemp (),
+.BR mkstemps (),
+and
+.BR mkostemps ()
+functions are thread-safe.
 .SH CONFORMING TO
 .BR mkstemp ():
 4.3BSD, POSIX.1-2001.
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
