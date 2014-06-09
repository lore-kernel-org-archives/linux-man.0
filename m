From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] catgets.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 9 Jun 2014 11:46:37 +0800
Message-ID: <1402285597-15574-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function catgets() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/catgets.3 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man3/catgets.3 b/man3/catgets.3
index 77ba89f..3101300 100644
--- a/man3/catgets.3
+++ b/man3/catgets.3
@@ -66,6 +66,11 @@ On failure,
 .BR catgets ()
 returns the value
 .IR message .
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR catgets ()
+function is thread-safe.
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
