From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] qecvt.3: ATTRIBUTES: Note functions that are not thread-safe
Date: Wed, 15 May 2013 10:43:22 +0800
Message-ID: <1368585802-8689-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions qecvt() and qfcvt() are not thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/qecvt.3 | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/man3/qecvt.3 b/man3/qecvt.3
index 9cfa68d..07cbe59 100644
--- a/man3/qecvt.3
+++ b/man3/qecvt.3
@@ -69,6 +69,17 @@ See
 .BR ecvt (3)
 and
 .BR gcvt (3).
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The functions
+.BR qecvt ()
+and
+.BR qfcvt ()
+are not thread-safe.
+.LP
+The function
+.BR qgcvt ()
+is thread-safe.
 .SH CONFORMING TO
 SVr4.
 Not seen in most common UNIX implementations,
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
