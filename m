From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] encrypt.3: ATTRIBUTES: Note functions that are not thread-safe
Date: Mon, 6 May 2013 16:03:25 +0800
Message-ID: <1367827405-3608-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions encrypt() and setkey() are not thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/encrypt.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/encrypt.3 b/man3/encrypt.3
index 411cb22..50b0f15 100644
--- a/man3/encrypt.3
+++ b/man3/encrypt.3
@@ -121,6 +121,19 @@ On success, it is unchanged.
 .B ENOSYS
 The function is not provided.
 (For example because of former USA export restrictions.)
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The functions
+.BR encrypt ()
+and
+.BR setkey ()
+are not thread-safe.
+.LP
+The functions
+.BR encrypt_r ()
+and
+.BR setkey_r ()
+are thread-safe.
 .SH CONFORMING TO
 The functions
 .BR encrypt ()
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
