From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] strtok.3: ATTRIBUTES: Note function that is not thread-safe
Date: Thu, 6 Jun 2013 11:25:17 +0800
Message-ID: <1370489117-21350-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function strtok() is not thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/strtok.3 | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/man3/strtok.3 b/man3/strtok.3
index 6895d38..754ed3e 100644
--- a/man3/strtok.3
+++ b/man3/strtok.3
@@ -110,6 +110,15 @@ and
 .BR strtok_r ()
 functions return a pointer to
 the next token, or NULL if there are no more tokens.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR strtok ()
+function is not thread-safe.
+.LP
+The
+.BR strtok_r ()
+function is thread-safe.
 .SH CONFORMING TO
 .TP
 .BR strtok ()
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
