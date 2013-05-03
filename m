From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getgrent.3: ATTRIBUTES: Note function that is not thread-safe
Date: Fri, 3 May 2013 17:18:54 +0800
Message-ID: <1367572734-21974-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function getgrent() is not thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getgrent.3 | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/man3/getgrent.3 b/man3/getgrent.3
index ecf29fe..363fc15 100644
--- a/man3/getgrent.3
+++ b/man3/getgrent.3
@@ -152,6 +152,17 @@ Insufficient buffer space supplied.
 .TP
 .I /etc/group
 local group database file
+.SH ATTRIBUTES
+.SS Multithreading(see pthreads(7))
+The
+.BR getgrent()
+is not thread-safe.
+.LP
+The
+.BR setgrent()
+and
+.BR endgrent()
+functions are thread-safe.
 .SH CONFORMING TO
 SVr4, 4.3BSD, POSIX.1-2001.
 .SH SEE ALSO
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
