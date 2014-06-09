From: Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] mq_close.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 9 Jun 2014 15:50:38 +0800
Message-ID: <1402300238.1804.39.camel@fedora>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "mtk.manpages" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: carlos <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, aoliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The function mq_close() is thread safe.

Signed-off-by: Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/mq_close.3 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man3/mq_close.3 b/man3/mq_close.3
index 8020ce0..d61388b 100644
--- a/man3/mq_close.3
+++ b/man3/mq_close.3
@@ -56,6 +56,11 @@ set to indicate the error.
 The descriptor specified in
 .I mqdes
 is invalid.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR mq_close ()
+function is thread-safe.
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH NOTES
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
