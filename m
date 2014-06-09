From: Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] mq_getattr.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 9 Jun 2014 17:50:14 +0800
Message-ID: <1402307414.1804.42.camel@fedora>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "mtk.manpages" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, carlos <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, aoliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The functions mq_getattr() and mq_setattr() are thread safe.

Signed-off-by: Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/mq_getattr.3 | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/man3/mq_getattr.3 b/man3/mq_getattr.3
index 0fe370d..1c2321f 100644
--- a/man3/mq_getattr.3
+++ b/man3/mq_getattr.3
@@ -134,6 +134,13 @@ is invalid.
 .I newattr\->mq_flags
 contained set bits other than
 .BR O_NONBLOCK .
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR mq_getattr ()
+and
+.BR mq_setattr ()
+functions are thread-safe.
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH NOTES
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
